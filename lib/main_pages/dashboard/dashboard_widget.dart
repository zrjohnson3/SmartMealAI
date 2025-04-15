import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
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
                                            checkAction: () async {
                                              logFirebaseEvent(
                                                  'DASHBOARD_Container_3gq0vasi_CALLBACK');
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
                                            recipeAction: () async {
                                              logFirebaseEvent(
                                                  'DASHBOARD_Container_3gq0vasi_CALLBACK');
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
                                                  'mealplanDisplay_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
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
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: MealFromAiWidget(
                                                        mealName:
                                                            listViewUserMealsRecord
                                                                .mealName,
                                                        mealRecipe:
                                                            _model.aiAgent!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              logFirebaseEvent(
                                                  'mealplanDisplay_a_i_agent');
                                              clearAiChat(
                                                  'agent_recipe', 'GOOGLE');

                                              safeSetState(() {});
                                            },
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
