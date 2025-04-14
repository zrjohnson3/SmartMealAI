import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'survey_food_option_widget.dart' show SurveyFoodOptionWidget;
import 'package:flutter/material.dart';

class SurveyFoodOptionModel extends FlutterFlowModel<SurveyFoodOptionWidget> {
  ///  Local state fields for this page.

  bool isPressedProtein = false;

  bool isPressedBal = false;

  bool isPressedFat = false;

  bool isPressedKeto = false;

  bool isPressedSugar = false;

  bool isPressedPork = false;

  bool isPressedGluten = false;

  bool isPressedWheat = false;

  bool isPressedEgg = false;

  bool isPressedMilk = false;

  bool isPressedSoy = false;

  bool isPressedFish = false;

  int? calHolder1;

  int? calHolder2;

  int? calHolder3;

  bool isPressedBreakfast = false;

  bool isPressedLunch = false;

  bool isPressedDinner = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (EdamamAPICallBreakfast)] action in confirmBtn widget.
  ApiCallResponse? apiBreakfastResult;
  // Stores action output result for [Backend Call - API (EdamamAPICallLunch)] action in confirmBtn widget.
  ApiCallResponse? apiLunchResult;
  // Stores action output result for [Backend Call - API (EdamamAPICallDinner)] action in confirmBtn widget.
  ApiCallResponse? apiDinnerResult;
  // Stores action output result for [Backend Call - API (EdamamAPICallBreakfast)] action in confirmBtn widget.
  ApiCallResponse? apiBreakfastResult3Day;
  // Stores action output result for [Backend Call - API (EdamamAPICallLunch)] action in confirmBtn widget.
  ApiCallResponse? apiLunchResult3Day;
  // Stores action output result for [Backend Call - API (EdamamAPICallDinner)] action in confirmBtn widget.
  ApiCallResponse? apiDinnerResult3Day;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
