import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        //Nome pode ser pego via cookie setado no login
        title: Text('Nome Usuário', style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.exit_to_app),
      ),
      //Teste do grid
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.only(top: 50.0),
          children: <Widget>[
            selecEntidade(Icon(Icons.star), 'Planeta'),
            selecEntidade(Icon(Icons.satellite), 'Satélite'),
            selecEntidade(Icon(Icons.star_border), 'Estrela'),
            selecEntidade(Icon(Icons.person), 'Anãs'),
            selecEntidade(Icon(Icons.person_add), 'Gigantes'),
            selecEntidade(Icon(Icons.system_update), 'Sistema'),
            selecEntidade(Icon(Icons.gavel), 'Galáxia'),
          ],
        )
      ),
    );
  }

  Widget selecEntidade(Icon icon, String nome) {
    return Container(
      child: InkWell(
        splashColor: Colors.blueGrey,
        onTap: () => {},
              child: Card(
          elevation: 5.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
            icon, 
              Text(
                nome,
                style: TextStyle(color: Colors.purple, fontSize: 20.0),
              ),
          ],),
        ),
      )
    );
  }
}
/*Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                vaFacaIsso('Planeta'),
                vaFacaIsso('Estrela'),
                vaFacaIsso('Galáxia'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                vaFacaIsso('Satélite'),
                vaFacaIsso('Sistema'),
                vaFacaIsso('Buzz'),
              ],
            )
          ],
        ),*/