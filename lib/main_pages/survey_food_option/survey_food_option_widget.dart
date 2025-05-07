import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/main_page_comps/refresh_meal_alert/refresh_meal_alert_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'survey_food_option_model.dart';
export 'survey_food_option_model.dart';

class SurveyFoodOptionWidget extends StatefulWidget {
  const SurveyFoodOptionWidget({super.key});

  static String routeName = 'surveyFoodOption';
  static String routePath = '/surveyFoodOption';

  @override
  State<SurveyFoodOptionWidget> createState() => _SurveyFoodOptionWidgetState();
}

class _SurveyFoodOptionWidgetState extends State<SurveyFoodOptionWidget> {
  late SurveyFoodOptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SurveyFoodOptionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'surveyFoodOption'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SURVEY_FOOD_OPTION_surveyFoodOption_ON_I');
      logFirebaseEvent('surveyFoodOption_update_app_state');
      FFAppState().healthLabel = '';
      FFAppState().dietLabel = '';
      FFAppState().cautionLabel = '';
      safeSetState(() {});
      logFirebaseEvent('surveyFoodOption_update_page_state');
      _model.isPressedBreakfast = true;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 40.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('SURVEY_FOOD_OPTION_arrow_back_sharp_ICN_');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(DashboardWidget.routeName);
                },
              ),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Preferences',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          'Dietary Type',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SURVEY_FOOD_OPTION_proteinBtn_ON_TAP');
                                  logFirebaseEvent(
                                      'proteinBtn_update_page_state');
                                  _model.isPressedProtein =
                                      !_model.isPressedProtein;
                                  safeSetState(() {});
                                  if (_model.isPressedProtein) {
                                    logFirebaseEvent(
                                        'proteinBtn_update_app_state');
                                    FFAppState().dietLabel = 'high-protein';
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'proteinBtn_update_page_state');
                                    _model.isPressedBal = false;
                                    _model.isPressedFat = false;
                                    safeSetState(() {});
                                  }
                                },
                                text: 'High Protein',
                                options: FFButtonOptions(
                                  width: 100.0,
                                  height: 50.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    _model.isPressedProtein
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SURVEY_FOOD_OPTION_balancedBtn_ON_TAP');
                                  logFirebaseEvent(
                                      'balancedBtn_update_page_state');
                                  _model.isPressedBal = !_model.isPressedBal;
                                  safeSetState(() {});
                                  if (_model.isPressedBal) {
                                    logFirebaseEvent(
                                        'balancedBtn_update_app_state');
                                    FFAppState().dietLabel = 'balanced';
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'balancedBtn_update_page_state');
                                    _model.isPressedProtein = false;
                                    _model.isPressedFat = false;
                                    safeSetState(() {});
                                  }
                                },
                                text: 'Balanced',
                                options: FFButtonOptions(
                                  width: 100.0,
                                  height: 50.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    _model.isPressedBal
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SURVEY_FOOD_OPTION_PAGE_fatBtn_ON_TAP');
                                  logFirebaseEvent('fatBtn_update_page_state');
                                  _model.isPressedFat = !_model.isPressedFat;
                                  safeSetState(() {});
                                  if (_model.isPressedFat) {
                                    logFirebaseEvent('fatBtn_update_app_state');
                                    FFAppState().dietLabel = 'low-fat';
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'fatBtn_update_page_state');
                                    _model.isPressedProtein = false;
                                    _model.isPressedBal = false;
                                    safeSetState(() {});
                                  }
                                },
                                text: 'Low fat',
                                options: FFButtonOptions(
                                  width: 100.0,
                                  height: 50.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    _model.isPressedFat
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
                        child: Text(
                          'Health Preferences',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SURVEY_FOOD_OPTION_PAGE_glutenBtn_ON_TAP');
                                  logFirebaseEvent(
                                      'glutenBtn_update_page_state');
                                  _model.isPressedGluten =
                                      !_model.isPressedGluten;
                                  safeSetState(() {});
                                  if (_model.isPressedGluten) {
                                    logFirebaseEvent(
                                        'glutenBtn_update_app_state');
                                    FFAppState().cautionLabel = 'alcohol-free';
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'glutenBtn_update_page_state');
                                    _model.isPressedWheat = false;
                                    _model.isPressedEgg = false;
                                    _model.isPressedMilk = false;
                                    _model.isPressedSoy = false;
                                    _model.isPressedFish = false;
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'glutenBtn_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }
                                },
                                text: 'Alcohol-Free',
                                options: FFButtonOptions(
                                  width: 100.0,
                                  height: 50.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    _model.isPressedGluten
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SURVEY_FOOD_OPTION_PAGE_wheatBtn_ON_TAP');
                                  logFirebaseEvent(
                                      'wheatBtn_update_page_state');
                                  _model.isPressedWheat =
                                      !_model.isPressedWheat;
                                  safeSetState(() {});
                                  if (_model.isPressedWheat) {
                                    logFirebaseEvent(
                                        'wheatBtn_update_app_state');
                                    FFAppState().cautionLabel = 'dairy-free';
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'wheatBtn_update_page_state');
                                    _model.isPressedGluten = false;
                                    _model.isPressedEgg = false;
                                    _model.isPressedMilk = false;
                                    _model.isPressedSoy = false;
                                    _model.isPressedFish = false;
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent('wheatBtn_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }
                                },
                                text: 'Dairy-Free',
                                options: FFButtonOptions(
                                  width: 100.0,
                                  height: 50.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    _model.isPressedWheat
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SURVEY_FOOD_OPTION_PAGE_eggBtn_ON_TAP');
                                  logFirebaseEvent('eggBtn_update_page_state');
                                  _model.isPressedEgg = !_model.isPressedEgg;
                                  safeSetState(() {});
                                  if (_model.isPressedEgg) {
                                    logFirebaseEvent('eggBtn_update_app_state');
                                    FFAppState().cautionLabel =
                                        'immuno-supportive';
                                    safeSetState(() {});
                                    logFirebaseEvent(
                                        'eggBtn_update_page_state');
                                    _model.isPressedGluten = false;
                                    _model.isPressedMilk = false;
                                    _model.isPressedSoy = false;
                                    _model.isPressedFish = false;
                                    _model.isPressedWheat = false;
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent('eggBtn_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }
                                },
                                text: 'Immune+',
                                options: FFButtonOptions(
                                  width: 100.0,
                                  height: 50.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    _model.isPressedEgg
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
                        child: Text(
                          'Number of Days',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SURVEY_FOOD_OPTION_breakfastBtn_ON_TAP');
                                  logFirebaseEvent(
                                      'breakfastBtn_update_page_state');
                                  _model.isPressedBreakfast =
                                      !_model.isPressedBreakfast;
                                  safeSetState(() {});
                                  if (_model.isPressedBreakfast) {
                                    logFirebaseEvent(
                                        'breakfastBtn_update_page_state');
                                    _model.isPressedLunch = false;
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'breakfastBtn_update_page_state');
                                    _model.isPressedLunch = true;
                                    safeSetState(() {});
                                  }
                                },
                                text: '1',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    _model.isPressedBreakfast
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'SURVEY_FOOD_OPTION_PAGE_lunchBtn_ON_TAP');
                                  logFirebaseEvent(
                                      'lunchBtn_update_page_state');
                                  _model.isPressedLunch =
                                      !_model.isPressedLunch;
                                  safeSetState(() {});
                                  if (_model.isPressedLunch) {
                                    logFirebaseEvent(
                                        'lunchBtn_update_page_state');
                                    _model.isPressedBreakfast = false;
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'lunchBtn_update_page_state');
                                    _model.isPressedBreakfast = true;
                                    safeSetState(() {});
                                  }
                                },
                                text: '3',
                                options: FFButtonOptions(
                                  width: 100.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: valueOrDefault<Color>(
                                    _model.isPressedLunch
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<List<PreferencesRecord>>(
                        stream: queryPreferencesRecord(
                          parent: currentUserReference,
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PreferencesRecord> columnPreferencesRecordList =
                              snapshot.data!;
                          final columnPreferencesRecord =
                              columnPreferencesRecordList.isNotEmpty
                                  ? columnPreferencesRecordList.first
                                  : null;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 160.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SURVEY_FOOD_OPTION_confirmBtn_ON_TAP');
                                    logFirebaseEvent(
                                        'confirmBtn_update_page_state');
                                    _model.cautionValue =
                                        columnPreferencesRecord
                                            ?.dietaryPreferences;
                                    _model.caloriesValue =
                                        columnPreferencesRecord?.calTarget;
                                    safeSetState(() {});
                                    if (_model.isPressedBreakfast) {
                                      await Future.wait([
                                        Future(() async {
                                          logFirebaseEvent(
                                              'confirmBtn_backend_call');
                                          _model.apiBreakfastResult =
                                              await EdamamAPICallBreakfastCall
                                                  .call(
                                            diet: FFAppState().dietLabel,
                                            caution: _model.cautionValue,
                                            health: FFAppState().cautionLabel,
                                            calories: functions
                                                .calorieDistributionFunction(
                                                    _model.caloriesValue)
                                                ?.firstOrNull,
                                          );

                                          logFirebaseEvent(
                                              'confirmBtn_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          if ((_model.apiBreakfastResult
                                                  ?.succeeded ??
                                              true)) {
                                            if ((_model.apiLunchResult
                                                    ?.succeeded ??
                                                true)) {
                                              if ((_model.apiDinnerResult
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallBreakfastCall
                                                            .mealName1(
                                                      (_model.apiBreakfastResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallBreakfastCall
                                                            .mealCalories1(
                                                      (_model.apiBreakfastResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallBreakfastCall
                                                            .mealImage1(
                                                      (_model.apiBreakfastResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallBreakfastCall
                                                            .mealRecipeURL1(
                                                      (_model.apiBreakfastResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .totalNutrients1(
                                                              (_model.apiBreakfastResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallBreakfastCall
                                                                .mealServings1(
                                                              (_model.apiBreakfastResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallBreakfastCall
                                                            .mealServings1(
                                                      (_model.apiBreakfastResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .mealCalories1(
                                                              (_model.apiBreakfastResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallBreakfastCall
                                                                .mealServings1(
                                                              (_model.apiBreakfastResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .mealCuisine1(
                                                      (_model.apiBreakfastResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'breakfast',
                                                    mealDay: 1,
                                                    mealMark: 1,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallBreakfastCall
                                                              .mealRecipe1(
                                                        (_model.apiBreakfastResult
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_update_app_state');
                                                FFAppState()
                                                        .planBreakfastProteins =
                                                    EdamamAPICallBreakfastCall
                                                            .mealProteins(
                                                  (_model.apiBreakfastResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planBreakfastFats =
                                                    EdamamAPICallBreakfastCall
                                                            .mealFats(
                                                  (_model.apiBreakfastResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState()
                                                        .planBreakfastCarbs =
                                                    EdamamAPICallBreakfastCall
                                                            .mealCarbs(
                                                  (_model.apiBreakfastResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState()
                                                        .planBreakfastCalories =
                                                    EdamamAPICallBreakfastCall
                                                            .totalCalories(
                                                  (_model.apiBreakfastResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState()
                                                        .planBreakfastServings =
                                                    EdamamAPICallBreakfastCall
                                                            .totalServings(
                                                  (_model.apiBreakfastResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<int>();
                                                safeSetState(() {});
                                              }
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'confirmBtn_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'An error occured',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            logFirebaseEvent(
                                                'confirmBtn_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        RefreshMealAlertWidget(
                                                      messageText: 'API Failed',
                                                      closeDialog: () async {
                                                        logFirebaseEvent(
                                                            '_bottom_sheet');
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        }),
                                        Future(() async {
                                          logFirebaseEvent(
                                              'confirmBtn_backend_call');
                                          _model.apiLunchResult =
                                              await EdamamAPICallLunchCall.call(
                                            diet: FFAppState().dietLabel,
                                            caution: _model.cautionValue,
                                            calories: functions
                                                .calorieDistributionFunction(
                                                    _model.caloriesValue)
                                                ?.elementAtOrNull(1),
                                            health: FFAppState().cautionLabel,
                                          );

                                          logFirebaseEvent(
                                              'confirmBtn_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          if ((_model
                                                  .apiLunchResult?.succeeded ??
                                              true)) {
                                            if ((_model.apiBreakfastResult
                                                    ?.succeeded ??
                                                true)) {
                                              if ((_model.apiDinnerResult
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallLunchCall
                                                            .mealName1(
                                                      (_model.apiLunchResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallLunchCall
                                                            .mealCalories1(
                                                      (_model.apiLunchResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallLunchCall
                                                            .mealImage1(
                                                      (_model.apiLunchResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallLunchCall
                                                            .mealRecipeURL1(
                                                      (_model.apiLunchResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallLunchCall
                                                                .totalNutrients1(
                                                              (_model.apiLunchResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallLunchCall
                                                                .mealServings1(
                                                              (_model.apiLunchResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallLunchCall
                                                            .mealServings1(
                                                      (_model.apiLunchResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallLunchCall
                                                                .mealCalories1(
                                                              (_model.apiLunchResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallLunchCall
                                                                .mealServings1(
                                                              (_model.apiLunchResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallLunchCall
                                                                .mealCuisine1(
                                                      (_model.apiLunchResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'lunch',
                                                    mealDay: 1,
                                                    mealMark: 2,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallLunchCall
                                                              .mealRecipe1(
                                                        (_model.apiLunchResult
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_update_app_state');
                                                FFAppState().planLunchProteins =
                                                    EdamamAPICallLunchCall
                                                            .mealProteins(
                                                  (_model.apiLunchResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planLunchCarbs =
                                                    EdamamAPICallLunchCall
                                                            .mealCarbs(
                                                  (_model.apiLunchResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planLunchFats =
                                                    EdamamAPICallLunchCall
                                                            .mealFats(
                                                  (_model.apiLunchResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planLunchCalories =
                                                    EdamamAPICallLunchCall
                                                            .totalCalories(
                                                  (_model.apiLunchResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planLunchServings =
                                                    EdamamAPICallLunchCall
                                                            .totalServings(
                                                  (_model.apiLunchResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<int>();
                                                safeSetState(() {});
                                              }
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'confirmBtn_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'An error occured',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }
                                        }),
                                        Future(() async {
                                          logFirebaseEvent(
                                              'confirmBtn_backend_call');
                                          _model.apiDinnerResult =
                                              await EdamamAPICallDinnerCall
                                                  .call(
                                            diet: FFAppState().dietLabel,
                                            caution: _model.cautionValue,
                                            calories: functions
                                                .calorieDistributionFunction(
                                                    _model.caloriesValue)
                                                ?.lastOrNull,
                                            health: FFAppState().cautionLabel,
                                          );

                                          logFirebaseEvent(
                                              'confirmBtn_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          if ((_model
                                                  .apiDinnerResult?.succeeded ??
                                              true)) {
                                            if ((_model.apiBreakfastResult
                                                    ?.succeeded ??
                                                true)) {
                                              if ((_model.apiLunchResult
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallDinnerCall
                                                            .mealName1(
                                                      (_model.apiDinnerResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallDinnerCall
                                                            .mealCalories1(
                                                      (_model.apiDinnerResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallDinnerCall
                                                            .mealImage1(
                                                      (_model.apiDinnerResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallDinnerCall
                                                            .mealRecipeURL1(
                                                      (_model.apiDinnerResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallDinnerCall
                                                                .totalNutrients1(
                                                              (_model.apiDinnerResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallDinnerCall
                                                                .mealServings1(
                                                              (_model.apiDinnerResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallDinnerCall
                                                            .mealServings1(
                                                      (_model.apiDinnerResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallDinnerCall
                                                                .mealCalories1(
                                                              (_model.apiDinnerResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallDinnerCall
                                                                .mealServings1(
                                                              (_model.apiDinnerResult
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallDinnerCall
                                                                .mealCuisine1(
                                                      (_model.apiDinnerResult
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'dinner',
                                                    mealDay: 1,
                                                    mealMark: 3,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallDinnerCall
                                                              .mealRecipe1(
                                                        (_model.apiDinnerResult
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_update_app_state');
                                                FFAppState().planDinnerProtein =
                                                    EdamamAPICallDinnerCall
                                                            .mealProteins(
                                                  (_model.apiDinnerResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planDinnerCarbs =
                                                    EdamamAPICallDinnerCall
                                                            .mealCarbs(
                                                  (_model.apiDinnerResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planDinnerFats =
                                                    EdamamAPICallDinnerCall
                                                            .mealFats(
                                                  (_model.apiDinnerResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState()
                                                        .planDinnerCalories =
                                                    EdamamAPICallDinnerCall
                                                            .totalCalories(
                                                  (_model.apiDinnerResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState()
                                                        .planDinnerServings =
                                                    EdamamAPICallDinnerCall
                                                            .totalServings(
                                                  (_model.apiDinnerResult
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<int>();
                                                safeSetState(() {});
                                              }
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'confirmBtn_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'An error occured',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }
                                        }),
                                      ]);
                                      logFirebaseEvent(
                                          'confirmBtn_backend_call');

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        oneOrThreeDays: true,
                                      ));
                                    } else {
                                      await Future.wait([
                                        Future(() async {
                                          logFirebaseEvent(
                                              'confirmBtn_backend_call');
                                          _model.apiBreakfastResult3Day =
                                              await EdamamAPICallBreakfastCall
                                                  .call(
                                            diet: FFAppState().dietLabel,
                                            caution: _model.cautionValue,
                                            calories: functions
                                                .calorieDistributionFunction(
                                                    _model.caloriesValue)
                                                ?.firstOrNull,
                                            health: FFAppState().cautionLabel,
                                          );

                                          logFirebaseEvent(
                                              'confirmBtn_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          if ((_model.apiBreakfastResult3Day
                                                  ?.succeeded ??
                                              true)) {
                                            if ((_model.apiLunchResult3Day
                                                    ?.succeeded ??
                                                true)) {
                                              if ((_model.apiDinnerResult3Day
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallBreakfastCall
                                                            .mealName1(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallBreakfastCall
                                                            .mealCalories1(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallBreakfastCall
                                                            .mealImage1(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallBreakfastCall
                                                            .mealRecipeURL1(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .totalNutrients1(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallBreakfastCall
                                                                .mealServings1(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallBreakfastCall
                                                            .mealServings1(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .mealCalories1(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallBreakfastCall
                                                                .mealServings1(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .mealCuisine1(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'breakfast',
                                                    mealDay: 1,
                                                    mealMark: 1,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallBreakfastCall
                                                              .mealRecipe1(
                                                        (_model.apiBreakfastResult3Day
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallBreakfastCall
                                                            .mealName2(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallBreakfastCall
                                                            .mealCalories2(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallBreakfastCall
                                                            .mealImage2(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallBreakfastCall
                                                            .mealRecipeURL2(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .totalNutrients2(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallBreakfastCall
                                                                .mealServings2(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallBreakfastCall
                                                            .mealServings2(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .mealCalories2(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallBreakfastCall
                                                                .mealServings2(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .mealCuisine2(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'breakfast',
                                                    mealDay: 2,
                                                    mealMark: 1,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallBreakfastCall
                                                              .mealRecipe2(
                                                        (_model.apiBreakfastResult3Day
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallBreakfastCall
                                                            .mealName3(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallBreakfastCall
                                                            .mealCalories3(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallBreakfastCall
                                                            .mealImage3(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallBreakfastCall
                                                            .mealRecipeURL3(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .totalNutrients3(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallBreakfastCall
                                                                .mealServings3(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallBreakfastCall
                                                            .mealServings3(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .mealCalories3(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallBreakfastCall
                                                                .mealServings3(
                                                              (_model.apiBreakfastResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallBreakfastCall
                                                                .mealCuisine3(
                                                      (_model.apiBreakfastResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'breakfast',
                                                    mealDay: 3,
                                                    mealMark: 1,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallBreakfastCall
                                                              .mealRecipe3(
                                                        (_model.apiBreakfastResult3Day
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_update_app_state');
                                                FFAppState()
                                                        .planBreakfastProteins =
                                                    EdamamAPICallBreakfastCall
                                                            .mealProteins(
                                                  (_model.apiBreakfastResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState()
                                                        .planBreakfastCarbs =
                                                    EdamamAPICallBreakfastCall
                                                            .mealCarbs(
                                                  (_model.apiBreakfastResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planBreakfastFats =
                                                    EdamamAPICallBreakfastCall
                                                            .mealFats(
                                                  (_model.apiBreakfastResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState()
                                                        .planBreakfastCalories =
                                                    EdamamAPICallBreakfastCall
                                                            .totalCalories(
                                                  (_model.apiBreakfastResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState()
                                                        .planBreakfastServings =
                                                    EdamamAPICallBreakfastCall
                                                            .totalServings(
                                                  (_model.apiBreakfastResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<int>();
                                                safeSetState(() {});
                                              }
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'confirmBtn_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'An error occured',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }
                                        }),
                                        Future(() async {
                                          logFirebaseEvent(
                                              'confirmBtn_backend_call');
                                          _model.apiLunchResult3Day =
                                              await EdamamAPICallLunchCall.call(
                                            diet: FFAppState().dietLabel,
                                            caution: _model.cautionValue,
                                            calories: functions
                                                .calorieDistributionFunction(
                                                    _model.caloriesValue)
                                                ?.elementAtOrNull(1),
                                            health: FFAppState().cautionLabel,
                                          );

                                          logFirebaseEvent(
                                              'confirmBtn_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          if ((_model.apiLunchResult3Day
                                                  ?.succeeded ??
                                              true)) {
                                            if ((_model.apiBreakfastResult3Day
                                                    ?.succeeded ??
                                                true)) {
                                              if ((_model.apiDinnerResult3Day
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallLunchCall
                                                            .mealName1(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallLunchCall
                                                            .mealCalories1(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallLunchCall
                                                            .mealImage1(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallLunchCall
                                                            .mealRecipeURL1(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallLunchCall
                                                                .totalNutrients1(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallLunchCall
                                                                .mealServings1(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallLunchCall
                                                            .mealServings1(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallLunchCall
                                                                .mealCalories1(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallLunchCall
                                                                .mealServings1(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallLunchCall
                                                                .mealCuisine1(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'lunch',
                                                    mealDay: 1,
                                                    mealMark: 2,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallLunchCall
                                                              .mealRecipe1(
                                                        (_model.apiLunchResult3Day
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallLunchCall
                                                            .mealName2(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallLunchCall
                                                            .mealCalories2(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallLunchCall
                                                            .mealImage2(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallLunchCall
                                                            .mealRecipeURL2(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallLunchCall
                                                                .totalNutrients2(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallLunchCall
                                                                .mealServings2(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallLunchCall
                                                            .mealServings2(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallLunchCall
                                                                .mealCalories2(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallLunchCall
                                                                .mealServings2(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallLunchCall
                                                                .mealCuisine2(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'lunch',
                                                    mealDay: 2,
                                                    mealMark: 2,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallLunchCall
                                                              .mealRecipe2(
                                                        (_model.apiLunchResult3Day
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallLunchCall
                                                            .mealName3(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallLunchCall
                                                            .mealCalories3(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallLunchCall
                                                            .mealImage3(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallLunchCall
                                                            .mealRecipeURL3(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallLunchCall
                                                                .totalNutrients3(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallLunchCall
                                                                .mealServings3(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallLunchCall
                                                            .mealServings3(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallLunchCall
                                                                .mealCalories3(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallLunchCall
                                                                .mealServings3(
                                                              (_model.apiLunchResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallLunchCall
                                                                .mealCuisine3(
                                                      (_model.apiLunchResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'lunch',
                                                    mealDay: 3,
                                                    mealMark: 2,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallLunchCall
                                                              .mealRecipe3(
                                                        (_model.apiLunchResult3Day
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_update_app_state');
                                                FFAppState().planLunchProteins =
                                                    EdamamAPICallLunchCall
                                                            .mealProteins(
                                                  (_model.apiLunchResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planLunchCarbs =
                                                    EdamamAPICallLunchCall
                                                            .mealCarbs(
                                                  (_model.apiLunchResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planLunchFats =
                                                    EdamamAPICallLunchCall
                                                            .mealFats(
                                                  (_model.apiLunchResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planLunchCalories =
                                                    EdamamAPICallLunchCall
                                                            .totalCalories(
                                                  (_model.apiLunchResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planLunchServings =
                                                    EdamamAPICallLunchCall
                                                            .totalServings(
                                                  (_model.apiLunchResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<int>();
                                                safeSetState(() {});
                                              }
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'confirmBtn_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'An error occured',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }
                                        }),
                                        Future(() async {
                                          logFirebaseEvent(
                                              'confirmBtn_backend_call');
                                          _model.apiDinnerResult3Day =
                                              await EdamamAPICallDinnerCall
                                                  .call(
                                            diet: FFAppState().dietLabel,
                                            caution: _model.cautionValue,
                                            calories: functions
                                                .calorieDistributionFunction(
                                                    _model.caloriesValue)
                                                ?.lastOrNull,
                                            health: FFAppState().cautionLabel,
                                          );

                                          logFirebaseEvent(
                                              'confirmBtn_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          if ((_model.apiDinnerResult3Day
                                                  ?.succeeded ??
                                              true)) {
                                            if ((_model.apiBreakfastResult3Day
                                                    ?.succeeded ??
                                                true)) {
                                              if ((_model.apiLunchResult3Day
                                                      ?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallDinnerCall
                                                            .mealName1(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallDinnerCall
                                                            .mealCalories1(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallDinnerCall
                                                            .mealImage1(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallDinnerCall
                                                            .mealRecipeURL1(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallDinnerCall
                                                                .totalNutrients1(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallDinnerCall
                                                                .mealServings1(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallDinnerCall
                                                            .mealServings1(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallDinnerCall
                                                                .mealCalories1(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallDinnerCall
                                                                .mealServings1(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallDinnerCall
                                                                .mealCuisine1(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'dinner',
                                                    mealDay: 1,
                                                    mealMark: 3,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallDinnerCall
                                                              .mealRecipe1(
                                                        (_model.apiDinnerResult3Day
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallDinnerCall
                                                            .mealName2(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallDinnerCall
                                                            .mealCalories2(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallDinnerCall
                                                            .mealImage2(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallDinnerCall
                                                            .mealRecipeURL2(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallDinnerCall
                                                                .totalNutrients2(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallDinnerCall
                                                                .mealServings2(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallDinnerCall
                                                            .mealServings2(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallDinnerCall
                                                                .mealCalories2(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallDinnerCall
                                                                .mealServings2(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallDinnerCall
                                                                .mealCuisine2(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'dinner',
                                                    mealDay: 2,
                                                    mealMark: 3,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallDinnerCall
                                                              .mealRecipe2(
                                                        (_model.apiDinnerResult3Day
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_backend_call');

                                                await UserMealsRecord.createDoc(
                                                        currentUserReference!)
                                                    .set({
                                                  ...createUserMealsRecordData(
                                                    uid: currentUserReference,
                                                    mealName:
                                                        EdamamAPICallDinnerCall
                                                            .mealName3(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCalories:
                                                        EdamamAPICallDinnerCall
                                                            .mealCalories3(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealImage:
                                                        EdamamAPICallDinnerCall
                                                            .mealImage3(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    isFavorite: false,
                                                    mealRecipeURL:
                                                        EdamamAPICallDinnerCall
                                                            .mealRecipeURL3(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealNutrients: functions
                                                        .nutrientConvert(
                                                            EdamamAPICallDinnerCall
                                                                .totalNutrients3(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallDinnerCall
                                                                .mealServings3(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    mealServings:
                                                        EdamamAPICallDinnerCall
                                                            .mealServings3(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    mealCaloriesInt: functions
                                                        .calorieConvert(
                                                            EdamamAPICallDinnerCall
                                                                .mealCalories3(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            EdamamAPICallDinnerCall
                                                                .mealServings3(
                                                              (_model.apiDinnerResult3Day
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )),
                                                    cuisineType: functions
                                                        .cuisineConvert(
                                                            EdamamAPICallDinnerCall
                                                                .mealCuisine3(
                                                      (_model.apiDinnerResult3Day
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toList()),
                                                    mealCategory: 'dinner',
                                                    mealDay: 3,
                                                    mealMark: 3,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'mealRecipe':
                                                          EdamamAPICallDinnerCall
                                                              .mealRecipe3(
                                                        (_model.apiDinnerResult3Day
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      'whenCreated': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    'confirmBtn_update_app_state');
                                                FFAppState().planDinnerProtein =
                                                    EdamamAPICallDinnerCall
                                                            .mealProteins(
                                                  (_model.apiDinnerResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planDinnerCarbs =
                                                    EdamamAPICallDinnerCall
                                                            .mealCarbs(
                                                  (_model.apiDinnerResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState().planDinnerFats =
                                                    EdamamAPICallDinnerCall
                                                            .mealFats(
                                                  (_model.apiDinnerResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState()
                                                        .planDinnerCalories =
                                                    EdamamAPICallDinnerCall
                                                            .totalCalories(
                                                  (_model.apiDinnerResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<double>();
                                                FFAppState()
                                                        .planDinnerServings =
                                                    EdamamAPICallDinnerCall
                                                            .totalServings(
                                                  (_model.apiDinnerResult3Day
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                        .toList()
                                                        .cast<int>();
                                                safeSetState(() {});
                                              }
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'confirmBtn_show_snack_bar');
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'An error occured',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }
                                        }),
                                      ]);
                                      logFirebaseEvent(
                                          'confirmBtn_backend_call');

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        oneOrThreeDays: false,
                                      ));
                                    }

                                    logFirebaseEvent('confirmBtn_backend_call');

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      lastMealCreation: getCurrentTimestamp,
                                    ));
                                    logFirebaseEvent('confirmBtn_navigate_to');

                                    context
                                        .pushNamed(DashboardWidget.routeName);

                                    safeSetState(() {});
                                  },
                                  text: 'Generate Meal Plan',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 56.6,
                                    padding: EdgeInsets.all(8.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
