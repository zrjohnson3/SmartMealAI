import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_profile_and_prefs_page_widget.dart'
    show EditProfileAndPrefsPageWidget;
import 'package:flutter/material.dart';

class EditProfileAndPrefsPageModel
    extends FlutterFlowModel<EditProfileAndPrefsPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  // State field(s) for emailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldTextController;
  String? Function(BuildContext, String?)?
      emailTextFieldTextControllerValidator;
  // State field(s) for phoneTextField widget.
  FocusNode? phoneTextFieldFocusNode;
  TextEditingController? phoneTextFieldTextController;
  String? Function(BuildContext, String?)?
      phoneTextFieldTextControllerValidator;
  // State field(s) for ageTextField widget.
  FocusNode? ageTextFieldFocusNode;
  TextEditingController? ageTextFieldTextController;
  String? Function(BuildContext, String?)? ageTextFieldTextControllerValidator;
  // State field(s) for genderTextField widget.
  FocusNode? genderTextFieldFocusNode;
  TextEditingController? genderTextFieldTextController;
  String? Function(BuildContext, String?)?
      genderTextFieldTextControllerValidator;
  // State field(s) for heightTextField widget.
  FocusNode? heightTextFieldFocusNode;
  TextEditingController? heightTextFieldTextController;
  String? Function(BuildContext, String?)?
      heightTextFieldTextControllerValidator;
  // State field(s) for weightTextField widget.
  FocusNode? weightTextFieldFocusNode;
  TextEditingController? weightTextFieldTextController;
  String? Function(BuildContext, String?)?
      weightTextFieldTextControllerValidator;
  // State field(s) for healthGoalsTextField widget.
  FocusNode? healthGoalsTextFieldFocusNode;
  TextEditingController? healthGoalsTextFieldTextController;
  String? Function(BuildContext, String?)?
      healthGoalsTextFieldTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PreferencesRecord? saveChangeOut;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    emailTextFieldFocusNode?.dispose();
    emailTextFieldTextController?.dispose();

    phoneTextFieldFocusNode?.dispose();
    phoneTextFieldTextController?.dispose();

    ageTextFieldFocusNode?.dispose();
    ageTextFieldTextController?.dispose();

    genderTextFieldFocusNode?.dispose();
    genderTextFieldTextController?.dispose();

    heightTextFieldFocusNode?.dispose();
    heightTextFieldTextController?.dispose();

    weightTextFieldFocusNode?.dispose();
    weightTextFieldTextController?.dispose();

    healthGoalsTextFieldFocusNode?.dispose();
    healthGoalsTextFieldTextController?.dispose();
  }
}
