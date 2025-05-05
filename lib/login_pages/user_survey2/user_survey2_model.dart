import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'user_survey2_widget.dart' show UserSurvey2Widget;
import 'package:flutter/material.dart';

class UserSurvey2Model extends FlutterFlowModel<UserSurvey2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ActivityLevelDropDown widget.
  String? activityLevelDropDownValue;
  FormFieldController<String>? activityLevelDropDownValueController;
  // State field(s) for FavoriteCuisinesCheckboxGroup widget.
  FormFieldController<List<String>>?
      favoriteCuisinesCheckboxGroupValueController;
  List<String>? get favoriteCuisinesCheckboxGroupValues =>
      favoriteCuisinesCheckboxGroupValueController?.value;
  set favoriteCuisinesCheckboxGroupValues(List<String>? v) =>
      favoriteCuisinesCheckboxGroupValueController?.value = v;

  // State field(s) for AdditionalNotesTextField widget.
  FocusNode? additionalNotesTextFieldFocusNode;
  TextEditingController? additionalNotesTextFieldTextController;
  String? Function(BuildContext, String?)?
      additionalNotesTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    additionalNotesTextFieldFocusNode?.dispose();
    additionalNotesTextFieldTextController?.dispose();
  }
}
