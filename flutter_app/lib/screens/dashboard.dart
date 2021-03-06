import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';
import 'package:flutter_app/widgets/dashboard_card.dart'; 
import 'package:flutter_app/classes/planet.dart'; 
import 'package:flutter_app/classes/system.dart';
import 'package:flutter_app/classes/galaxy.dart';
import 'package:flutter_app/classes/satellite.dart'; 
import 'package:flutter_app/classes/star.dart'; 

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Selecione uma entidade'),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(3.0),
            children: <Widget>[
              DashboardCard(
                icon: Icons.person, 
                entity: Planet.emptyPlanet(),
              ),
              DashboardCard(
                icon: Icons.person, 
                entity: System.emptySystem(), 
              ),
              DashboardCard(
                icon: Icons.person, 
                entity: Galaxy.emptyGalaxy(), 
              ),
              DashboardCard(
                icon: Icons.person, 
                entity: Satellite.emptySatellite(), 
              ),
              DashboardCard(
                icon: Icons.person,
                entity: Star.emptyStar(), 
              ),
            ],
          )),
    );
  }
}
