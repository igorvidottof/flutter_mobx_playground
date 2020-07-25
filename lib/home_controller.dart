import 'package:flutter_mobx_playground/models/list_item_model.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ListItemModel> listItems = [
    ListItemModel(title: 'Item 1', check: true),
    ListItemModel(title: 'Item 2', check: false),
    ListItemModel(title: 'Item 3', check: false),
  ].asObservable();

  @computed
  int get totalChecked => listItems.where((item) => item.check).length;

  @computed
  List<ListItemModel> get filteredList {
    if (filter.isEmpty) return listItems;
    return listItems
        .where(
            (item) => item.title.toLowerCase().contains(filter.toLowerCase()))
        .toList();
  }

  @observable
  String filter = '';

  @action
  setFilter(String value) => filter = value;

  @action
  void addItem(ListItemModel item) {
    listItems.add(item);
  }

  @action
  void removeItem(ListItemModel item) {
    listItems.removeWhere((listItem) => listItem.title == item.title);
  }
}
