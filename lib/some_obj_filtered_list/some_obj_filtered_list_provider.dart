import 'package:flutter/foundation.dart';

class SomeObjFilteredListProvider extends ChangeNotifier {
  List<SomeObject> _someObjects = List<SomeObject>.empty(growable: true);
  List<SomeObject> _filteredObjects = List<SomeObject>.empty(growable: true);
  String? someEnum;
  String? someString;
  int? intFrom;
  int? intTo;
  DateTime? dateFrom;
  DateTime? dateTo;

  List<SomeObject> get filteredObjects => _filteredObjects;

  SomeObjFilteredListProvider({
    List<SomeObject>? someList,
  }) {
    if (someList != null) {
      _someObjects.addAll(someList);
      _filteredObjects = _someObjects;
    }
  }

  void filterList() {
    _filteredObjects = _someObjects;
    if (someEnum != null) {
      _filteredObjects = _filteredObjects
          .where((i) => i.someEnum
              .toString()
              .toLowerCase()
              .contains(someEnum!.toLowerCase()))
          .toList();
    }
    if (someString != null) {
      _filteredObjects = _filteredObjects
          .where((i) =>
              i.someString.toLowerCase().contains(someString!.toLowerCase()))
          .toList();
    }
    if (intFrom != null) {
      _filteredObjects =
          _filteredObjects.where((i) => i.someInt > intFrom!).toList();
    }
    if (intTo != null) {
      _filteredObjects = _filteredObjects.where((i) => i.someInt < intTo!).toList();
    }
    if (dateFrom != null) {
      _filteredObjects =
          _filteredObjects.where((i) => i.someDate.isAfter(dateFrom!)).toList();
    }
    if (dateTo != null) {
      _filteredObjects =
          _filteredObjects.where((i) => i.someDate.isBefore(dateTo!)).toList();
    }
    notifyListeners();
  }
}

class SomeObject {
  final Weeks someEnum;
  final String someString;
  final int someInt;
  final DateTime someDate;

  SomeObject(this.someEnum, this.someString, this.someInt, this.someDate);
}

enum Weeks {
  SUN,
  MON,
  TUES,
  WED,
  THU,
  FRI,
  SAT,
}
