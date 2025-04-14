import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'full_meal_display_model.dart';
export 'full_meal_display_model.dart';

class FullMealDisplayWidget extends StatefulWidget {
  const FullMealDisplayWidget({
    super.key,
    String? mealName,
    String? mealImage,
    double? mealCalories,
    this.mealRecipe,
    String? mealCuisine,
    String? mealType,
    this.isFavorite,
    required this.checkAction,
    required this.deleteAction,
    required this.bottomSheetAction,
  })  : this.mealName = mealName ?? 'N/A',
        this.mealImage = mealImage ??
            'https://imgs.search.brave.com/6z8TEuwCEHTFxR0EgXoaqn-ey2QV3z8bTCeM_sVTPKc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvNTAwcC80/NS81NS9mYXN0LWZv/b2QtaW4tY2FydG9v/bi1zdHlsZS1waWN0/dXJlcy12ZWN0b3It/MTUzNjQ1NTUuanBn',
        this.mealCalories = mealCalories ?? 0.0,
        this.mealCuisine = mealCuisine ?? 'N/A',
        this.mealType = mealType ?? 'N/A';

  final String mealName;
  final String mealImage;
  final double mealCalories;
  final List<String>? mealRecipe;
  final String mealCuisine;
  final String mealType;
  final bool? isFavorite;
  final Future Function()? checkAction;
  final Future Function()? deleteAction;
  final Future Function()? bottomSheetAction;

  @override
  State<FullMealDisplayWidget> createState() => _FullMealDisplayWidgetState();
}

class _FullMealDisplayWidgetState extends State<FullMealDisplayWidget> {
  late FullMealDisplayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FullMealDisplayModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Container(
          width: 320.0,
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
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('FULL_MEAL_DISPLAY_Image_z9lpwd2j_ON_TAP');
                    logFirebaseEvent('Image_execute_callback');
                    await widget.bottomSheetAction?.call();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      valueOrDefault<String>(
                        widget.mealImage,
                        'https://imgs.search.brave.com/6z8TEuwCEHTFxR0EgXoaqn-ey2QV3z8bTCeM_sVTPKc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvNTAwcC80/NS81NS9mYXN0LWZv/b2QtaW4tY2FydG9v/bi1zdHlsZS1waWN0/dXJlcy12ZWN0b3It/MTUzNjQ1NTUuanBn',
                      ),
                      width: double.infinity,
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.mealName,
                          'N/A',
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.mealType,
                                  'N/A',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue ??=
                                        widget.isFavorite!,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.checkboxValue = newValue!);
                                      if (newValue!) {
                                        logFirebaseEvent(
                                            'FULL_MEAL_DISPLAY_Checkbox_xh9qk5mu_ON_T');
                                        logFirebaseEvent(
                                            'Checkbox_execute_callback');
                                        await widget.checkAction?.call();
                                      } else {
                                        logFirebaseEvent(
                                            'FULL_MEAL_DISPLAY_Checkbox_xh9qk5mu_ON_T');
                                        logFirebaseEvent(
                                            'Checkbox_execute_callback');
                                        await widget.deleteAction?.call();
                                      }
                                    },
                                    side: BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 4.0, 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.mealCalories.toString(),
                              '0.0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.mealCuisine,
                        'N/A',
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingredients:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              functions
                                  .recipeConvert(widget.mealRecipe?.toList()),
                              'N/A',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
