import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_playground/custom_list_item.dart';
import 'package:flutter_mobx_playground/home_controller.dart';
import 'package:flutter_mobx_playground/models/list_item_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();

  void _showAddDialog() {
    var listItem = ListItemModel();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            onChanged: listItem.setTitle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'New Item',
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                controller.addItem(listItem);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.setFilter,
          cursorColor: Colors.white,
          decoration: InputDecoration(hintText: 'Search for...'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Observer(
              builder: (_) {
                return Text('${controller.totalChecked}');
              },
            ),
            onPressed: null,
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.filteredList.length,
            itemBuilder: (_, i) {
              var listItem = controller.filteredList[i];
              return CustomListItem(
                listItem: listItem,
                removeClicked: () {
                  controller.removeItem(listItem);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }
}
