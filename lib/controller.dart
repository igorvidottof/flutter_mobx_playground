import 'package:mobx/mobx.dart';
// run flutter pub run build_runner build on terminal for that to work
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  var name = '';
  @observable
  var lastName = '';

  // used to merge two properties in this class
  @computed
  String get fullName => '$name $lastName';

  @action
  void getInputName(String inputName) {
    name = inputName;
  }

  @action
  void getInputLastName(String inputLastName) {
    lastName = inputLastName;
  }

}