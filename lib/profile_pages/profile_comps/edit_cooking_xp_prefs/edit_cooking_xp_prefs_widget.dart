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
import 'edit_cooking_xp_prefs_model.dart';
export 'edit_cooking_xp_prefs_model.dart';

class EditCookingXpPrefsWidget extends StatefulWidget {
  const EditCookingXpPrefsWidget({super.key});

  @override
  State<EditCookingXpPrefsWidget> createState() =>
      _EditCookingXpPrefsWidgetState();
}

class _EditCookingXpPrefsWidgetState extends State<EditCookingXpPrefsWidget> {
  late EditCookingXpPrefsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCookingXpPrefsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_COOKING_XP_PREFS_editCookingXpPrefs');
      logFirebaseEvent('editCookingXpPrefs_firestore_query');
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
                        'EDIT_COOKING_XP_PREFS_arrow_back_ICN_ON_');
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Text(
              'Cooking Experience',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
              child: FlutterFlowDropDown<String>(
                controller: _model.cookingExperienceDpDnValueController ??=
                    FormFieldController<String>(
                  _model.cookingExperienceDpDnValue ??=
                      _model.testout?.cookingExperience,
                ),
                options: ['Beginner', 'Intermediate', 'Advanced'],
                onChanged: (val) =>
                    safeSetState(() => _model.cookingExperienceDpDnValue = val),
                width: double.infinity,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                hintText: 'Select your cooking level',
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
                logFirebaseEvent('EDIT_COOKING_XP_PREFS_cookXpConfirm_ON_T');
                logFirebaseEvent('cookXpConfirm_backend_call');

                await _model.testout!.reference
                    .update(createPreferencesRecordData(
                  cookingExperience: _model.cookingExperienceDpDnValue,
                ));
                logFirebaseEvent('cookXpConfirm_bottom_sheet');
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
