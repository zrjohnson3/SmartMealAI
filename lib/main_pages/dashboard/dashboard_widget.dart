import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/main_page_comps/bottom_nav/bottom_nav_widget.dart';
import '/main_pages/main_page_comps/mealplan_display/mealplan_display_widget.dart';
import '/main_pages/main_page_comps/nutrition_bar/nutrition_bar_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  static String routeName = 'Dashboard';
  static String routePath = '/dashboard';

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DASHBOARD_PAGE_Dashboard_ON_INIT_STATE');
      logFirebaseEvent('Dashboard_update_app_state');
      FFAppState().mealCycle = 1;
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
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxHeight: 330.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x1A000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FFButtonWidget(
                                  key: ValueKey('Button_myf8'),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'DASHBOARD_PAGE_VIEW_FULL_PLAN_BTN_ON_TAP');
                                    if (FFAppState().mealCycle != 4) {
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                          FullMealViewWidget.routeName);
                                    } else {
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                          NoRecentMealPlansWidget.routeName);
                                    }
                                  },
                                  text: 'View Full Plan',
                                  options: FFButtonOptions(
                                    height: 25.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xE0EE8C1B),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                          Text(
                            'Today\'s Meal Plan',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Expanded(
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                if (FFAppState().mealCycle != 4)
                                  StreamBuilder<List<UserMealsRecord>>(
                                    stream: queryUserMealsRecord(
                                      parent: currentUserReference,
                                      queryBuilder: (userMealsRecord) =>
                                          userMealsRecord
                                              .where(
                                                'mealDay',
                                                isEqualTo:
                                                    FFAppState().mealCycle,
                                              )
                                              .orderBy('whenCreated',
                                                  descending: true),
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
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
                                        itemCount:
                                            listViewUserMealsRecordList.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 20.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewUserMealsRecord =
                                              listViewUserMealsRecordList[
                                                  listViewIndex];
                                          return MealplanDisplayWidget(
                                            key: Key(
                                                'Key3gq_${listViewIndex}_of_${listViewUserMealsRecordList.length}'),
                                            mealName: valueOrDefault<String>(
                                              listViewUserMealsRecord.mealName,
                                              'n/a',
                                            ),
                                            mealCalories:
                                                valueOrDefault<double>(
                                              listViewUserMealsRecord
                                                  .mealCaloriesInt
                                                  .toDouble(),
                                              0.0,
                                            ),
                                            mealImage: listViewUserMealsRecord
                                                .mealImage,
                                            mealRecipe: listViewUserMealsRecord
                                                .mealRecipe,
                                            isFavorite: listViewUserMealsRecord
                                                .isFavorite,
                                            mealType: listViewUserMealsRecord
                                                .mealCategory,
                                            checkAction: () async {},
                                            deleteAction: () async {
                                              logFirebaseEvent(
                                                  'DASHBOARD_Container_3gq0vasi_CALLBACK');
                                              logFirebaseEvent(
                                                  'mealplanDisplay_backend_call');

                                              await listViewUserMealsRecord
                                                  .reference
                                                  .update(
                                                      createUserMealsRecordData(
                                                isFavorite: false,
                                              ));
                                            },
                                            recipeAction: () async {},
                                          );
                                        },
                                      );
                                    },
                                  ),
                                if (FFAppState().mealCycle == 4)
                                  Opacity(
                                    opacity: 0.8,
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.09, -1.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          'https://imgs.search.brave.com/vp9HSFUqgtsILfZnsndJrcQWRdKGVJVc4wmS2yqedUw/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvOTYx/MjU5NzEyL3ZlY3Rv/ci9mYXN0LWZvb2Qt/c2V0LmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz1kUWt4WF8z/c2J2clF6dWZ0SW9C/WEV1Tk5kaERxc2RW/a2xtaXhkbGRnenJr/PQ',
                                          width: 200.0,
                                          height: 150.8,
                                          fit: BoxFit.contain,
                                          alignment: Alignment(0.0, -1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (FFAppState().mealCycle == 4)
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 150.0, 0.0, 0.0),
                                            child: GradientText(
                                              'You have not yet created a meal plan recently, please hit the plus icon below to start',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                FlutterFlowTheme.of(context)
                                                    .tertiary
                                              ],
                                              gradientDirection:
                                                  GradientDirection.btt,
                                              gradientType: GradientType.linear,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.nutritionBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NutritionBarWidget(
                    calorieValue: valueOrDefault<double>(
                      FFAppState().totalCalories,
                      0.0,
                    ),
                    proteinValue: 0.0,
                    fatValue: 0.0,
                    calorieText: valueOrDefault<int>(
                      null,
                      0,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.bottomNavModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BottomNavWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
