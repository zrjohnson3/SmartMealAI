import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'dashboard_place_holder_model.dart';
export 'dashboard_place_holder_model.dart';

class DashboardPlaceHolderWidget extends StatefulWidget {
  const DashboardPlaceHolderWidget({super.key});

  static String routeName = 'dashboardPlaceHolder';
  static String routePath = '/dashboardPlaceHolder';

  @override
  State<DashboardPlaceHolderWidget> createState() =>
      _DashboardPlaceHolderWidgetState();
}

class _DashboardPlaceHolderWidgetState
    extends State<DashboardPlaceHolderWidget> {
  late DashboardPlaceHolderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardPlaceHolderModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'dashboardPlaceHolder'});
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('DASHBOARD_PLACE_HOLDER_LOG_OUT_BTN_ON_TA');
                  logFirebaseEvent('Button_auth');
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  context.goNamedAuth(
                      GetStartedWidget.routeName, context.mounted);
                },
                text: 'Log Out',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('DASHBOARD_PLACE_HOLDER_DASHBOARD_BTN_ON_');
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(DashboardWidget.routeName);
                },
                text: 'Dashboard',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('DASHBOARD_PLACE_HOLDER_PROFILE_BTN_ON_TA');
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(ProfilePageWidget.routeName);
                },
                text: 'Profile',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
      ),
    );
  }
}
