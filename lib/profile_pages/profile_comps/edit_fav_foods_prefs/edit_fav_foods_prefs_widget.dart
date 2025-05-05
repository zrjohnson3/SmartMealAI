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
import 'package:google_fonts/google_fonts.dart';
import 'edit_fav_foods_prefs_model.dart';
export 'edit_fav_foods_prefs_model.dart';

class EditFavFoodsPrefsWidget extends StatefulWidget {
  const EditFavFoodsPrefsWidget({
    super.key,
    required this.exitAction,
    required this.callbackAction,
  });

  final Future Function()? exitAction;
  final Future Function()? callbackAction;

  @override
  State<EditFavFoodsPrefsWidget> createState() =>
      _EditFavFoodsPrefsWidgetState();
}

class _EditFavFoodsPrefsWidgetState extends State<EditFavFoodsPrefsWidget> {
  late EditFavFoodsPrefsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditFavFoodsPrefsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_FAV_FOODS_PREFS_editFavFoodsPrefs_O');
      logFirebaseEvent('editFavFoodsPrefs_firestore_query');
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
                        'EDIT_FAV_FOODS_PREFS_arrow_back_ICN_ON_T');
                    logFirebaseEvent('IconButton_execute_callback');
                    await widget.exitAction?.call();
                  },
                ),
              ],
            ),
            Text(
              'Favorite Cuisine',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.interTight(
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
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
                'French'
              ],
              onChanged: (val) async {
                safeSetState(
                    () => _model.favoriteCuisinesCheckboxGroupValues = val);
                logFirebaseEvent('EDIT_FAV_FOODS_PREFS_FavoriteCuisinesChe');
                logFirebaseEvent('FavoriteCuisinesCheckboxGroup_update_app');
                FFAppState().favCuisine = _model
                    .favoriteCuisinesCheckboxGroupValues!
                    .toList()
                    .cast<String>();
                safeSetState(() {});
              },
              controller:
                  _model.favoriteCuisinesCheckboxGroupValueController ??=
                      FormFieldController<List<String>>(
                List.from(_model.testout?.favoriteCuisine ?? []),
              ),
              activeColor: FlutterFlowTheme.of(context).primary,
              checkColor: FlutterFlowTheme.of(context).info,
              checkboxBorderColor: FlutterFlowTheme.of(context).secondaryText,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
              checkboxBorderRadius: BorderRadius.circular(4.0),
              initialized: _model.favoriteCuisinesCheckboxGroupValues != null,
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('EDIT_FAV_FOODS_PREFS_favFoodConfirm_ON_T');
                logFirebaseEvent('favFoodConfirm_execute_callback');
                await widget.callbackAction?.call();
              },
              text: 'Confirm',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
