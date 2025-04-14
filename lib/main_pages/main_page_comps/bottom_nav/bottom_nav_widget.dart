import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_model.dart';
export 'bottom_nav_model.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  late BottomNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavModel());

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
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
        height: 80.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                -2.0,
              ),
              spreadRadius: 0.0,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 50.0,
                    fillColor: Colors.transparent,
                    icon: Icon(
                      Icons.home_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'BOTTOM_NAV_COMP_home_rounded_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(DashboardWidget.routeName);
                    },
                  ),
                  Text(
                    'Home',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 50.0,
                    fillColor: Colors.transparent,
                    icon: Icon(
                      Icons.favorite_border_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'BOTTOM_NAV_favorite_border_rounded_ICN_O');
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(FavMealViewWidget.routeName);
                    },
                  ),
                  Text(
                    'Favorites',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 50.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.add_rounded,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'BOTTOM_NAV_COMP_add_rounded_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(SurveyFoodOptionWidget.routeName);
                    },
                  ),
                  Text(
                    'Create',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 50.0,
                    fillColor: Colors.transparent,
                    icon: Icon(
                      Icons.person_outline_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'BOTTOM_NAV_person_outline_rounded_ICN_ON');
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed(ProfilePageWidget.routeName);
                    },
                  ),
                  Text(
                    'Profile',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
