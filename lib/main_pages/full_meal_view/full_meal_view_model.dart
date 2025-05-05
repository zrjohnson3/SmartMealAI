import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'full_meal_view_widget.dart' show FullMealViewWidget;
import 'package:flutter/material.dart';

class FullMealViewModel extends FlutterFlowModel<FullMealViewWidget> {
  ///  Local state fields for this page.

  bool day1Btn = false;

  bool day2Btn = false;

  bool day3Btn = false;

  int? dayDisplay = 1;

  int? currentMealMark;

  int? whichDay;

  bool isButtonDisabled = false;

  String? cautionValue;

  int? calorieValue;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (EdamamAPICallBreakfast)] action in fullMealDisplay widget.
  ApiCallResponse? apiBreakfastResult;
  // Stores action output result for [Backend Call - API (EdamamAPICallLunch)] action in fullMealDisplay widget.
  ApiCallResponse? apiLunchResult;
  // Stores action output result for [Backend Call - API (EdamamAPICallDinner)] action in fullMealDisplay widget.
  ApiCallResponse? apiDinnerCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
