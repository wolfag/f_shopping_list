import 'package:realm/realm.dart';
part 'item.g.dart';

@RealmModel()
class _Item {
  @PrimaryKey()
  late ObjectId id;

  late String text;
  late bool done;
}
