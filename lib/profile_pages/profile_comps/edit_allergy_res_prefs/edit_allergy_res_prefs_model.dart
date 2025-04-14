import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_allergy_res_prefs_widget.dart' show EditAllergyResPrefsWidget;
import 'package:flutter/material.dart';

class EditAllergyResPrefsModel
    extends FlutterFlowModel<EditAllergyResPrefsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in editAllergyResPrefs widget.
  PreferencesRecord? userPrefOutput;
  // State field(s) for allergiesRestrictChkBox widget.
  FormFieldController<List<String>>? allergiesRestrictChkBoxValueController;
  List<String>? get allergiesRestrictChkBoxValues =>
      allergiesRestrictChkBoxValueController?.value;
  set allergiesRestrictChkBoxValues(List<String>? v) =>
      allergiesRestrictChkBoxValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
