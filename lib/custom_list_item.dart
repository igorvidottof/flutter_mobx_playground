import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_playground/models/list_item_model.dart';

class CustomListItem extends StatelessWidget {
  final ListItemModel listItem;
  // callback function to listen to where the remove button is clicked
  final Function removeClicked;

  const CustomListItem({Key key, this.listItem, this.removeClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          leading: Checkbox(
            value: listItem.check,
            onChanged: listItem.setCheck,
          ),
          title: Text(listItem.title),
          trailing: IconButton(
            color: Colors.red,
            icon: Icon(Icons.remove_circle),
            onPressed: removeClicked,
          ),
        );
      },
    );
  }
}
