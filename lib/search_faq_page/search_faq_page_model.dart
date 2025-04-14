import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_faq_page_widget.dart' show SearchFaqPageWidget;
import 'package:flutter/material.dart';

class SearchFaqPageModel extends FlutterFlowModel<SearchFaqPageWidget> {
  ///  State fields for stateful widgets in this page.

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
