import 'package:flutter/material.dart'; 
import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter_app/widgets/custom_app_bar.dart'; 

class EditScreen extends StatefulWidget {
  final Entity entity; 
  
  EditScreen({this.entity}); 

  @override
  _EditScreenState createState() => _EditScreenState(entity: this.entity);
}

class _EditScreenState extends State<EditScreen> {
  final Entity entity; 
  final scaffoldKey = GlobalKey<ScaffoldState>();

  _EditScreenState({this.entity});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: this.scaffoldKey, 
        appBar: CustomAppBar(
          title: '${entity.type} ${entity.id}', 
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: entity.makeForm(false),
                        )))));
  }
}