import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_app/widgets/custom_app_bar.dart'; 
import 'package:flutter_app/classes/entity.dart';
import 'package:flutter_app/control/connection.dart';   
import 'dart:convert';

// ListAll listará todas as instâncias de uma determinada
// entidade. Ex: todas as estrelas, todas as galáxias, etc.
class ListAll extends StatefulWidget {
  Entity entity; 

  ListAll(this.entity); 

  @override
  _ListAllState createState() => _ListAllState();
}

class _ListAllState extends State<ListAll> {

  Future<List<Entity>> _getData() async {
    print('\n\nEnviando requisição...'); 
    var data = await http.get('${Connection.hostname()}/api/${widget.entity.controlName}'); 
    var jsonData = json.decode(data.body);
    List<Entity> myList = []; 
    print('StatusCode: ${data.statusCode}'); 
    for (var json in jsonData) {
      myList.add(widget.entity.fromJson(json));
    }
    print('Peguei da Web: ${myList}\n\n'); 
    return myList; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.entity.type),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add, color: Theme.of(context).accentColor),
        onPressed: () => Navigator.of(context).pushNamed(
          '/new_entity',
          arguments: widget.entity,
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
              itemBuilder: (BuildContext context, int index) => snapshot.data[index].makeListTile(context)
            );
          }
        )
      ),
    );
  }
}