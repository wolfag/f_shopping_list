import 'package:flutter/foundation.dart';
import 'package:f_shopping_list/schemas/item.dart';
import 'package:realm/realm.dart';

class ItemService {
  final Configuration _config =
      Configuration.local([Item.schema], isReadOnly: false);
  late Realm _realm;

  ItemService() {
    openRealm();
  }

  openRealm() {
    _realm = Realm(_config);
  }

  closeRealm() {
    if (!_realm.isClosed) {
      _realm.close();
    }
  }

  RealmResults<Item> getItems() {
    return _realm.all<Item>();
  }

  bool addItem(String text) {
    try {
      _realm.write(() {
        _realm.add<Item>(Item(ObjectId(), text, false));
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool toggleItemStatus(Item item) {
    try {
      _realm.write(() {
        item.done = !item.done;
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  bool deleteItem(Item item) {
    try {
      _realm.write(() {
        _realm.delete(item);
      });
      return true;
    } on RealmException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }
}
