import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mealplan_display_model.dart';
export 'mealplan_display_model.dart';

class MealplanDisplayWidget extends StatefulWidget {
  const MealplanDisplayWidget({
    super.key,
    String? mealName,
    double? mealCalories,
    String? mealImage,
    this.mealRecipe,
    required this.checkAction,
    required this.deleteAction,
    required this.isFavorite,
    String? mealType,
    required this.recipeAction,
  })  : this.mealName = mealName ?? 'N/A',
        this.mealCalories = mealCalories ?? 0.0,
        this.mealImage = mealImage ??
            'https://imgs.search.brave.com/tGWn6WEctvS_GOdRvb9204JUV2YnbEurmG1GijWLX0k/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzEwLzM1LzIzLzMw/LzM2MF9GXzEwMzUy/MzMwMThfclhvQk81/TnpuQlNRa1p5N3JO/ODI5djZ2RllTcUNI/Y2suanBn',
        this.mealType = mealType ?? 'N/A';

  final String mealName;
  final double mealCalories;
  final String mealImage;
  final List<String>? mealRecipe;
  final Future Function()? checkAction;
  final Future Function()? deleteAction;
  final bool? isFavorite;

  /// breakfast, lunch, or dinner
  final String mealType;

  final Future Function()? recipeAction;

  @override
  State<MealplanDisplayWidget> createState() => _MealplanDisplayWidgetState();
}

class _MealplanDisplayWidgetState extends State<MealplanDisplayWidget> {
  late MealplanDisplayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MealplanDisplayModel());

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
      constraints: BoxConstraints(
        maxHeight: 500.0,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  1.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MEALPLAN_DISPLAY_Image_1c8m3tnc_ON_TAP');
                      logFirebaseEvent('Image_execute_callback');
                      await widget.recipeAction?.call();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          widget.mealImage,
                          'https://search.brave.com/images?q=cartoon+food+image&context=W3sic3JjIjoiaHR0cHM6Ly9pbWdzLnNlYXJjaC5icmF2ZS5jb20vd1lPWXVzY29yOXRld2lpVnNVc0ZuWUJORm9HQVV3aWJUNmo5MW9SZFJGYy9yczpmaXQ6NTAwOjA6MDowL2c6Y2UvYUhSMGNITTZMeTlwYldkei9Mbk5sWVhKamFDNWljbUYyL1pTNWpiMjB2Ym10UGJWOVMvYUUxSmJtRlZVbDkxZURodC9iRTl2VmpKdVRHaFVPRVZxL1FYSlBaa1J2TkU0MlpWOTAvY3k5eWN6cG1hWFE2TlRZdy9Pak15TURveE9qQXZaenBqL1pTOWhTRkl3WTBoTk5reDUvT1RCTmVUVnRMMlJIVG10aS9hVFYxV2xoUmRtRnVRbTR2L1RIcEJNMHg2WXpKTWVsVXkvVEhwbk1pOU1lazB5VFVZNS9SMWg2WXpOT2FsVXlMMDlFL1dYcE9NVGxFVFd0V2QxTXcvVVRNdlZVWmtObVZGU25OVi9TR1JPWTFVMWRTOU9TR015L1dUSXhTbUZHWkVWWlZFWXkvTDFkRE5YRmpSMk0uanBlZyIsInRleHQiOiJjYXJ0b29uIHBsYXRlIG9mIGZvb2QiLCJwYWdlX3VybCI6Imh0dHBzOi8vc3RvY2suYWRvYmUuY29tL3NlYXJjaD9rPWNhcnRvb24rcGxhdGUrb2YrZm9vZCJ9XQ%3D%3D&sig=b7c09bfaffd97f857f375a240943c53b922826afd7c9c315634c8b85feb3fd38&nonce=8051628bd5a9a87f81a0530c90cc56d7&source=llmImg',
                        ),
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.mealName,
                          'N/A',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.mealCalories.toString(),
                          '0.0',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        widget.mealType,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).alternate,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue ??= widget.isFavorite!,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.checkboxValue = newValue!);
                      if (newValue!) {
                        logFirebaseEvent(
                            'MEALPLAN_DISPLAY_Checkbox_fga3rfrv_ON_TO');
                        logFirebaseEvent('Checkbox_execute_callback');
                        await widget.checkAction?.call();
                      } else {
                        logFirebaseEvent(
                            'MEALPLAN_DISPLAY_Checkbox_fga3rfrv_ON_TO');
                        logFirebaseEvent('Checkbox_execute_callback');
                        await widget.deleteAction?.call();
                      }
                    },
                    side: BorderSide(
                      width: 2,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
