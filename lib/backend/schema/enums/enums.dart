import 'package:collection/collection.dart';

/// User or assistant options
enum RoleEnum {
  assistant,
  user,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (RoleEnum):
      return RoleEnum.values.deserialize(value) as T?;
    default:
      return null;
  }
}
