import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_diet_prefs_widget.dart' show EditDietPrefsWidget;
import 'package:flutter/material.dart';

class EditDietPrefsModel extends FlutterFlowModel<EditDietPrefsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in editDietPrefs widget.
  PreferencesRecord? testout;
  // State field(s) for dietChkBox widget.
  FormFieldController<List<String>>? dietChkBoxValueController;
  List<String>? get dietChkBoxValues => dietChkBoxValueController?.value;
  set dietChkBoxValues(List<String>? v) => dietChkBoxValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
