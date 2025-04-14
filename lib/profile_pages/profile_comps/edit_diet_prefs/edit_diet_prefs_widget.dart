import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'edit_diet_prefs_model.dart';
export 'edit_diet_prefs_model.dart';

class EditDietPrefsWidget extends StatefulWidget {
  const EditDietPrefsWidget({super.key});

  @override
  State<EditDietPrefsWidget> createState() => _EditDietPrefsWidgetState();
}

class _EditDietPrefsWidgetState extends State<EditDietPrefsWidget> {
  late EditDietPrefsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditDietPrefsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_DIET_PREFS_editDietPrefs_ON_INIT_ST');
      logFirebaseEvent('editDietPrefs_firestore_query');
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
                    logFirebaseEvent('EDIT_DIET_PREFS_arrow_back_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Text(
              'Dietary Preferences',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
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
                'Other'
              ],
              onChanged: (val) =>
                  safeSetState(() => _model.dietChkBoxValues = val),
              controller: _model.dietChkBoxValueController ??=
                  FormFieldController<List<String>>(
                List.from(_model.testout?.dietaryPreferences ?? []),
              ),
              activeColor: FlutterFlowTheme.of(context).primary,
              checkColor: FlutterFlowTheme.of(context).info,
              checkboxBorderColor: FlutterFlowTheme.of(context).secondaryText,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
              checkboxBorderRadius: BorderRadius.circular(4.0),
              initialized: _model.dietChkBoxValues != null,
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('EDIT_DIET_PREFS_dietPrefConfirm_ON_TAP');
                logFirebaseEvent('dietPrefConfirm_backend_call');

                await _model.testout!.reference.update({
                  ...mapToFirestore(
                    {
                      'dietary_preferences': _model.dietChkBoxValues,
                    },
                  ),
                });
                logFirebaseEvent('dietPrefConfirm_bottom_sheet');
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
