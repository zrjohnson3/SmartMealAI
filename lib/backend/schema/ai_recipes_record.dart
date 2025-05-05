import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AiRecipesRecord extends FirestoreRecord {
  AiRecipesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "messageText" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  bool hasMessageText() => _messageText != null;

  // "whenCreated" field.
  DateTime? _whenCreated;
  DateTime? get whenCreated => _whenCreated;
  bool hasWhenCreated() => _whenCreated != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
    _messageText = snapshotData['messageText'] as String?;
    _whenCreated = snapshotData['whenCreated'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('aiRecipes')
          : FirebaseFirestore.instance.collectionGroup('aiRecipes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('aiRecipes').doc(id);

  static Stream<AiRecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AiRecipesRecord.fromSnapshot(s));

  static Future<AiRecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AiRecipesRecord.fromSnapshot(s));

  static AiRecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AiRecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AiRecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AiRecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AiRecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AiRecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAiRecipesRecordData({
  DocumentReference? uid,
  String? messageText,
  DateTime? whenCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'messageText': messageText,
      'whenCreated': whenCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class AiRecipesRecordDocumentEquality implements Equality<AiRecipesRecord> {
  const AiRecipesRecordDocumentEquality();

  @override
  bool equals(AiRecipesRecord? e1, AiRecipesRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.messageText == e2?.messageText &&
        e1?.whenCreated == e2?.whenCreated;
  }

  @override
  int hash(AiRecipesRecord? e) =>
      const ListEquality().hash([e?.uid, e?.messageText, e?.whenCreated]);

  @override
  bool isValidKey(Object? o) => o is AiRecipesRecord;
}
