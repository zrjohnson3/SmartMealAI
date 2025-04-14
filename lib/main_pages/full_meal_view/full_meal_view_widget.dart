import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/main_page_comps/full_meal_display/full_meal_display_widget.dart';
import '/main_pages/main_page_comps/meal_information/meal_information_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
                    fontFamily: 'Inter Tight',
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('FULL_MEAL_VIEW_PAGE_Day1_ON_TAP');
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
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('FULL_MEAL_VIEW_PAGE_Day2_ON_TAP');
                          logFirebaseEvent('Day2_update_page_state');
                          _model.day2Btn = true;
                          _model.dayDisplay = 2;
                          safeSetState(() {});
                          if (_model.day2Btn) {
                            logFirebaseEvent('Day2_update_page_state');
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
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('FULL_MEAL_VIEW_PAGE_Day3_ON_TAP');
                          logFirebaseEvent('Day3_update_page_state');
                          _model.dayDisplay = 3;
                          _model.day3Btn = true;
                          safeSetState(() {});
                          if (_model.day3Btn) {
                            logFirebaseEvent('Day3_update_page_state');
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
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
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
                            queryBuilder: (userMealsRecord) => userMealsRecord
                                .where(
                                  'mealDay',
                                  isEqualTo: _model.dayDisplay,
                                )
                                .orderBy('whenCreated', descending: true),
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UserMealsRecord> listViewUserMealsRecordList =
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
                                    listViewUserMealsRecordList[listViewIndex];
                                return FullMealDisplayWidget(
                                  key: Key(
                                      'Keylgt_${listViewIndex}_of_${listViewUserMealsRecordList.length}'),
                                  mealName: listViewUserMealsRecord.mealName,
                                  mealImage: listViewUserMealsRecord.mealImage,
                                  mealCalories: listViewUserMealsRecord
                                      .mealCaloriesInt
                                      .toDouble(),
                                  mealRecipe:
                                      listViewUserMealsRecord.mealRecipe,
                                  mealCuisine:
                                      listViewUserMealsRecord.cuisineType,
                                  mealType:
                                      listViewUserMealsRecord.mealCategory,
                                  isFavorite:
                                      listViewUserMealsRecord.isFavorite,
                                  checkAction: () async {
                                    logFirebaseEvent(
                                        'FULL_MEAL_VIEW_Container_lgt6f7f3_CALLBA');
                                    logFirebaseEvent(
                                        'fullMealDisplay_backend_call');

                                    await listViewUserMealsRecord.reference
                                        .update(createUserMealsRecordData(
                                      isFavorite: true,
                                    ));
                                  },
                                  deleteAction: () async {},
                                  bottomSheetAction: () async {
                                    logFirebaseEvent(
                                        'FULL_MEAL_VIEW_Container_lgt6f7f3_CALLBA');
                                    logFirebaseEvent(
                                        'fullMealDisplay_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: MealInformationWidget(
                                              mealName: listViewUserMealsRecord
                                                  .mealName,
                                              mealImage: listViewUserMealsRecord
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
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
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
    );
  }
}
