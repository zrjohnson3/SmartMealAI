import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'edit_calorie_target_prefs_model.dart';
export 'edit_calorie_target_prefs_model.dart';

class EditCalorieTargetPrefsWidget extends StatefulWidget {
  const EditCalorieTargetPrefsWidget({super.key});

  @override
  State<EditCalorieTargetPrefsWidget> createState() =>
      _EditCalorieTargetPrefsWidgetState();
}

class _EditCalorieTargetPrefsWidgetState
    extends State<EditCalorieTargetPrefsWidget> {
  late EditCalorieTargetPrefsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCalorieTargetPrefsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_CALORIE_TARGET_PREFS_editCalorieTar');
      logFirebaseEvent('editCalorieTargetPrefs_firestore_query');
      _model.testout = await queryPreferencesRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        border: Border.all(
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  buttonSize: 50.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).info,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'EDIT_CALORIE_TARGET_PREFS_arrow_back_ICN');
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Text(
              'Calorie Target',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
              child: FlutterFlowDropDown<String>(
                controller: _model.calorieTargetDropDownValueController ??=
                    FormFieldController<String>(
                  _model.calorieTargetDropDownValue ??=
                      _model.testout?.calorieTarget,
                ),
                options: [
                  'Under 1500 calories',
                  '1500-2000 calories',
                  '2000-2500 calories',
                  '2500+ calories',
                  'I don\'t track calories'
                ],
                onChanged: (val) =>
                    safeSetState(() => _model.calorieTargetDropDownValue = val),
                width: double.infinity,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                hintText: 'Select your daily calorie target',
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 2.0,
                borderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 1.0,
                borderRadius: 8.0,
                margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('EDIT_CALORIE_TARGET_PREFS_calTargetConfi');
                logFirebaseEvent('calTargetConfirm_backend_call');

                await _model.testout!.reference
                    .update(createPreferencesRecordData(
                  calTarget: _model.calorieTargetDropDownValue,
                ));
                logFirebaseEvent('calTargetConfirm_bottom_sheet');
                Navigator.pop(context);
              },
              text: 'Confirm',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
