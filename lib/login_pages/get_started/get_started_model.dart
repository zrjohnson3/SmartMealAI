import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/login_pages/login_comps/glowing_button/glowing_button_widget.dart';
import '/index.dart';
import 'get_started_widget.dart' show GetStartedWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class GetStartedModel extends FlutterFlowModel<GetStartedWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for GlowingButton component.
  late GlowingButtonModel glowingButtonModel;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 2000;
  int timerMilliseconds = 2000;
  String timerValue = StopWatchTimer.getDisplayTime(
    2000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {
    glowingButtonModel = createModel(context, () => GlowingButtonModel());
  }

  @override
  void dispose() {
    glowingButtonModel.dispose();
    timerController.dispose();
  }
}
