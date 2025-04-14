import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/main_page_comps/full_meal_display/full_meal_display_widget.dart';
import '/main_pages/main_page_comps/meal_information/meal_information_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'fav_meal_view_model.dart';
export 'fav_meal_view_model.dart';

class FavMealViewWidget extends StatefulWidget {
  const FavMealViewWidget({super.key});

  static String routeName = 'favMealView';
  static String routePath = '/favMealView';

  @override
  State<FavMealViewWidget> createState() => _FavMealViewWidgetState();
}

class _FavMealViewWidgetState extends State<FavMealViewWidget> {
  late FavMealViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavMealViewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'favMealView'});
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
                  logFirebaseEvent('FAV_MEAL_VIEW_arrow_back_sharp_ICN_ON_TA');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(DashboardWidget.routeName);
                },
              ),
            ),
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Favorite Meal View',
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<UserMealsRecord>>(
                    stream: queryUserMealsRecord(
                      parent: currentUserReference,
                      queryBuilder: (userMealsRecord) => userMealsRecord.where(
                        'isFavorite',
                        isEqualTo: true,
                      ),
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
                        separatorBuilder: (_, __) => SizedBox(height: 20.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewUserMealsRecord =
                              listViewUserMealsRecordList[listViewIndex];
                          return FullMealDisplayWidget(
                            key: Key(
                                'Keyp9m_${listViewIndex}_of_${listViewUserMealsRecordList.length}'),
                            mealName: listViewUserMealsRecord.mealName,
                            mealImage: listViewUserMealsRecord.mealImage,
                            mealCalories: listViewUserMealsRecord
                                .mealCaloriesInt
                                .toDouble(),
                            mealRecipe: listViewUserMealsRecord.mealRecipe,
                            mealCuisine: listViewUserMealsRecord.cuisineType,
                            mealType: listViewUserMealsRecord.mealCategory,
                            isFavorite: listViewUserMealsRecord.isFavorite,
                            checkAction: () async {
                              logFirebaseEvent(
                                  'FAV_MEAL_VIEW_Container_p9mqhcgz_CALLBAC');
                              logFirebaseEvent('fullMealDisplay_backend_call');

                              await listViewUserMealsRecord.reference
                                  .update(createUserMealsRecordData(
                                isFavorite: true,
                              ));
                            },
                            deleteAction: () async {
                              logFirebaseEvent(
                                  'FAV_MEAL_VIEW_Container_p9mqhcgz_CALLBAC');
                              logFirebaseEvent('fullMealDisplay_backend_call');

                              await listViewUserMealsRecord.reference
                                  .update(createUserMealsRecordData(
                                isFavorite: false,
                              ));
                            },
                            bottomSheetAction: () async {
                              logFirebaseEvent(
                                  'FAV_MEAL_VIEW_Container_p9mqhcgz_CALLBAC');
                              logFirebaseEvent('fullMealDisplay_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: FlutterFlowTheme.of(context)
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: MealInformationWidget(
                                        mealName:
                                            listViewUserMealsRecord.mealName,
                                        mealImage:
                                            listViewUserMealsRecord.mealImage,
                                        mealCalories: listViewUserMealsRecord
                                            .mealCaloriesInt
                                            .toDouble(),
                                        mealCuisine:
                                            listViewUserMealsRecord.cuisineType,
                                        mealNutrients: listViewUserMealsRecord
                                            .mealNutrients,
                                        mealRecipeURL: listViewUserMealsRecord
                                            .mealRecipeURL,
                                        mealServings: listViewUserMealsRecord
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
            ),
          ),
        ),
      ),
    );
  }
}
