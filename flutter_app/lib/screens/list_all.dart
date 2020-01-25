import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;
import 'package:flutter_app/classes/entity.dart'; 
import 'dart:convert';

// ListAll listará todas as instâncias de uma determinada
// entidade. Ex: todas as estrelas, todas as galáxias, etc.
class ListAll extends StatefulWidget {
  // O tipo de entidade que será listado. Ex: 'star', 'galaxy', 'planet'... 
  String _entityType;
  // O nome da entidade que será exibido para o usuário. Ex: 'Estrela', 'Galáxia'... 
  String _entityLabel; 

  ListAll(this._entityType, this._entityLabel); 

  @override
  _ListAllState createState() => _ListAllState(_entityType, _entityLabel);
}

class _ListAllState extends State<ListAll> {
  // O tipo de entidade que será listado. Ex: 'star', 'galaxy', 'planet'... 
  String _entityType;
  // O nome da entidade que será exibido para o usuário. Ex: 'Estrela', 'Galáxia'... 
  String _entityLabel;

  // Codamos o mesmo construtor duas vezes.
  // TODO: Procurar saber como faz para deixar só um.  
  _ListAllState(this._entityType, this._entityLabel); 
  
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(_entityLabel),
        actions: <Widget>[Icon(Icons.exit_to_app)],
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