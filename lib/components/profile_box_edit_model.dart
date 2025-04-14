import '/flutter_flow/flutter_flow_util.dart';
import 'profile_box_edit_widget.dart' show ProfileBoxEditWidget;
import 'package:flutter/material.dart';

class ProfileBoxEditModel extends FlutterFlowModel<ProfileBoxEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
