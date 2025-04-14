import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFavoriteMealsRecord extends FirestoreRecord {
  UserFavoriteMealsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "mealNameFav" field.
  String? _mealNameFav;
  String get mealNameFav => _mealNameFav ?? '';
  bool hasMealNameFav() => _mealNameFav != null;

  // "mealCaloriesFav" field.
  double? _mealCaloriesFav;
  double get mealCaloriesFav => _mealCaloriesFav ?? 0.0;
  bool hasMealCaloriesFav() => _mealCaloriesFav != null;

  // "mealRecipeFav" field.
  List<String>? _mealRecipeFav;
  List<String> get mealRecipeFav => _mealRecipeFav ?? const [];
  bool hasMealRecipeFav() => _mealRecipeFav != null;

  // "mealImageFav" field.
  String? _mealImageFav;
  String get mealImageFav => _mealImageFav ?? '';
  bool hasMealImageFav() => _mealImageFav != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _mealNameFav = snapshotData['mealNameFav'] as String?;
    _mealCaloriesFav = castToType<double>(snapshotData['mealCaloriesFav']);
    _mealRecipeFav = getDataList(snapshotData['mealRecipeFav']);
    _mealImageFav = snapshotData['mealImageFav'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userFavoriteMeals')
          : FirebaseFirestore.instance.collectionGroup('userFavoriteMeals');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userFavoriteMeals').doc(id);

  static Stream<UserFavoriteMealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserFavoriteMealsRecord.fromSnapshot(s));

  static Future<UserFavoriteMealsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserFavoriteMealsRecord.fromSnapshot(s));

  static UserFavoriteMealsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserFavoriteMealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserFavoriteMealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserFavoriteMealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserFavoriteMealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserFavoriteMealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserFavoriteMealsRecordData({
  DocumentReference? uid,
  String? mealNameFav,
  double? mealCaloriesFav,
  String? mealImageFav,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'mealNameFav': mealNameFav,
      'mealCaloriesFav': mealCaloriesFav,
      'mealImageFav': mealImageFav,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserFavoriteMealsRecordDocumentEquality
    implements Equality<UserFavoriteMealsRecord> {
  const UserFavoriteMealsRecordDocumentEquality();

  @override
  bool equals(UserFavoriteMealsRecord? e1, UserFavoriteMealsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.mealNameFav == e2?.mealNameFav &&
        e1?.mealCaloriesFav == e2?.mealCaloriesFav &&
        listEquality.equals(e1?.mealRecipeFav, e2?.mealRecipeFav) &&
        e1?.mealImageFav == e2?.mealImageFav;
  }

  @override
  int hash(UserFavoriteMealsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.mealNameFav,
        e?.mealCaloriesFav,
        e?.mealRecipeFav,
        e?.mealImageFav
      ]);

  @override
  bool isValidKey(Object? o) => o is UserFavoriteMealsRecord;
}
