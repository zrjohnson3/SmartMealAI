import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'refresh_meal_alert_model.dart';
export 'refresh_meal_alert_model.dart';

class RefreshMealAlertWidget extends StatefulWidget {
  const RefreshMealAlertWidget({
    super.key,
    required this.messageText,
    required this.closeDialog,
  });

  final String? messageText;
  final Future Function()? closeDialog;

  @override
  State<RefreshMealAlertWidget> createState() => _RefreshMealAlertWidgetState();
}

class _RefreshMealAlertWidgetState extends State<RefreshMealAlertWidget> {
  late RefreshMealAlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RefreshMealAlertModel());

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
      width: 300.0,
      height: 300.0,
      constraints: BoxConstraints(
        minWidth: 300.0,
        minHeight: 300.0,
        maxWidth: 300.0,
        maxHeight: MediaQuery.sizeOf(context).height * 3.0,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'REFRESH_MEAL_ALERT_close_rounded_ICN_ON_');
                      logFirebaseEvent('IconButton_execute_callback');
                      await widget.closeDialog?.call();
                    },
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://imgs.search.brave.com/FOlN1ITypJ7--TTUYXKmAotiWa5ab6x617XYi76FHzE/rs:fit:200:200:1:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS12ZWN0b3Iv/dmFyaW91cy1zd2Vl/dHMtd2hpdGUtYmFj/a2dyb3VuZF8xMzA4/LTkyODU5LmpwZw',
                  width: 153.94,
                  height: 87.2,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.messageText,
                    'N/A',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Divider(
                thickness: 4.0,
                color: FlutterFlowTheme.of(context).primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
