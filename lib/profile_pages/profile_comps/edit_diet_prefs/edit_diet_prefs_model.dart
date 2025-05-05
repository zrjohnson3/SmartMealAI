import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_diet_prefs_widget.dart' show EditDietPrefsWidget;
import 'package:flutter/material.dart';

class EditDietPrefsModel extends FlutterFlowModel<EditDietPrefsWidget> {
  ///  Local state fields for this component.

  String dietPrefs = 'wheat';

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
