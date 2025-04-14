import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_calorie_target_prefs_widget.dart'
    show EditCalorieTargetPrefsWidget;
import 'package:flutter/material.dart';

class EditCalorieTargetPrefsModel
    extends FlutterFlowModel<EditCalorieTargetPrefsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in editCalorieTargetPrefs widget.
  PreferencesRecord? testout;
  // State field(s) for CalorieTargetDropDown widget.
  String? calorieTargetDropDownValue;
  FormFieldController<String>? calorieTargetDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
