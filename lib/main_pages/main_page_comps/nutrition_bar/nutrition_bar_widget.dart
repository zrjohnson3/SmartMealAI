import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'nutrition_bar_model.dart';
export 'nutrition_bar_model.dart';

class NutritionBarWidget extends StatefulWidget {
  const NutritionBarWidget({
    super.key,
    required this.calorieValue,
    required this.proteinValue,
    required this.fatValue,
    required this.calorieText,
  });

  final double? calorieValue;
  final double? proteinValue;
  final double? fatValue;
  final int? calorieText;

  @override
  State<NutritionBarWidget> createState() => _NutritionBarWidgetState();
}

class _NutritionBarWidgetState extends State<NutritionBarWidget> {
  late NutritionBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutritionBarModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Nutrition Facts',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Inter Tight',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Calories',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.calorieText?.toString(),
                            'N/A',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE0E3E7),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: LinearPercentIndicator(
                              percent: widget.calorieValue!,
                              lineHeight: 12.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).primary,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Protein',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.proteinValue?.toString(),
                            'N/A',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: LinearPercentIndicator(
                            percent: widget.proteinValue!,
                            lineHeight: 12.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: FlutterFlowTheme.of(context).primary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fat',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.fatValue?.toString(),
                            'N/A',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: LinearPercentIndicator(
                            percent: widget.fatValue!,
                            lineHeight: 12.0,
                            animation: true,
                            animateFromLastPercent: true,
                            progressColor: FlutterFlowTheme.of(context).primary,
                            backgroundColor:
                                FlutterFlowTheme.of(context).accent4,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
