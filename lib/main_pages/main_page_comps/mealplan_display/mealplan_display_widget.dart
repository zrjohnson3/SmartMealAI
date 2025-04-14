import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
                        widget.mealImage,
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
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.mealCalories.toString(),
                          '0.0',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        widget.mealType,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
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
