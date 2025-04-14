import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_survey2_model.dart';
export 'user_survey2_model.dart';

class UserSurvey2Widget extends StatefulWidget {
  const UserSurvey2Widget({super.key});

  static String routeName = 'UserSurvey2';
  static String routePath = '/userSurvey2';

  @override
  State<UserSurvey2Widget> createState() => _UserSurvey2WidgetState();
}

class _UserSurvey2WidgetState extends State<UserSurvey2Widget> {
  late UserSurvey2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserSurvey2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'UserSurvey2'});
    _model.additionalNotesTextFieldTextController ??= TextEditingController();
    _model.additionalNotesTextFieldFocusNode ??= FocusNode();

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
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('USER_SURVEY2_arrow_back_rounded_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed(UserSurvey1Widget.routeName);
            },
          ),
          title: Text(
            'SmartMeal AI',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Text(
                      'Dietary Preferences',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  FlutterFlowCheckboxGroup(
                    options: [
                      'Vegetarian',
                      'Vegan',
                      'Pescatarian',
                      'Keto',
                      'Paleo',
                      'Gluten-Free',
                      'Carnivore',
                      'None',
                      'Other'
                    ],
                    onChanged: (val) => safeSetState(() =>
                        _model.dietaryPreferencesCheckboxGroupValues = val),
                    controller: _model
                            .dietaryPreferencesCheckboxGroupValueController ??=
                        FormFieldController<List<String>>(
                      [],
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                    checkboxBorderColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                    unselectedTextStyle: TextStyle(),
                    checkboxBorderRadius: BorderRadius.circular(4.0),
                    initialized:
                        _model.dietaryPreferencesCheckboxGroupValues != null,
                  ),
                  Container(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                    child: Text(
                      'Allergies & Restrictions',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  FlutterFlowCheckboxGroup(
                    options: [
                      'Dairy',
                      'Eggs',
                      'Nuts',
                      'Shellfish',
                      'Soy',
                      'Wheat',
                      'None',
                      'Other'
                    ],
                    onChanged: (val) => safeSetState(() =>
                        _model.allergiesRestrictionsCheckboxGroupValues = val),
                    controller: _model
                            .allergiesRestrictionsCheckboxGroupValueController ??=
                        FormFieldController<List<String>>(
                      [],
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                    checkboxBorderColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                    unselectedTextStyle: TextStyle(),
                    checkboxBorderRadius: BorderRadius.circular(4.0),
                    initialized:
                        _model.allergiesRestrictionsCheckboxGroupValues != null,
                  ),
                  Container(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                    child: Text(
                      'Cooking Experience',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: FlutterFlowDropDown<String>(
                      controller:
                          _model.cookingExperienceDropDownValueController ??=
                              FormFieldController<String>(null),
                      options: ['Beginner', 'Intermediate', 'Advanced'],
                      onChanged: (val) => safeSetState(
                          () => _model.cookingExperienceDropDownValue = val),
                      width: double.infinity,
                      height: 50.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Select your cooking level',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Text(
                      'Weekly Meal Prep Goals',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Container(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: FlutterFlowDropDown<String>(
                      controller:
                          _model.weeklyMealPrepGoalsDropDownValueController ??=
                              FormFieldController<String>(null),
                      options: [
                        '1-3 meals per week',
                        '4-7 meals per week',
                        '8-14 meals per week',
                        '15+ meals per week'
                      ],
                      onChanged: (val) => safeSetState(
                          () => _model.weeklyMealPrepGoalsDropDownValue = val),
                      width: double.infinity,
                      height: 50.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'How many meals do you want to prep?',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                  Container(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Text(
                      'Calorie Target',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: FlutterFlowDropDown<String>(
                      controller:
                          _model.calorieTargetDropDownValueController ??=
                              FormFieldController<String>(null),
                      options: [
                        'Under 1500 calories',
                        '1500-2000 calories',
                        '2000-2500 calories',
                        '2500+ calories',
                        'I don\'t track calories'
                      ],
                      onChanged: (val) => safeSetState(
                          () => _model.calorieTargetDropDownValue = val),
                      width: double.infinity,
                      height: 50.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Select your daily calorie target',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                  Container(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                    child: Text(
                      'Favorite Cuisines',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  FlutterFlowCheckboxGroup(
                    options: [
                      'Italian',
                      'Mexican',
                      'Asian',
                      'Mediterranean',
                      'American',
                      'Indian',
                      'Middle Eastern',
                      'French',
                      'Other'
                    ],
                    onChanged: (val) => safeSetState(
                        () => _model.favoriteCuisinesCheckboxGroupValues = val),
                    controller:
                        _model.favoriteCuisinesCheckboxGroupValueController ??=
                            FormFieldController<List<String>>(
                      [],
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                    checkboxBorderColor:
                        FlutterFlowTheme.of(context).secondaryText,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                    unselectedTextStyle: TextStyle(),
                    checkboxBorderRadius: BorderRadius.circular(4.0),
                    initialized:
                        _model.favoriteCuisinesCheckboxGroupValues != null,
                  ),
                  Container(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                    child: Text(
                      'Additional Notes',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  TextFormField(
                    controller: _model.additionalNotesTextFieldTextController,
                    focusNode: _model.additionalNotesTextFieldFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Any other preferences or requirements?',
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    maxLines: 4,
                    minLines: 4,
                    keyboardType: TextInputType.multiline,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    validator: _model
                        .additionalNotesTextFieldTextControllerValidator
                        .asValidator(context),
                  ),
                  Container(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'USER_SURVEY2_submitPreferences_ON_TAP');
                        logFirebaseEvent('submitPreferences_backend_call');

                        await PreferencesRecord.createDoc(currentUserReference!)
                            .set({
                          ...createPreferencesRecordData(
                            calTarget: _model.calorieTargetDropDownValue,
                            notes: _model
                                .additionalNotesTextFieldTextController.text,
                            calorieTarget: _model.calorieTargetDropDownValue,
                            weeklyMeal: _model.weeklyMealPrepGoalsDropDownValue,
                            uid: currentUserReference,
                            cookingExperience:
                                _model.cookingExperienceDropDownValue,
                            goals: FFAppState().userHealthGoals,
                            gender: FFAppState().userGender,
                            weight: FFAppState().userWeight,
                            height: FFAppState().userHeight,
                            age: FFAppState().userAge.toString(),
                          ),
                          ...mapToFirestore(
                            {
                              'dietary_preferences':
                                  _model.dietaryPreferencesCheckboxGroupValues,
                              'allergies_restrictions': _model
                                  .allergiesRestrictionsCheckboxGroupValues,
                              'favorite_cuisine':
                                  _model.favoriteCuisinesCheckboxGroupValues,
                            },
                          ),
                        });
                        logFirebaseEvent('submitPreferences_navigate_to');

                        context.pushNamed(DashboardWidget.routeName);
                      },
                      text: 'Submit Preferences',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
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
