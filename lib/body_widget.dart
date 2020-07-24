import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'controller.dart';


class BodyWidget extends StatelessWidget {
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
    final controller = GetIt.I.get<Controller>();
    return SingleChildScrollView(
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
    );
  }
}
