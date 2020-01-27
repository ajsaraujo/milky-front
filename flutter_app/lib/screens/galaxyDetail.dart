import 'package:flutter/material.dart';
import 'package:flutter_app/classes/galaxy.dart';

class GalaxyDetailPage extends StatelessWidget {
  final Galaxy galaxy;
  bool _isEditing = false;
  GalaxyDetailPage(this.galaxy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(galaxy.name),
        actions: <Widget>[Icon(Icons.edit), Padding(padding: EdgeInsets.only(left: 8.0),) , Icon(Icons.exit_to_app)],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: "Id:\n",
                  style: new TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "#" + galaxy.id.toString(),
                        style: new TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal))
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Distância da terra:\n",
                  style: new TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: galaxy.distanceToEarth.toString() + " anos luz",
                        style: new TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal))
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Quantidade de sistemas:\n",
                  style: new TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: galaxy.numOfSystems.toString(),
                        style: new TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
