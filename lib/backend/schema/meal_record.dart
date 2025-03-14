import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MealRecord extends FirestoreRecord {
  MealRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "ingredients" field.
  List<String>? _ingredients;
  List<String> get ingredients => _ingredients ?? const [];
  bool hasIngredients() => _ingredients != null;

  // "instructions" field.
  String? _instructions;
  String get instructions => _instructions ?? '';
  bool hasInstructions() => _instructions != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "recipeUrl" field.
  String? _recipeUrl;
  String get recipeUrl => _recipeUrl ?? '';
  bool hasRecipeUrl() => _recipeUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _ingredients = getDataList(snapshotData['ingredients']);
    _instructions = snapshotData['instructions'] as String?;
    _image = snapshotData['image'] as String?;
    _recipeUrl = snapshotData['recipeUrl'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('meal')
          : FirebaseFirestore.instance.collectionGroup('meal');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('meal').doc(id);

  static Stream<MealRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MealRecord.fromSnapshot(s));

  static Future<MealRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MealRecord.fromSnapshot(s));

  static MealRecord fromSnapshot(DocumentSnapshot snapshot) => MealRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MealRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MealRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MealRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MealRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMealRecordData({
  String? title,
  String? instructions,
  String? image,
  String? recipeUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'instructions': instructions,
      'image': image,
      'recipeUrl': recipeUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MealRecordDocumentEquality implements Equality<MealRecord> {
  const MealRecordDocumentEquality();

  @override
  bool equals(MealRecord? e1, MealRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        listEquality.equals(e1?.ingredients, e2?.ingredients) &&
        e1?.instructions == e2?.instructions &&
        e1?.image == e2?.image &&
        e1?.recipeUrl == e2?.recipeUrl;
  }

  @override
  int hash(MealRecord? e) => const ListEquality().hash(
      [e?.title, e?.ingredients, e?.instructions, e?.image, e?.recipeUrl]);

  @override
  bool isValidKey(Object? o) => o is MealRecord;
}
