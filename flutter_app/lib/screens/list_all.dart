import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_app/widgets/custom_app_bar.dart'; 
import 'package:flutter_app/classes/entity.dart';
import 'package:flutter_app/control/string_tuple.dart';
import 'package:flutter_app/control/connection.dart';   
import 'dart:convert';

// ListAll listará todas as instâncias de uma determinada
// entidade. Ex: todas as estrelas, todas as galáxias, etc.
class ListAll extends StatefulWidget {
  StringTuple _myStringTuple;

  StringTuple get myStringTuple => this._myStringTuple; 

  ListAll(this._myStringTuple); 

  @override
  _ListAllState createState() => _ListAllState();
}

class _ListAllState extends State<ListAll> {

  // Pega todas as instâncias de entidades do tipo entityType no backend. 
  Future<List<Entity>> _getData() async {
    //var data = await http.get('http://www.json-generator.com/api/json/get/caBlfnyVcO?indent=2');
    print('Tentando conectar em ${Connection.hostname()}/api/all_entities/${widget._myStringTuple.controlName}');
    var data = await http.get('${Connection.hostname()}/api/all_entities/${widget._myStringTuple.controlName}'); 
    print('A resposta chegou!');
    print('Tentando decodificar o corpo...');
    print('${data.body}');
    var jsonData = json.decode(data.body);
    print('Decodifiquei o corpo...'); 
    List<Entity> myList = []; 
    print('Adicionando itens à lista...');
    for (var jsonEntity in jsonData)
      myList.add(Entity.parseJson(jsonEntity, widget._myStringTuple)); 
    print('${jsonData.toString()}');
    print('Comprimento: ${myList.length}'); 
    return myList; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.myStringTuple.viewName),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, color: Theme.of(context).accentColor),
        onPressed: () => Navigator.of(context).pushNamed(
          '/new_entity',
          arguments: widget._myStringTuple
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getData(), 
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // Em Dart, podemos fazer comparações com null legalmente? 
            if (snapshot.data == null)
              return Container(child: Center(child: CircularProgressIndicator(),),);
            return ListView.builder(
              itemCount: snapshot.data.length, 
              itemBuilder: (BuildContext context, int index) => snapshot.data[index].makeListTile()
            );
          }
        )
      ),
    );
  }
}