import 'package:built_collection/built_collection.dart';

class BuiltValuesHelpers {
  BuiltList<dynamic> joinBuiltList(
      BuiltList<dynamic> start, BuiltList<dynamic> end) {
    final BuiltList<dynamic> list = start.rebuild((c) => c.addAll(end));
    return list;
  }
}
