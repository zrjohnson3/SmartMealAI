import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_survey1_widget.dart' show UserSurvey1Widget;
import 'package:flutter/material.dart';

class UserSurvey1Model extends FlutterFlowModel<UserSurvey1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ageTxt widget.
  FocusNode? ageTxtFocusNode;
  TextEditingController? ageTxtTextController;
  String? Function(BuildContext, String?)? ageTxtTextControllerValidator;
  // State field(s) for genderTxt widget.
  FocusNode? genderTxtFocusNode;
  TextEditingController? genderTxtTextController;
  String? Function(BuildContext, String?)? genderTxtTextControllerValidator;
  // State field(s) for heightTxt widget.
  FocusNode? heightTxtFocusNode;
  TextEditingController? heightTxtTextController;
  String? Function(BuildContext, String?)? heightTxtTextControllerValidator;
  // State field(s) for weightTxt widget.
  FocusNode? weightTxtFocusNode;
  TextEditingController? weightTxtTextController;
  String? Function(BuildContext, String?)? weightTxtTextControllerValidator;
  // State field(s) for healthgoal widget.
  FocusNode? healthgoalFocusNode;
  TextEditingController? healthgoalTextController;
  String? Function(BuildContext, String?)? healthgoalTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ageTxtFocusNode?.dispose();
    ageTxtTextController?.dispose();

    genderTxtFocusNode?.dispose();
    genderTxtTextController?.dispose();

    heightTxtFocusNode?.dispose();
    heightTxtTextController?.dispose();

    weightTxtFocusNode?.dispose();
    weightTxtTextController?.dispose();

    healthgoalFocusNode?.dispose();
    healthgoalTextController?.dispose();
  }
}
