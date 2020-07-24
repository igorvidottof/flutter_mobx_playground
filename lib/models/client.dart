import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  @observable
  String name;
  @observable
  String email;
  @observable
  String cpf;

  @action
  void setName(String value) => name = value;
  @action
  void setEmail(String value) => email = value;
}