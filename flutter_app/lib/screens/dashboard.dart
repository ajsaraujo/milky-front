import 'package:flutter/material.dart';
import 'package:flutter_app/screens/listGalaxy.dart';
import 'package:flutter_app/control/string_tuple.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Selecione uma entidade',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.exit_to_app), /*Icon(Icons.settings)*/
        ],
        elevation: .1,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(3.0),
            children: <Widget>[
              makeDashboardCard(context, Icons.person,
                  StringTuple.makeStringTupleFor('planet')),
              makeDashboardCard(context, Icons.person,
                  StringTuple.makeStringTupleFor('system')),
              makeDashboardCard(context, Icons.person,
                  StringTuple.makeStringTupleFor('galaxy')),
              makeDashboardCard(context, Icons.person,
                  StringTuple.makeStringTupleFor('satellite')),
              makeDashboardCard(context, Icons.person,
                  StringTuple.makeStringTupleFor('star')),
            ],
          )),
    );
  }

  Widget makeDashboardCard(
      BuildContext context, IconData icon, StringTuple myStringTuple) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.all(8.0),
      child: Container(
        decoration:
            BoxDecoration(color: Colors.white), // Pode ser alterado depois.
        child: InkWell(
          splashColor: Colors.deepPurple,
          onTap: () => Navigator.of(context)
              .pushNamed('/list_all', arguments: myStringTuple),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(icon,
                      size: 40.0,
                      color: Colors.deepPurple // Pode ser alterado depois.
                      )),
              SizedBox(height: 20.0),
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      myStringTuple.viewName,
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
