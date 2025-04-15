import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserMealsRecord extends FirestoreRecord {
  UserMealsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "mealName" field.
  String? _mealName;
  String get mealName => _mealName ?? '';
  bool hasMealName() => _mealName != null;

  // "mealCalories" field.
  double? _mealCalories;
  double get mealCalories => _mealCalories ?? 0.0;
  bool hasMealCalories() => _mealCalories != null;

  // "mealRecipe" field.
  List<String>? _mealRecipe;
  List<String> get mealRecipe => _mealRecipe ?? const [];
  bool hasMealRecipe() => _mealRecipe != null;

  // "mealImage" field.
  String? _mealImage;
  String get mealImage => _mealImage ?? '';
  bool hasMealImage() => _mealImage != null;

  // "isFavorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  bool hasIsFavorite() => _isFavorite != null;

  // "mealRecipeURL" field.
  String? _mealRecipeURL;
  String get mealRecipeURL => _mealRecipeURL ?? '';
  bool hasMealRecipeURL() => _mealRecipeURL != null;

  // "mealNutrients" field.
  String? _mealNutrients;
  String get mealNutrients => _mealNutrients ?? '';
  bool hasMealNutrients() => _mealNutrients != null;

  // "mealServings" field.
  int? _mealServings;
  int get mealServings => _mealServings ?? 0;
  bool hasMealServings() => _mealServings != null;

  // "mealCaloriesInt" field.
  int? _mealCaloriesInt;
  int get mealCaloriesInt => _mealCaloriesInt ?? 0;
  bool hasMealCaloriesInt() => _mealCaloriesInt != null;

  // "whenCreated" field.
  DateTime? _whenCreated;
  DateTime? get whenCreated => _whenCreated;
  bool hasWhenCreated() => _whenCreated != null;

  // "cuisineType" field.
  String? _cuisineType;
  String get cuisineType => _cuisineType ?? '';
  bool hasCuisineType() => _cuisineType != null;

  // "mealCategory" field.
  String? _mealCategory;
  String get mealCategory => _mealCategory ?? '';
  bool hasMealCategory() => _mealCategory != null;

  // "mealDay" field.
  int? _mealDay;
  int get mealDay => _mealDay ?? 0;
  bool hasMealDay() => _mealDay != null;

  // "mealMark" field.
  int? _mealMark;
  int get mealMark => _mealMark ?? 0;
  bool hasMealMark() => _mealMark != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _mealName = snapshotData['mealName'] as String?;
    _mealCalories = castToType<double>(snapshotData['mealCalories']);
    _mealRecipe = getDataList(snapshotData['mealRecipe']);
    _mealImage = snapshotData['mealImage'] as String?;
    _isFavorite = snapshotData['isFavorite'] as bool?;
    _mealRecipeURL = snapshotData['mealRecipeURL'] as String?;
    _mealNutrients = snapshotData['mealNutrients'] as String?;
    _mealServings = castToType<int>(snapshotData['mealServings']);
    _mealCaloriesInt = castToType<int>(snapshotData['mealCaloriesInt']);
    _whenCreated = snapshotData['whenCreated'] as DateTime?;
    _cuisineType = snapshotData['cuisineType'] as String?;
    _mealCategory = snapshotData['mealCategory'] as String?;
    _mealDay = castToType<int>(snapshotData['mealDay']);
    _mealMark = castToType<int>(snapshotData['mealMark']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userMeals')
          : FirebaseFirestore.instance.collectionGroup('userMeals');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userMeals').doc(id);

  static Stream<UserMealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserMealsRecord.fromSnapshot(s));

  static Future<UserMealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserMealsRecord.fromSnapshot(s));

  static UserMealsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserMealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserMealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserMealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserMealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserMealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserMealsRecordData({
  DocumentReference? uid,
  String? mealName,
  double? mealCalories,
  String? mealImage,
  bool? isFavorite,
  String? mealRecipeURL,
  String? mealNutrients,
  int? mealServings,
  int? mealCaloriesInt,
  DateTime? whenCreated,
  String? cuisineType,
  String? mealCategory,
  int? mealDay,
  int? mealMark,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'mealName': mealName,
      'mealCalories': mealCalories,
      'mealImage': mealImage,
      'isFavorite': isFavorite,
      'mealRecipeURL': mealRecipeURL,
      'mealNutrients': mealNutrients,
      'mealServings': mealServings,
      'mealCaloriesInt': mealCaloriesInt,
      'whenCreated': whenCreated,
      'cuisineType': cuisineType,
      'mealCategory': mealCategory,
      'mealDay': mealDay,
      'mealMark': mealMark,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserMealsRecordDocumentEquality implements Equality<UserMealsRecord> {
  const UserMealsRecordDocumentEquality();

  @override
  bool equals(UserMealsRecord? e1, UserMealsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.mealName == e2?.mealName &&
        e1?.mealCalories == e2?.mealCalories &&
        listEquality.equals(e1?.mealRecipe, e2?.mealRecipe) &&
        e1?.mealImage == e2?.mealImage &&
        e1?.isFavorite == e2?.isFavorite &&
        e1?.mealRecipeURL == e2?.mealRecipeURL &&
        e1?.mealNutrients == e2?.mealNutrients &&
        e1?.mealServings == e2?.mealServings &&
        e1?.mealCaloriesInt == e2?.mealCaloriesInt &&
        e1?.whenCreated == e2?.whenCreated &&
        e1?.cuisineType == e2?.cuisineType &&
        e1?.mealCategory == e2?.mealCategory &&
        e1?.mealDay == e2?.mealDay &&
        e1?.mealMark == e2?.mealMark;
  }

  @override
  int hash(UserMealsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.mealName,
        e?.mealCalories,
        e?.mealRecipe,
        e?.mealImage,
        e?.isFavorite,
        e?.mealRecipeURL,
        e?.mealNutrients,
        e?.mealServings,
        e?.mealCaloriesInt,
        e?.whenCreated,
        e?.cuisineType,
        e?.mealCategory,
        e?.mealDay,
        e?.mealMark
      ]);

  @override
  bool isValidKey(Object? o) => o is UserMealsRecord;
}
