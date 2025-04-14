import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'notifs_page_model.dart';
export 'notifs_page_model.dart';

class NotifsPageWidget extends StatefulWidget {
  const NotifsPageWidget({super.key});

  static String routeName = 'notifsPage';
  static String routePath = '/notifsPage';

  @override
  State<NotifsPageWidget> createState() => _NotifsPageWidgetState();
}

class _NotifsPageWidgetState extends State<NotifsPageWidget>
    with TickerProviderStateMixin {
  late NotifsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotifsPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'notifsPage'});
    _model.switchValue1 = true;
    _model.switchValue2 = true;
    _model.switchValue3 = false;
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

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
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x10000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'NOTIFS_PAGE_PAGE_arrow_back_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_navigate_to');

                            context.pushNamed(ProfilePageWidget.routeName);
                          },
                        ),
                        Text(
                          'Notification Preferences',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Daily Reminders',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Switch(
                              value: _model.switchValue1!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue1 = newValue);
                              },
                              activeColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).primary,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Weekly Progress Reports',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Switch(
                              value: _model.switchValue2!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue2 = newValue);
                              },
                              activeColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).primary,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'New Features',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Switch(
                              value: _model.switchValue3!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue3 = newValue);
                              },
                              activeColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).primary,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('NOTIFS_PAGE_PAGE_CONFIRM_BTN_ON_TAP');
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(ProfilePageWidget.routeName);
                },
                text: 'Confirm',
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
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
