import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_app/classes/galaxy.dart';
import 'package:flutter_app/screens/galaxy_detail.dart';

/*class Galaxy {
  String name;
  String id;
  String numOfSystems;
  String distanceToEarth;

  Galaxy(this.name, this.id, this.numOfSystems, this.distanceToEarth);
}*/

class GalaxyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new GalaxyListState();
}

class GalaxyListState extends State<GalaxyList> {
  //Método que popula a lista de galaxias provisoriamente
  Future<List<Galaxy>> _getGalaxies() async {
    var data = await http.get('http://www.json-generator.com/api/json/get/cebUnrbDqW?indent=2');
    var jsonData = json.decode(data.body);

    List<Galaxy> galaxies = [];
    for (var g in jsonData) {
      Galaxy galaxy =
          Galaxy(g["name"], g["id"], g["numOfSystems"], g["distanceToEarth"]);
      galaxies.add(galaxy);
      print('Galaxy added');
    }

    print(galaxies.length);
    return galaxies;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Galaxias'),
        actions: <Widget>[Icon(Icons.exit_to_app)],
      ),
      body: Container(
        child: FutureBuilder(
          future: _getGalaxies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.data == null){
              return Container(child: Center(child: CircularProgressIndicator(),),);
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].name), 
                    subtitle: Text('A ' + snapshot.data[index].distanceToEarth.toString() + ' anos luz da terra'),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GalaxyDetailPage(snapshot.data[index]))),
                    );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
