import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_playground/body_widget.dart';
import 'package:provider/provider.dart';

import './controller.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Observer(
        builder: (_) {
          return Text(
              controller.isValid ? 'Valid Form' : 'Non-Valid Form');
        },
      )),
      body: BodyWidget(),
    );
  }
}
