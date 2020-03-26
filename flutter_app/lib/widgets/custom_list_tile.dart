import 'package:flutter/material.dart';
import 'package:flutter_app/classes/entity.dart'; 
import 'package:flutter_app/widgets/custom_dialog.dart'; 

class CustomListTile extends StatelessWidget {
  Entity entity; 

  CustomListTile({this.entity}); 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(entity.name), 
      subtitle: Text('#${entity.id}'),
      onTap: () => Navigator.of(context).pushNamed('/show_entity',
        arguments: entity,  
      ),
      onLongPress: () => CustomDialog.showDeleteDialog(
        context: context, 
        entity: entity 
      )
    );
  }
}