import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_fav_foods_prefs_widget.dart' show EditFavFoodsPrefsWidget;
import 'package:flutter/material.dart';

class EditFavFoodsPrefsModel extends FlutterFlowModel<EditFavFoodsPrefsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in editFavFoodsPrefs widget.
  PreferencesRecord? testout;
  // State field(s) for FavoriteCuisinesCheckboxGroup widget.
  FormFieldController<List<String>>?
      favoriteCuisinesCheckboxGroupValueController;
  List<String>? get favoriteCuisinesCheckboxGroupValues =>
      favoriteCuisinesCheckboxGroupValueController?.value;
  set favoriteCuisinesCheckboxGroupValues(List<String>? v) =>
      favoriteCuisinesCheckboxGroupValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
