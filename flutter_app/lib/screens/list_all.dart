import 'package:flutter/material.dart';
import 'package:flutter_app/screens/custom_app_bar.dart'; 
import 'package:http/http.dart' as http;
import 'package:flutter_app/classes/entity.dart';
import 'package:flutter_app/control/string_tuple.dart';  
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
    // TODO: Mudar o request abaixo para uma rota gerada dinamicamente. 
    var data = await http.get('http://www.json-generator.com/api/json/get/caBlfnyVcO?indent=2');
    var jsonData = json.decode(data.body);

    List<Entity> myList = []; 
    for (var jsonEntity in jsonData)
      myList.add(Entity.parseJson(jsonEntity)); 
    
    return myList; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.makeAppBar(widget.myStringTuple.viewName, context),
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