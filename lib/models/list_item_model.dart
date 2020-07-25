import 'package:mobx/mobx.dart';
part 'list_item_model.g.dart';

class ListItemModel = _ListItemModelBase with _$ListItemModel;

abstract class _ListItemModelBase with Store {
  _ListItemModelBase({this.title, this.check = false});

  @observable
  String title;

  @observable
  bool check;

  @action
  void setTitle(String value) => title = value;
  
  @action
  void setCheck(bool value) => check = value;

}
