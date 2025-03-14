import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealsRecord extends FirestoreRecord {
  MealsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mealPlanId" field.
  String? _mealPlanId;
  String get mealPlanId => _mealPlanId ?? '';
  bool hasMealPlanId() => _mealPlanId != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "week" field.
  DateTime? _week;
  DateTime? get week => _week;
  bool hasWeek() => _week != null;

  // "meals" field.
  List<DocumentReference>? _meals;
  List<DocumentReference> get meals => _meals ?? const [];
  bool hasMeals() => _meals != null;

  // "days" field.
  List<String>? _days;
  List<String> get days => _days ?? const [];
  bool hasDays() => _days != null;

  void _initializeFields() {
    _mealPlanId = snapshotData['mealPlanId'] as String?;
    _userId = snapshotData['userId'] as String?;
    _week = snapshotData['week'] as DateTime?;
    _meals = getDataList(snapshotData['meals']);
    _days = getDataList(snapshotData['days']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meals');

  static Stream<MealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealsRecord.fromSnapshot(s));

  static Future<MealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealsRecord.fromSnapshot(s));

  static MealsRecord fromSnapshot(DocumentSnapshot snapshot) => MealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealsRecordData({
  String? mealPlanId,
  String? userId,
  DateTime? week,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mealPlanId': mealPlanId,
      'userId': userId,
      'week': week,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealsRecordDocumentEquality implements Equality<MealsRecord> {
  const MealsRecordDocumentEquality();

  @override
  bool equals(MealsRecord? e1, MealsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.mealPlanId == e2?.mealPlanId &&
        e1?.userId == e2?.userId &&
        e1?.week == e2?.week &&
        listEquality.equals(e1?.meals, e2?.meals) &&
        listEquality.equals(e1?.days, e2?.days);
  }

  @override
  int hash(MealsRecord? e) => const ListEquality()
      .hash([e?.mealPlanId, e?.userId, e?.week, e?.meals, e?.days]);

  @override
  bool isValidKey(Object? o) => o is MealsRecord;
}
