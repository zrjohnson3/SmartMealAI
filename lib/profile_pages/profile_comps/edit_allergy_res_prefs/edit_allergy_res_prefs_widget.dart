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
import 'edit_allergy_res_prefs_model.dart';
export 'edit_allergy_res_prefs_model.dart';

class EditAllergyResPrefsWidget extends StatefulWidget {
  const EditAllergyResPrefsWidget({super.key});

  @override
  State<EditAllergyResPrefsWidget> createState() =>
      _EditAllergyResPrefsWidgetState();
}

class _EditAllergyResPrefsWidgetState extends State<EditAllergyResPrefsWidget> {
  late EditAllergyResPrefsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditAllergyResPrefsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_ALLERGY_RES_PREFS_editAllergyResPre');
      logFirebaseEvent('editAllergyResPrefs_firestore_query');
      _model.userPrefOutput = await queryPreferencesRecordOnce(
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
                        'EDIT_ALLERGY_RES_PREFS_arrow_back_ICN_ON');
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Text(
              'Allergies & Restrictions',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                  ),
            ),
            StreamBuilder<List<PreferencesRecord>>(
              stream: queryPreferencesRecord(
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
                    allergiesRestrictChkBoxPreferencesRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final allergiesRestrictChkBoxPreferencesRecord =
                    allergiesRestrictChkBoxPreferencesRecordList.isNotEmpty
                        ? allergiesRestrictChkBoxPreferencesRecordList.first
                        : null;

                return FlutterFlowCheckboxGroup(
                  options: [
                    'Dairy',
                    'Eggs',
                    'Nuts',
                    'Shellfish',
                    'Soy',
                    'Wheat',
                    'Other'
                  ],
                  onChanged: (val) => safeSetState(
                      () => _model.allergiesRestrictChkBoxValues = val),
                  controller: _model.allergiesRestrictChkBoxValueController ??=
                      FormFieldController<List<String>>(
                    List.from(
                        _model.userPrefOutput?.allergiesRestrictions ?? []),
                  ),
                  activeColor: FlutterFlowTheme.of(context).primary,
                  checkColor: FlutterFlowTheme.of(context).info,
                  checkboxBorderColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  checkboxBorderRadius: BorderRadius.circular(4.0),
                  initialized: _model.allergiesRestrictChkBoxValues != null,
                );
              },
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('EDIT_ALLERGY_RES_PREFS_allergyRestrictCo');
                logFirebaseEvent('allergyRestrictConfirm_backend_call');

                await _model.userPrefOutput!.reference.update({
                  ...mapToFirestore(
                    {
                      'allergies_restrictions':
                          _model.allergiesRestrictChkBoxValues,
                    },
                  ),
                });
                logFirebaseEvent('allergyRestrictConfirm_bottom_sheet');
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
