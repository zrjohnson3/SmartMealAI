import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ask_ai_page_widget.dart' show AskAiPageWidget;
import 'package:flutter/material.dart';

class AskAiPageModel extends FlutterFlowModel<AskAiPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
