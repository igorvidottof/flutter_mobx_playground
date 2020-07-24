import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import './controller.dart';

class MyHomePage extends StatelessWidget {
  final controller = Controller();

  _textField({String labelText, onChanged, String Function() getError}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: getError == null ? null : getError(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(60),
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_) {
                  return _textField(
                    labelText: 'Name',
                    onChanged: controller.client.setName,
                    getError: controller.validateName,
                  );
                },
              ),
              SizedBox(height: 20),
              Observer(
                builder: (_) {
                  return _textField(
                    labelText: 'Email',
                    onChanged: controller.client.setEmail,
                    getError: controller.validateEmail,
                  );
                },
              ),
              SizedBox(height: 50),
              Observer(
                builder: (_) {
                  return RaisedButton(
                    onPressed: controller.isValid ? () {} : null,
                    child: Text('Salvar'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
