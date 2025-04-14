import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'recipe_from_ai_model.dart';
export 'recipe_from_ai_model.dart';

class RecipeFromAiWidget extends StatefulWidget {
  const RecipeFromAiWidget({
    super.key,
    required this.mealName,
    required this.mealRecipeFromAi,
  });

  final String? mealName;
  final String? mealRecipeFromAi;

  @override
  State<RecipeFromAiWidget> createState() => _RecipeFromAiWidgetState();
}

class _RecipeFromAiWidgetState extends State<RecipeFromAiWidget> {
  late RecipeFromAiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipeFromAiModel());

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
      width: 304.6,
      height: 294.37,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.mealRecipeFromAi,
                      'N/A',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
    );
  }
}
