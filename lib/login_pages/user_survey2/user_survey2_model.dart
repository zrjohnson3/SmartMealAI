import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'user_survey2_widget.dart' show UserSurvey2Widget;
import 'package:flutter/material.dart';

class UserSurvey2Model extends FlutterFlowModel<UserSurvey2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DietaryPreferencesCheckboxGroup widget.
  FormFieldController<List<String>>?
      dietaryPreferencesCheckboxGroupValueController;
  List<String>? get dietaryPreferencesCheckboxGroupValues =>
      dietaryPreferencesCheckboxGroupValueController?.value;
  set dietaryPreferencesCheckboxGroupValues(List<String>? v) =>
      dietaryPreferencesCheckboxGroupValueController?.value = v;

  // State field(s) for AllergiesRestrictionsCheckboxGroup widget.
  FormFieldController<List<String>>?
      allergiesRestrictionsCheckboxGroupValueController;
  List<String>? get allergiesRestrictionsCheckboxGroupValues =>
      allergiesRestrictionsCheckboxGroupValueController?.value;
  set allergiesRestrictionsCheckboxGroupValues(List<String>? v) =>
      allergiesRestrictionsCheckboxGroupValueController?.value = v;

  // State field(s) for CookingExperienceDropDown widget.
  String? cookingExperienceDropDownValue;
  FormFieldController<String>? cookingExperienceDropDownValueController;
  // State field(s) for WeeklyMealPrepGoalsDropDown widget.
  String? weeklyMealPrepGoalsDropDownValue;
  FormFieldController<String>? weeklyMealPrepGoalsDropDownValueController;
  // State field(s) for CalorieTargetDropDown widget.
  String? calorieTargetDropDownValue;
  FormFieldController<String>? calorieTargetDropDownValueController;
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
