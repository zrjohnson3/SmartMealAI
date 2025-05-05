import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PreferencesRecord extends FirestoreRecord {
  PreferencesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "goals" field.
  String? _goals;
  String get goals => _goals ?? '';
  bool hasGoals() => _goals != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "allergies_restrictions" field.
  List<String>? _allergiesRestrictions;
  List<String> get allergiesRestrictions => _allergiesRestrictions ?? const [];
  bool hasAllergiesRestrictions() => _allergiesRestrictions != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  bool hasWeight() => _weight != null;

  // "height" field.
  String? _height;
  String get height => _height ?? '';
  bool hasHeight() => _height != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "weekly_meal" field.
  String? _weeklyMeal;
  String get weeklyMeal => _weeklyMeal ?? '';
  bool hasWeeklyMeal() => _weeklyMeal != null;

  // "favorite_cuisine" field.
  List<String>? _favoriteCuisine;
  List<String> get favoriteCuisine => _favoriteCuisine ?? const [];
  bool hasFavoriteCuisine() => _favoriteCuisine != null;

  // "dietary_preferences" field.
  String? _dietaryPreferences;
  String get dietaryPreferences => _dietaryPreferences ?? '';
  bool hasDietaryPreferences() => _dietaryPreferences != null;

  // "activity_level" field.
  String? _activityLevel;
  String get activityLevel => _activityLevel ?? '';
  bool hasActivityLevel() => _activityLevel != null;

  // "cal_target" field.
  int? _calTarget;
  int get calTarget => _calTarget ?? 0;
  bool hasCalTarget() => _calTarget != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _goals = snapshotData['goals'] as String?;
    _notes = snapshotData['notes'] as String?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _gender = snapshotData['gender'] as String?;
    _allergiesRestrictions =
        getDataList(snapshotData['allergies_restrictions']);
    _weight = snapshotData['weight'] as String?;
    _height = snapshotData['height'] as String?;
    _age = snapshotData['age'] as String?;
    _weeklyMeal = snapshotData['weekly_meal'] as String?;
    _favoriteCuisine = getDataList(snapshotData['favorite_cuisine']);
    _dietaryPreferences = snapshotData['dietary_preferences'] as String?;
    _activityLevel = snapshotData['activity_level'] as String?;
    _calTarget = castToType<int>(snapshotData['cal_target']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('preferences')
          : FirebaseFirestore.instance.collectionGroup('preferences');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('preferences').doc(id);

  static Stream<PreferencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PreferencesRecord.fromSnapshot(s));

  static Future<PreferencesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PreferencesRecord.fromSnapshot(s));

  static PreferencesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PreferencesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PreferencesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PreferencesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PreferencesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PreferencesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPreferencesRecordData({
  String? goals,
  String? notes,
  DocumentReference? uid,
  String? gender,
  String? weight,
  String? height,
  String? age,
  String? weeklyMeal,
  String? dietaryPreferences,
  String? activityLevel,
  int? calTarget,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'goals': goals,
      'notes': notes,
      'uid': uid,
      'gender': gender,
      'weight': weight,
      'height': height,
      'age': age,
      'weekly_meal': weeklyMeal,
      'dietary_preferences': dietaryPreferences,
      'activity_level': activityLevel,
      'cal_target': calTarget,
    }.withoutNulls,
  );

  return firestoreData;
}

class PreferencesRecordDocumentEquality implements Equality<PreferencesRecord> {
  const PreferencesRecordDocumentEquality();

  @override
  bool equals(PreferencesRecord? e1, PreferencesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.goals == e2?.goals &&
        e1?.notes == e2?.notes &&
        e1?.uid == e2?.uid &&
        e1?.gender == e2?.gender &&
        listEquality.equals(
            e1?.allergiesRestrictions, e2?.allergiesRestrictions) &&
        e1?.weight == e2?.weight &&
        e1?.height == e2?.height &&
        e1?.age == e2?.age &&
        e1?.weeklyMeal == e2?.weeklyMeal &&
        listEquality.equals(e1?.favoriteCuisine, e2?.favoriteCuisine) &&
        e1?.dietaryPreferences == e2?.dietaryPreferences &&
        e1?.activityLevel == e2?.activityLevel &&
        e1?.calTarget == e2?.calTarget;
  }

  @override
  int hash(PreferencesRecord? e) => const ListEquality().hash([
        e?.goals,
        e?.notes,
        e?.uid,
        e?.gender,
        e?.allergiesRestrictions,
        e?.weight,
        e?.height,
        e?.age,
        e?.weeklyMeal,
        e?.favoriteCuisine,
        e?.dietaryPreferences,
        e?.activityLevel,
        e?.calTarget
      ]);

  @override
  bool isValidKey(Object? o) => o is PreferencesRecord;
}
