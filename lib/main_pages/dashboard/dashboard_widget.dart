import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main_pages/main_page_comps/bottom_nav/bottom_nav_widget.dart';
import '/main_pages/main_page_comps/meal_from_ai/meal_from_ai_widget.dart';
import '/main_pages/main_page_comps/mealplan_display/mealplan_display_widget.dart';
import '/main_pages/main_page_comps/nutrition_bar/nutrition_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
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
      FFAppState().mealCycle =
          functions.dayOfPlan(currentUserDocument?.lastMealCreation)!;
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'DASHBOARD_PAGE_VIEW_FULL_PLAN_BTN_ON_TAP');
                                if (FFAppState().mealCycle != 4) {
                                  logFirebaseEvent('Button_navigate_to');

                                  context
                                      .pushNamed(FullMealViewWidget.routeName);
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
                          ],
                        ),
                      ),
                      Text(
                        'Today\'s Meal Plan',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.interTight(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
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
                                            isEqualTo: FFAppState().mealCycle,
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
                                        SizedBox(height: 5.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewUserMealsRecord =
                                          listViewUserMealsRecordList[
                                              listViewIndex];
                                      return Builder(
                                        builder: (context) =>
                                            MealplanDisplayWidget(
                                          key: Key(
                                              'Key98l_${listViewIndex}_of_${listViewUserMealsRecordList.length}'),
                                          mealName: valueOrDefault<String>(
                                            listViewUserMealsRecord.mealName,
                                            'n/a',
                                          ),
                                          mealCalories: valueOrDefault<double>(
                                            listViewUserMealsRecord
                                                .mealCaloriesInt
                                                .toDouble(),
                                            0.0,
                                          ),
                                          mealImage:
                                              listViewUserMealsRecord.mealImage,
                                          mealRecipe: listViewUserMealsRecord
                                              .mealRecipe,
                                          isFavorite: listViewUserMealsRecord
                                              .isFavorite,
                                          mealType: listViewUserMealsRecord
                                              .mealCategory,
                                          checkAction: () async {
                                            logFirebaseEvent(
                                                'DASHBOARD_Container_98lla0dj_CALLBACK');
                                            logFirebaseEvent(
                                                'mealplanDisplay_backend_call');

                                            await listViewUserMealsRecord
                                                .reference
                                                .update(
                                                    createUserMealsRecordData(
                                              isFavorite: true,
                                            ));
                                          },
                                          deleteAction: () async {
                                            logFirebaseEvent(
                                                'DASHBOARD_Container_98lla0dj_CALLBACK');
                                            logFirebaseEvent(
                                                'mealplanDisplay_backend_call');

                                            await listViewUserMealsRecord
                                                .reference
                                                .update(
                                                    createUserMealsRecordData(
                                              isFavorite: false,
                                            ));
                                          },
                                          recipeAction: () async {
                                            logFirebaseEvent(
                                                'DASHBOARD_Container_98lla0dj_CALLBACK');
                                            logFirebaseEvent(
                                                'mealplanDisplay_update_page_state');
                                            _model.chats =
                                                functions.aiAgentFormatting(
                                                    listViewUserMealsRecord
                                                        .mealRecipe
                                                        .toList(),
                                                    listViewUserMealsRecord
                                                        .mealName)!;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'mealplanDisplay_a_i_agent');
                                            await callAiAgent(
                                              context: context,
                                              prompt: _model.chats,
                                              threadId: 'agent_recipe',
                                              agentCloudFunctionName:
                                                  'aiAgentAnthony',
                                              provider: 'GOOGLE',
                                              agentJson:
                                                  "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"aiAgentAnthony\",\"key\":\"kvout\"},\"name\":\"aiAgentAnthony\",\"description\":\"Agent that allows users to create quick and easy recipes using the provided meal names and ingredients\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-1.5-flash\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":8192},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"\\\"You are SmartMeal AI, an expert in helping users with simple recipes based on a meal name and possible provided ingredients, you will give them simple instructions in order to help them make a meal, including the steps to cook as well as how to cook it, you should return results in a numbered list\\\"\"},{\"role\":\"USER\",\"text\":\"\\\"Overnight Brunch French Toast\\n1 loaf brioche or challah bread (1-1 Â¼ lb)\\n5 eggs\\n2 Â½ cups milk\\n1 tsp pure vanilla extract\\nÂ¼ tsp ground cinnamon\\n1 Â½ cups sliced bananas\\nfrozen berries\\nfrozen chopped peaches or fresh stone fruit\\nÂ½ stick salted butter, melted\\n4 tsp turbinado sugar\\\"\"},{\"role\":\"ASSISTANT\",\"text\":\"Instructions:\\n1 . Prepare the Bread\\nSlice the brioche or challah bread into 1-inch thick slices. Lightly grease a 9x13-inch baking dish with butter or cooking spray.\\n\\n2. Arrange the Layers\\nLay the bread slices in the dish, slightly overlapping if needed. Scatter your chosen fruit (e.g., sliced bananas, berries, peaches) evenly between the layers or on top.\\n\\n3. Make the Custard\\nIn a large bowl, whisk together the eggs, milk, vanilla extract, and cinnamon until fully combined.\\n\\n4. Soak the Bread\\nPour the custard evenly over the bread and fruit. Press the bread gently with a spatula to ensure it absorbs the mixture. Cover with plastic wrap and refrigerate overnight (or at least 6 hours).\\n\\n5. Bake the Next Morning\\nPreheat your oven to 350°F (175°C). Remove the dish from the fridge and let it come to room temperature while the oven heats.\\n\\n6. Add Butter and Sugar\\nDrizzle the melted butter evenly over the top. Sprinkle with turbinado sugar for a golden, crunchy topping.\\n\\n7. Bake Until Golden\\nBake for 45–50 minutes, or until the custard is set and the top is golden brown.\\n\\n8. Serve and Enjoy!\\nLet cool for 5–10 minutes. Serve warm, optionally topped with syrup, extra fruit, or powdered sugar.\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}",
                                              responseType: 'PLAINTEXT',
                                            ).then((generatedText) {
                                              safeSetState(() => _model
                                                  .aiAgent = generatedText);
                                            });

                                            logFirebaseEvent(
                                                'mealplanDisplay_update_page_state');
                                            _model.chats = _model.aiAgent!;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'mealplanDisplay_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
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
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: MealFromAiWidget(
                                                      mealName:
                                                          listViewUserMealsRecord
                                                              .mealName,
                                                      mealRecipe:
                                                          _model.aiAgent!,
                                                      dismissAction: () async {
                                                        logFirebaseEvent(
                                                            '_bottom_sheet');
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            logFirebaseEvent(
                                                'mealplanDisplay_a_i_agent');
                                            clearAiChat(
                                                'agent_recipe', 'GOOGLE');

                                            safeSetState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            if (FFAppState().mealCycle == 4)
                              Opacity(
                                opacity: 0.8,
                                child: Align(
                                  alignment: AlignmentDirectional(0.09, -1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://imgs.search.brave.com/vp9HSFUqgtsILfZnsndJrcQWRdKGVJVc4wmS2yqedUw/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvOTYx/MjU5NzEyL3ZlY3Rv/ci9mYXN0LWZvb2Qt/c2V0LmpwZz9zPTYx/Mng2MTImdz0wJms9/MjAmYz1kUWt4WF8z/c2J2clF6dWZ0SW9C/WEV1Tk5kaERxc2RW/a2xtaXhkbGRnenJr/PQ',
                                      width: 200.0,
                                      height: 132.2,
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
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 140.0, 0.0, 0.0),
                                        child: GradientText(
                                          'You have not yet created a meal plan recently, please hit the plus icon below to start',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.interTight(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
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
              Stack(
                children: [
                  if (FFAppState().mealCycle != 4)
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: StreamBuilder<List<PreferencesRecord>>(
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
                          List<PreferencesRecord>
                              nutritionBarPreferencesRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final nutritionBarPreferencesRecord =
                              nutritionBarPreferencesRecordList.isNotEmpty
                                  ? nutritionBarPreferencesRecordList.first
                                  : null;

                          return wrapWithModel(
                            model: _model.nutritionBarModel,
                            updateCallback: () => safeSetState(() {}),
                            child: NutritionBarWidget(
                              calorieValue:
                                  nutritionBarPreferencesRecord!.calTarget,
                              proteinValue: functions
                                  .addTotalProgress(
                                      FFAppState()
                                          .planBreakfastProteins
                                          .toList(),
                                      FFAppState().planLunchProteins.toList(),
                                      FFAppState().planDinnerProtein.toList(),
                                      FFAppState()
                                          .planBreakfastServings
                                          .toList(),
                                      FFAppState().planLunchServings.toList(),
                                      FFAppState().planDinnerServings.toList(),
                                      FFAppState().mealCycle)
                                  .toDouble(),
                              fatValue: functions
                                  .addTotalProgress(
                                      FFAppState().planBreakfastFats.toList(),
                                      FFAppState().planLunchFats.toList(),
                                      FFAppState().planDinnerFats.toList(),
                                      FFAppState()
                                          .planBreakfastServings
                                          .toList(),
                                      FFAppState().planLunchServings.toList(),
                                      FFAppState().planDinnerServings.toList(),
                                      FFAppState().mealCycle)
                                  .toDouble(),
                              calorieText: functions
                                  .addTotalProgress(
                                      FFAppState()
                                          .planBreakfastCalories
                                          .toList(),
                                      FFAppState().planLunchCalories.toList(),
                                      FFAppState().planDinnerCalories.toList(),
                                      FFAppState()
                                          .planBreakfastServings
                                          .toList(),
                                      FFAppState().planLunchServings.toList(),
                                      FFAppState().planDinnerServings.toList(),
                                      FFAppState().mealCycle)
                                  .toDouble(),
                              carbValue: functions
                                  .addTotalProgress(
                                      FFAppState().planBreakfastCarbs.toList(),
                                      FFAppState().planLunchCarbs.toList(),
                                      FFAppState().planDinnerCarbs.toList(),
                                      FFAppState()
                                          .planBreakfastServings
                                          .toList(),
                                      FFAppState().planLunchServings.toList(),
                                      FFAppState().planDinnerServings.toList(),
                                      FFAppState().mealCycle)
                                  .toDouble(),
                            ),
                          );
                        },
                      ),
                    ),
                  if (FFAppState().mealCycle == 4)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://imgs.search.brave.com/e5lQamzECfi1Pijzd47538XQjPMOG2akeriXm8K-YpI/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTA2/MDU5MjcxMC92ZWN0/b3IvY2FydG9vbi1z/bWlsaW5nLWNoZWYt/Y2hhcmFjdGVyLmpw/Zz9zPTYxMng2MTIm/dz0wJms9MjAmYz1u/QjdsWjluT05CeFBZ/cm9Ubm9fSm5iVGZL/dWVHQnd6QVRQTlBZ/bHE3QkFNPQ',
                        width: 359.9,
                        height: 261.01,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
              FlutterFlowAdBanner(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 64.4,
                showsTestAd: false,
                androidAdUnitID: 'ca-app-pub-3096773500918906/5959722893',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) => wrapWithModel(
                          model: _model.bottomNavModel,
                          updateCallback: () => safeSetState(() {}),
                          child: BottomNavWidget(
                            aiCallback: () async {
                              logFirebaseEvent(
                                  'DASHBOARD_Container_5px5egyw_CALLBACK');
                              logFirebaseEvent('bottomNav_update_page_state');
                              _model.chats = functions.aiFormatSummary(
                                  functions.recProteinIntake(
                                      FFAppState().dietLabel,
                                      columnPreferencesRecord!.calTarget),
                                  functions.recFatIntake(FFAppState().dietLabel,
                                      columnPreferencesRecord.calTarget),
                                  functions.recCarbIntake(
                                      FFAppState().dietLabel,
                                      columnPreferencesRecord.calTarget),
                                  functions.addTotalProgress(
                                      FFAppState()
                                          .planBreakfastProteins
                                          .toList(),
                                      FFAppState().planLunchProteins.toList(),
                                      FFAppState().planDinnerProtein.toList(),
                                      FFAppState()
                                          .planBreakfastServings
                                          .toList(),
                                      FFAppState().planLunchServings.toList(),
                                      FFAppState().planDinnerServings.toList(),
                                      FFAppState().mealCycle),
                                  functions.addTotalProgress(
                                      FFAppState().planBreakfastFats.toList(),
                                      FFAppState().planLunchFats.toList(),
                                      FFAppState().planDinnerFats.toList(),
                                      FFAppState()
                                          .planBreakfastServings
                                          .toList(),
                                      FFAppState().planLunchServings.toList(),
                                      FFAppState().planDinnerServings.toList(),
                                      FFAppState().mealCycle),
                                  functions.addTotalProgress(
                                      FFAppState().planBreakfastCarbs.toList(),
                                      FFAppState().planLunchCarbs.toList(),
                                      FFAppState().planDinnerCarbs.toList(),
                                      FFAppState()
                                          .planBreakfastServings
                                          .toList(),
                                      FFAppState().planLunchServings.toList(),
                                      FFAppState().planDinnerServings.toList(),
                                      FFAppState().mealCycle),
                                  columnPreferencesRecord.goals,
                                  columnPreferencesRecord.activityLevel)!;
                              safeSetState(() {});
                              logFirebaseEvent('bottomNav_a_i_agent');
                              await callAiAgent(
                                context: context,
                                prompt: _model.chats,
                                threadId: 'agent_recipe',
                                agentCloudFunctionName: 'aiAgentSummaryAnthony',
                                provider: 'GOOGLE',
                                agentJson:
                                    "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"aiAgentSummaryAnthony\",\"key\":\"5diy0\"},\"name\":\"aiAgentSummaryAnthony\",\"description\":\"This is an ai agent that will give the user a summary on how the meal plan performs based on goals that they had set in the original preferences section\\n\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-1.5-flash\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":8192},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are an ai agent that will give a user a quick summary on how their meal plan performs based on specified goals that they have set for themselves, you should use the information input to tell them how this meal plan aligns with their desired outcome. In addition to this, add additional tips to the output such as drinking more water or taking a multivitamin. ALWAYS make the meal plan sound as positive as possible, adding tips that help the user but not make them think that it is a bad plan.\"},{\"role\":\"USER\",\"text\":\"1027/2000calories\\n50/100protein\\n23/50fat\\nModerate (Exercises 3-5 times a week)activity\\nMuscle gainhealth\"},{\"role\":\"ASSISTANT\",\"text\":\"Your meal plan provides an excellent foundation for your goals, delivering 1027 out of 2000 daily calories, 50 out of 100g of protein, and 23 out of 50g of fat. It’s a fantastic starting point that sets you up for success!\\n\\nSince you're aiming for muscle gain and you maintain a moderate activity level (working out 3–5 times a week), consistently reaching your calorie and protein targets will be key. With this meal plan as your strong base, there are a few simple ways you can build on it to boost your progress even more:\\n\\nIncorporate smart snacks: Adding protein-dense snacks like Greek yogurt, almonds, protein bars, or a quick protein shake between meals is an easy way to meet your targets and keep your energy high throughout the day.\\n\\nStay active on recovery days: Light activities like walking, stretching, or yoga on your off days help promote muscle recovery, keep your metabolism firing, and support overall wellness.\\n\\nPrioritize quality sleep: Rest is when real muscle growth happens. Aiming for 7–9 hours of good sleep each night will help you recover better, perform stronger, and feel your best.\\n\\nHydrate consistently: Staying well-hydrated supports everything from muscle recovery to digestion and overall energy levels. During especially active days, consider adding an electrolyte drink to keep your hydration balanced.\\n\\nBe consistent: Sticking to your plan, supplementing smartly, and focusing on daily healthy habits will compound into incredible results over time.\\n\\nYou're off to a strong start! Stay focused, trust the process, and you’ll be amazed at the progress you’ll make. You've got this!\"},{\"role\":\"USER\",\"text\":\"2300/2500calories  \\n140/180protein  \\n60/70fat    \\nLight (Exercises 1-2 times a week)\\nFat loss\"},{\"role\":\"ASSISTANT\",\"text\":\"Your meal plan is setting you up for success! It already provides 2300 out of your 2500 daily calories, 140 out of 180g of protein, and 60 out of 70g of fat — you're incredibly close to hitting your goals, and that's a fantastic place to be!\\n\\nSince your primary goal is fat loss and your activity level is light (exercising 1–2 times per week), keeping a mindful approach to your calorie intake will be key. With your meal plan giving you such a strong foundation, here are a few ways you can build on it to maximize your progress:\\n\\nBoost your daily movement: Even with a lighter exercise schedule, incorporating simple activities like brisk walks, light stretching, or using a standing desk can gently boost your daily calorie burn and keep your metabolism active.\\n\\nStay mindfully hydrated: Drinking plenty of water not only supports digestion but also helps manage hunger and keep your energy levels steady. Herbal teas are a great zero-calorie way to mix it up while staying hydrated.\\n\\nEmbrace active recovery: Adding gentle activities like yoga, light cycling, or even casual hikes on your off days can support fat-burning, promote muscle tone, and reduce overall stress on your body.\\n\\nPrioritize protein and fiber-rich snacks: Choosing smart snacks like cottage cheese, hard-boiled eggs, or a small handful of seeds will help keep you feeling full and protect your lean muscle as you lose fat.\\n\\nGet quality rest: Sleep is a secret weapon for fat loss! Aiming for 7–9 hours of quality sleep will help your body recover, balance important hormones, and maintain a healthy metabolism.\\n\\nYou're already on the right track — the consistency and small daily wins will add up to big results over time. Keep up the great work and trust in your journey — you've got everything it takes to succeed!\"},{\"role\":\"USER\",\"text\":\"1500/2500calories\\n90/180protein\\n30/60fat\\nHeavy (Exercises 6-7 times a week)\\nMuscle gain\"},{\"role\":\"ASSISTANT\",\"text\":\"You’re off to a fantastic start! Your meal plan already provides 1500 out of 2500 calories, 90 out of 180g of protein, and 30 out of 60g of fat — a solid foundation that puts you well on your way toward your muscle gain goals.\\n\\nSince you're training intensely (6–7 times per week!), fueling your body properly and prioritizing recovery will be essential for building strength and maximizing results. With your current plan as a great starting point, here are some simple ways to boost your progress even further:\\n\\nBoost your protein intake throughout the day: To support muscle growth, look for easy ways to add protein-rich foods like lean meats, eggs, dairy, legumes, or convenient options like protein shakes and cottage cheese between meals. This will help you hit your daily target without feeling overly full.\\n\\nFocus on meeting your calorie needs: With your heavy workout schedule, eating enough is crucial. Consider adding nutrient-dense, calorie-rich foods like nuts, seeds, avocados, or healthy oils to meals and snacks to help you reach your daily goals and support recovery.\\n\\nIncorporate complex carbs for sustained energy: Whole grains like brown rice, oats, quinoa, and sweet potatoes are excellent choices to keep your energy levels high for your workouts and help you recover strong.\\n\\nPrioritize recovery and sleep: Recovery is where the real growth happens! Aim for 7–9 hours of quality sleep each night and don’t hesitate to incorporate rest or active recovery days to allow your muscles the time they need to rebuild and grow.\\n\\nStay consistent and stay hydrated: Keeping your body well-hydrated is essential for optimal muscle function, recovery, and overall performance. Make water a regular part of your routine throughout the day.\\n\\nYou’re clearly putting in the effort with your training — now it’s just about giving your body the fuel and recovery it needs to unleash your full potential. Keep showing up, keep pushing, and the results will absolutely follow. You’re doing an amazing job — stay after it!\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}",
                                responseType: 'PLAINTEXT',
                              ).then((generatedText) {
                                safeSetState(() =>
                                    _model.aiAgentSummary = generatedText);
                              });

                              logFirebaseEvent('bottomNav_update_page_state');
                              _model.chats = _model.aiAgentSummary!;
                              safeSetState(() {});
                              logFirebaseEvent('bottomNav_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: MealFromAiWidget(
                                        mealName: 'Summary',
                                        mealRecipe: _model.aiAgentSummary!,
                                        dismissAction: () async {
                                          logFirebaseEvent('_bottom_sheet');
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );

                              logFirebaseEvent('bottomNav_a_i_agent');
                              clearAiChat('agent_recipe', 'GOOGLE');

                              safeSetState(() {});
                            },
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
      ),
    );
  }
}
