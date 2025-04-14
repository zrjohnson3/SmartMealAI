import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'tos_page_model.dart';
export 'tos_page_model.dart';

class TosPageWidget extends StatefulWidget {
  const TosPageWidget({super.key});

  static String routeName = 'tosPage';
  static String routePath = '/tosPage';

  @override
  State<TosPageWidget> createState() => _TosPageWidgetState();
}

class _TosPageWidgetState extends State<TosPageWidget>
    with TickerProviderStateMixin {
  late TosPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TosPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'tosPage'});
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
                padding: EdgeInsets.all(24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
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
                        logFirebaseEvent('TOS_PAGE_PAGE_arrow_back_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed(ProfilePageWidget.routeName);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'Please don\'t steal our idea :(',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
