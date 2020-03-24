import 'package:flutter/material.dart';
import 'package:flutter_app/classes/entity.dart';

class DashboardCard extends StatelessWidget {
  DashboardCard({this.entity, this.icon}); 

  final Entity entity; 
  final icon; 

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.all(8.0),
      child: Container(
        decoration:
            BoxDecoration(color: Colors.white), // Pode ser alterado depois.
        child: InkWell(
          splashColor: Colors.deepPurple,
          onTap: () =>
              Navigator.of(context).pushNamed('/list_all', arguments: entity),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(this.icon,
                      size: 40.0,
                      color: Colors.deepPurple // Pode ser alterado depois.
                      )),
              SizedBox(height: 20.0),
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      entity.type,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700),
                    ),
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
