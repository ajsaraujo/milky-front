import 'package:flutter/material.dart';

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
        leading: Icon(Icons.exit_to_app),
        actions: <Widget>[Icon(Icons.settings)],
        elevation: .1,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(3.0),
            children: <Widget>[
              makeDashboardCard(Icons.person, 'Planeta'),
              makeDashboardCard(Icons.person, 'Sistema'),
              makeDashboardCard(Icons.person, 'Galáxia'),
              makeDashboardCard(Icons.person, 'Satélite'),
              makeDashboardCard(Icons.person, 'Estrela'),
            ],
          ))
      //Teste do grid
      /*body: Center(
          child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 50.0),
        children: <Widget>[
          selecEntidade(Icon(Icons.star), 'Planeta'),
          selecEntidade(Icon(Icons.satellite), 'Satélite'),
          selecEntidade(Icon(Icons.star_border), 'Estrela'),
          selecEntidade(Icon(Icons.system_update), 'Sistema'),
          selecEntidade(Icon(Icons.gavel), 'Galáxia'),
        ],
      ))*/
      ,
    );
  }

  Widget makeDashboardCard(IconData icon, String title) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white), // Podemos alterar dps
        child: InkWell(
          splashColor: Colors.deepPurple,
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(icon,
                      size: 40.0,
                      color: Colors.deepPurple // pode ser alterado mais tarde
                      )),
              SizedBox(height: 20.0),
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      title,
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

  Widget selecEntidade(Icon icon, String nome) {
    return Container(
        child: InkWell(
      splashColor: Colors.blueGrey,
      onTap: () {},
      child: Card(
        elevation: 5.0,
        child: Padding(
          //padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              icon,
              Text(
                nome,
                style: TextStyle(color: Colors.purple, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
