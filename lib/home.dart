import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'controller.dart';

class MyHomePage extends StatelessWidget {
  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: controller.getInputName,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Last Name'),
                onChanged: controller.getInputLastName,
              ),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return Text('${controller.fullName}');
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
