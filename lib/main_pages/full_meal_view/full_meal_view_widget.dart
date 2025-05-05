import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/main_page_comps/full_meal_display/full_meal_display_widget.dart';
import '/main_pages/main_page_comps/meal_information/meal_information_widget.dart';
import '/main_pages/main_page_comps/refresh_meal_alert/refresh_meal_alert_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'full_meal_view_model.dart';
export 'full_meal_view_model.dart';

/// Give me two buttons within the app bar for with the options 1 or 3
class FullMealViewWidget extends StatefulWidget {
  const FullMealViewWidget({super.key});

  static String routeName = 'fullMealView';
  static String routePath = '/fullMealView';

  @override
  State<FullMealViewWidget> createState() => _FullMealViewWidgetState();
}

class _FullMealViewWidgetState extends State<FullMealViewWidget> {
  late FullMealViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FullMealViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'fullMealView'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FULL_MEAL_VIEW_fullMealView_ON_INIT_STAT');
      logFirebaseEvent('fullMealView_update_page_state');
      _model.day1Btn = true;
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
                  logFirebaseEvent('FULL_MEAL_VIEW_arrow_back_sharp_ICN_ON_T');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(DashboardWidget.routeName);
                },
              ),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Full Meal View',
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
            padding: EdgeInsets.all(14.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'FULL_MEAL_VIEW_PAGE_Day1_ON_TAP');
                              logFirebaseEvent('Day1_update_page_state');
                              _model.day1Btn = true;
                              _model.dayDisplay = 1;
                              safeSetState(() {});
                              if (_model.day1Btn) {
                                logFirebaseEvent('Day1_update_page_state');
                                _model.day2Btn = false;
                                _model.day3Btn = false;
                                safeSetState(() {});
                              }
                            },
                            text: 'Day 1\n',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: valueOrDefault<Color>(
                                _model.day1Btn
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
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
                          AuthUserStreamWidget(
                            builder: (context) => FFButtonWidget(
                              onPressed: valueOrDefault<bool>(
                                      currentUserDocument?.oneOrThreeDays,
                                      false)
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'FULL_MEAL_VIEW_PAGE_Day2_ON_TAP');
                                      logFirebaseEvent(
                                          'Day2_update_page_state');
                                      _model.day2Btn = true;
                                      _model.dayDisplay = 2;
                                      safeSetState(() {});
                                      if (_model.day2Btn) {
                                        logFirebaseEvent(
                                            'Day2_update_page_state');
                                        _model.day3Btn = false;
                                        _model.day1Btn = false;
                                        safeSetState(() {});
                                      }
                                    },
                              text: 'Day 2',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  _model.day2Btn
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).alternate,
                                  FlutterFlowTheme.of(context).alternate,
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
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
                          AuthUserStreamWidget(
                            builder: (context) => FFButtonWidget(
                              onPressed: valueOrDefault<bool>(
                                      currentUserDocument?.oneOrThreeDays,
                                      false)
                                  ? null
                                  : () async {
                                      logFirebaseEvent(
                                          'FULL_MEAL_VIEW_PAGE_Day3_ON_TAP');
                                      logFirebaseEvent(
                                          'Day3_update_page_state');
                                      _model.dayDisplay = 3;
                                      _model.day3Btn = true;
                                      safeSetState(() {});
                                      if (_model.day3Btn) {
                                        logFirebaseEvent(
                                            'Day3_update_page_state');
                                        _model.day1Btn = false;
                                        _model.day2Btn = false;
                                        safeSetState(() {});
                                      }
                                    },
                              text: 'Day 3\n',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  _model.day3Btn
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).alternate,
                                  FlutterFlowTheme.of(context).alternate,
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            StreamBuilder<List<UserMealsRecord>>(
                              stream: queryUserMealsRecord(
                                parent: currentUserReference,
                                queryBuilder: (userMealsRecord) =>
                                    userMealsRecord
                                        .where(
                                          'mealDay',
                                          isEqualTo: _model.dayDisplay,
                                        )
                                        .orderBy('whenCreated',
                                            descending: true)
                                        .orderBy('mealMark'),
                                limit: 3,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UserMealsRecord>
                                    listViewUserMealsRecordList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewUserMealsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 20.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewUserMealsRecord =
                                        listViewUserMealsRecordList[
                                            listViewIndex];
                                    return Builder(
                                      builder: (context) => StreamBuilder<
                                          List<PreferencesRecord>>(
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
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<PreferencesRecord>
                                              fullMealDisplayPreferencesRecordList =
                                              snapshot.data!;
                                          final fullMealDisplayPreferencesRecord =
                                              fullMealDisplayPreferencesRecordList
                                                      .isNotEmpty
                                                  ? fullMealDisplayPreferencesRecordList
                                                      .first
                                                  : null;

                                          return FullMealDisplayWidget(
                                            key: Key(
                                                'Keylgt_${listViewIndex}_of_${listViewUserMealsRecordList.length}'),
                                            mealName: listViewUserMealsRecord
                                                .mealName,
                                            mealImage: listViewUserMealsRecord
                                                .mealImage,
                                            mealCalories:
                                                listViewUserMealsRecord
                                                    .mealCaloriesInt
                                                    .toDouble(),
                                            mealRecipe: listViewUserMealsRecord
                                                .mealRecipe,
                                            mealCuisine: listViewUserMealsRecord
                                                .cuisineType,
                                            mealType: listViewUserMealsRecord
                                                .mealCategory,
                                            isFavorite: listViewUserMealsRecord
                                                .isFavorite,
                                            mealMark: listViewUserMealsRecord
                                                .mealMark,
                                            checkAction: () async {
                                              logFirebaseEvent(
                                                  'FULL_MEAL_VIEW_Container_lgt6f7f3_CALLBA');
                                              logFirebaseEvent(
                                                  'fullMealDisplay_backend_call');

                                              await listViewUserMealsRecord
                                                  .reference
                                                  .update(
                                                      createUserMealsRecordData(
                                                isFavorite: true,
                                              ));
                                            },
                                            deleteAction: () async {
                                              logFirebaseEvent(
                                                  'FULL_MEAL_VIEW_Container_lgt6f7f3_CALLBA');
                                              logFirebaseEvent(
                                                  'fullMealDisplay_backend_call');

                                              await listViewUserMealsRecord
                                                  .reference
                                                  .update(
                                                      createUserMealsRecordData(
                                                isFavorite: false,
                                              ));
                                            },
                                            bottomSheetAction: () async {
                                              logFirebaseEvent(
                                                  'FULL_MEAL_VIEW_Container_lgt6f7f3_CALLBA');
                                              logFirebaseEvent(
                                                  'fullMealDisplay_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          MealInformationWidget(
                                                        mealName:
                                                            listViewUserMealsRecord
                                                                .mealName,
                                                        mealImage:
                                                            listViewUserMealsRecord
                                                                .mealImage,
                                                        mealCalories:
                                                            listViewUserMealsRecord
                                                                .mealCaloriesInt
                                                                .toDouble(),
                                                        mealCuisine:
                                                            listViewUserMealsRecord
                                                                .cuisineType,
                                                        mealNutrients:
                                                            listViewUserMealsRecord
                                                                .mealNutrients,
                                                        mealRecipeURL:
                                                            listViewUserMealsRecord
                                                                .mealRecipeURL,
                                                        mealServings:
                                                            listViewUserMealsRecord
                                                                .mealServings,
                                                        mealRecipe:
                                                            listViewUserMealsRecord
                                                                .mealRecipe,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            refreshMeal: () async {
                                              logFirebaseEvent(
                                                  'FULL_MEAL_VIEW_Container_lgt6f7f3_CALLBA');
                                              logFirebaseEvent(
                                                  'fullMealDisplay_update_page_state');
                                              _model.currentMealMark =
                                                  listViewUserMealsRecord
                                                      .mealMark;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'fullMealDisplay_update_page_state');
                                              _model.calorieValue =
                                                  fullMealDisplayPreferencesRecord
                                                      ?.calTarget;
                                              _model.cautionValue =
                                                  FFAppState().dietLabel;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'fullMealDisplay_wait__delay');
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1000));
                                              await Future.wait([
                                                Future(() async {
                                                  if (_model.currentMealMark ==
                                                      1) {
                                                    logFirebaseEvent(
                                                        'fullMealDisplay_alert_dialog');
                                                    await showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child:
                                                                RefreshMealAlertWidget(
                                                              messageText:
                                                                  'Generating new breakfast... ',
                                                              closeDialog:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    '_close_dialog_drawer_etc');
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );

                                                    logFirebaseEvent(
                                                        'fullMealDisplay_backend_call');
                                                    _model.apiBreakfastResult =
                                                        await EdamamAPICallBreakfastCall
                                                            .call(
                                                      diet: 'balanced',
                                                      caution:
                                                          _model.cautionValue,
                                                      calories: _model
                                                          .calorieValue
                                                          ?.toString(),
                                                    );

                                                    if ((_model
                                                            .apiBreakfastResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_backend_call');
                                                      await listViewUserMealsRecord
                                                          .reference
                                                          .delete();
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_backend_call');

                                                      await UserMealsRecord
                                                              .createDoc(
                                                                  currentUserReference!)
                                                          .set({
                                                        ...createUserMealsRecordData(
                                                          uid:
                                                              currentUserReference,
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
                                                          mealCategory:
                                                              'breakfast',
                                                          mealDay:
                                                              _model.dayDisplay,
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
                                                            'whenCreated':
                                                                FieldValue
                                                                    .serverTimestamp(),
                                                          },
                                                        ),
                                                      });
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_update_app_state');
                                                      FFAppState()
                                                          .updatePlanBreakfastProteinsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallBreakfastCall
                                                                .protein1(
                                                          (_model.apiBreakfastResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                      );
                                                      FFAppState()
                                                          .updatePlanBreakfastFatsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallBreakfastCall
                                                                .fats1(
                                                          (_model.apiBreakfastResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                      );
                                                      FFAppState()
                                                          .updatePlanBreakfastCarbsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallBreakfastCall
                                                                .carbs1(
                                                          (_model.apiBreakfastResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                      );
                                                      FFAppState()
                                                          .updatePlanBreakfastCaloriesAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallBreakfastCall
                                                                .mealCalories1(
                                                          (_model.apiBreakfastResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      FFAppState()
                                                          .updatePlanBreakfastServingsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallBreakfastCall
                                                                .mealServings1(
                                                          (_model.apiBreakfastResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'An error occured',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    }
                                                  }
                                                }),
                                                Future(() async {
                                                  if (_model.currentMealMark ==
                                                      2) {
                                                    logFirebaseEvent(
                                                        'fullMealDisplay_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child:
                                                                RefreshMealAlertWidget(
                                                              messageText:
                                                                  'Generating new lunch...',
                                                              closeDialog:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    '_close_dialog_drawer_etc');
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );

                                                    logFirebaseEvent(
                                                        'fullMealDisplay_backend_call');
                                                    _model.apiLunchResult =
                                                        await EdamamAPICallLunchCall
                                                            .call(
                                                      diet: 'balanced',
                                                      caution:
                                                          _model.cautionValue,
                                                      calories: _model
                                                          .calorieValue
                                                          ?.toString(),
                                                    );

                                                    if ((_model.apiLunchResult
                                                            ?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_backend_call');
                                                      await listViewUserMealsRecord
                                                          .reference
                                                          .delete();
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_backend_call');

                                                      await UserMealsRecord
                                                              .createDoc(
                                                                  currentUserReference!)
                                                          .set({
                                                        ...createUserMealsRecordData(
                                                          uid:
                                                              currentUserReference,
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
                                                          mealDay:
                                                              _model.dayDisplay,
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
                                                            'whenCreated':
                                                                FieldValue
                                                                    .serverTimestamp(),
                                                          },
                                                        ),
                                                      });
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_update_app_state');
                                                      FFAppState()
                                                          .updatePlanLunchProteinsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallLunchCall
                                                                .protein1(
                                                          (_model.apiLunchResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      FFAppState()
                                                          .updatePlanLunchFatsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallLunchCall
                                                                .fats1(
                                                          (_model.apiLunchResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      FFAppState()
                                                          .updatePlanLunchCarbsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallLunchCall
                                                                .carbs1(
                                                          (_model.apiLunchResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      FFAppState()
                                                          .updatePlanLunchCaloriesAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallLunchCall
                                                                .mealCalories1(
                                                          (_model.apiLunchResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      FFAppState()
                                                          .updatePlanLunchServingsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallLunchCall
                                                                .mealServings1(
                                                          (_model.apiLunchResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'An error occured',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    }
                                                  }
                                                }),
                                                Future(() async {
                                                  if (_model.currentMealMark ==
                                                      3) {
                                                    logFirebaseEvent(
                                                        'fullMealDisplay_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child:
                                                                RefreshMealAlertWidget(
                                                              messageText:
                                                                  'Generating new dinner...',
                                                              closeDialog:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    '_close_dialog_drawer_etc');
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );

                                                    logFirebaseEvent(
                                                        'fullMealDisplay_backend_call');
                                                    _model.apiDinnerCall =
                                                        await EdamamAPICallDinnerCall
                                                            .call(
                                                      diet: 'balanced',
                                                      caution:
                                                          _model.cautionValue,
                                                      calories: _model
                                                          .calorieValue
                                                          ?.toString(),
                                                    );

                                                    if ((_model.apiDinnerCall
                                                            ?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_backend_call');
                                                      await listViewUserMealsRecord
                                                          .reference
                                                          .delete();
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_backend_call');

                                                      await UserMealsRecord
                                                              .createDoc(
                                                                  currentUserReference!)
                                                          .set({
                                                        ...createUserMealsRecordData(
                                                          uid:
                                                              currentUserReference,
                                                          mealName:
                                                              EdamamAPICallDinnerCall
                                                                  .mealName1(
                                                            (_model.apiDinnerCall
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          mealCalories:
                                                              EdamamAPICallDinnerCall
                                                                  .mealCalories1(
                                                            (_model.apiDinnerCall
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          mealImage:
                                                              EdamamAPICallDinnerCall
                                                                  .mealImage1(
                                                            (_model.apiDinnerCall
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          isFavorite: false,
                                                          mealRecipeURL:
                                                              EdamamAPICallDinnerCall
                                                                  .mealRecipeURL1(
                                                            (_model.apiDinnerCall
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          mealNutrients: functions
                                                              .nutrientConvert(
                                                                  EdamamAPICallDinnerCall
                                                                      .totalNutrients1(
                                                                    (_model.apiDinnerCall
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  EdamamAPICallDinnerCall
                                                                      .mealServings1(
                                                                    (_model.apiDinnerCall
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )),
                                                          mealServings:
                                                              EdamamAPICallDinnerCall
                                                                  .mealServings1(
                                                            (_model.apiDinnerCall
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          mealCaloriesInt: functions
                                                              .calorieConvert(
                                                                  EdamamAPICallDinnerCall
                                                                      .mealCalories1(
                                                                    (_model.apiDinnerCall
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  EdamamAPICallDinnerCall
                                                                      .mealServings1(
                                                                    (_model.apiDinnerCall
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )),
                                                          cuisineType: functions
                                                              .cuisineConvert(
                                                                  EdamamAPICallDinnerCall
                                                                      .mealCuisine1(
                                                            (_model.apiDinnerCall
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList()),
                                                          mealCategory:
                                                              'dinner',
                                                          mealDay:
                                                              _model.dayDisplay,
                                                          mealMark: 3,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'mealRecipe':
                                                                EdamamAPICallDinnerCall
                                                                    .mealRecipe1(
                                                              (_model.apiDinnerCall
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                            'whenCreated':
                                                                FieldValue
                                                                    .serverTimestamp(),
                                                          },
                                                        ),
                                                      });
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_update_app_state');
                                                      FFAppState()
                                                          .updatePlanDinnerProteinAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallDinnerCall
                                                                .protein1(
                                                          (_model.apiDinnerCall
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      FFAppState()
                                                          .updatePlanDinnerFatsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallDinnerCall
                                                                .fats1(
                                                          (_model.apiDinnerCall
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      FFAppState()
                                                          .updatePlanDinnerCarbsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallDinnerCall
                                                                .carbs1(
                                                          (_model.apiDinnerCall
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      FFAppState()
                                                          .updatePlanDinnerCaloriesAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallDinnerCall
                                                                .mealCalories1(
                                                          (_model.apiDinnerCall
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      FFAppState()
                                                          .updatePlanDinnerServingsAtIndex(
                                                        functions
                                                            .subtractForIndex(
                                                                _model
                                                                    .dayDisplay)!,
                                                        (_) =>
                                                            EdamamAPICallDinnerCall
                                                                .mealServings1(
                                                          (_model.apiDinnerCall
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      logFirebaseEvent(
                                                          'fullMealDisplay_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'An error occured',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    }
                                                  }
                                                }),
                                              ]);
                                              logFirebaseEvent(
                                                  'fullMealDisplay_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Meal generateed...',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );

                                              safeSetState(() {});
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
