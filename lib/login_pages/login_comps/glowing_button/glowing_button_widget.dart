import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'glowing_button_model.dart';
export 'glowing_button_model.dart';

class GlowingButtonWidget extends StatefulWidget {
  const GlowingButtonWidget({super.key});

  @override
  State<GlowingButtonWidget> createState() => _GlowingButtonWidgetState();
}

class _GlowingButtonWidgetState extends State<GlowingButtonWidget> {
  late GlowingButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlowingButtonModel());

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
      height: 200.0,
      constraints: BoxConstraints(
        maxHeight: 56.0,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Color(0x80E79C3B),
            offset: Offset(
              0.0,
              9.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(1000.0),
      ),
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4.5,
              color: Color(0x80B26E13),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(1000.0),
        ),
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 1.5,
                color: Color(0x80905507),
                offset: Offset(
                  0.0,
                  0.5,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(1000.0),
          ),
          child: FFButtonWidget(
            key: ValueKey('Button_1eym'),
            onPressed: () async {
              logFirebaseEvent('GLOWING_BUTTON_GET_STARTED_BTN_ON_TAP');
              logFirebaseEvent('Button_navigate_to');

              context.goNamed(CreateAccountTest1Widget.routeName);
            },
            text: 'Get Started',
            options: FFButtonOptions(
              width: MediaQuery.sizeOf(context).width * 3.42,
              height: 200.1,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Inter Tight',
                    color: Colors.white,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ),
    );
  }
}
