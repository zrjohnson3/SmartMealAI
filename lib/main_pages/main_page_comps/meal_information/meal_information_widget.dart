import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'meal_information_model.dart';
export 'meal_information_model.dart';

class MealInformationWidget extends StatefulWidget {
  const MealInformationWidget({
    super.key,
    String? mealName,
    String? mealImage,
    double? mealCalories,
    this.mealRecipe,
    required this.mealCuisine,
    required this.mealNutrients,
    required this.mealRecipeURL,
    int? mealServings,
  })  : this.mealName = mealName ?? 'N/A',
        this.mealImage = mealImage ??
            'https://imgs.search.brave.com/6z8TEuwCEHTFxR0EgXoaqn-ey2QV3z8bTCeM_sVTPKc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvNTAwcC80/NS81NS9mYXN0LWZv/b2QtaW4tY2FydG9v/bi1zdHlsZS1waWN0/dXJlcy12ZWN0b3It/MTUzNjQ1NTUuanBn',
        this.mealCalories = mealCalories ?? 0.0,
        this.mealServings = mealServings ?? 1;

  final String mealName;
  final String mealImage;
  final double mealCalories;
  final List<String>? mealRecipe;
  final String? mealCuisine;
  final String? mealNutrients;
  final String? mealRecipeURL;
  final int mealServings;

  @override
  State<MealInformationWidget> createState() => _MealInformationWidgetState();
}

class _MealInformationWidgetState extends State<MealInformationWidget> {
  late MealInformationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MealInformationModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 36.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('MEAL_INFORMATION_COMP_close_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_bottom_sheet');
                  Navigator.pop(context);
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image.network(
                      valueOrDefault<String>(
                        widget.mealImage,
                        'https://imgs.search.brave.com/6z8TEuwCEHTFxR0EgXoaqn-ey2QV3z8bTCeM_sVTPKc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvNTAwcC80/NS81NS9mYXN0LWZv/b2QtaW4tY2FydG9v/bi1zdHlsZS1waWN0/dXJlcy12ZWN0b3It/MTUzNjQ1NTUuanBn',
                      ),
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.mealName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 4.0, 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              widget.mealCalories.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 4.0),
                        child: Text(
                          valueOrDefault<String>(
                            functions.numServings(widget.mealServings),
                            '1',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'MEAL_INFORMATION_COMP_recipeURL_ON_TAP');
                            logFirebaseEvent('recipeURL_launch_u_r_l');
                            await launchURL(widget.mealRecipeURL!);
                          },
                          child: Text(
                            'Online Recipe',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).primaryText,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Ingredients',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            functions
                                .recipeConvert(widget.mealRecipe?.toList()),
                            'NA',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Nutrition',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.mealNutrients,
                            'null',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
