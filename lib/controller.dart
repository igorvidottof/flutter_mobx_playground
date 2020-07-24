import 'package:mobx/mobx.dart';

import './models/client.dart';

part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty)
      return 'Please, provide a name';
    if (client.name.length < 3)
      return 'Your name should be at least 3 characters long';

    return null;
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty)
      return 'Please, provide an email';
    if (!client.email.contains('@'))
      return 'This is not a valid email';

    return null;
  }

  dispose() {
    
  }
}
