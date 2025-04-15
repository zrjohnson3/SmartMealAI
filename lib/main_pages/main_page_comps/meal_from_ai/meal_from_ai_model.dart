import '/flutter_flow/flutter_flow_util.dart';
import 'meal_from_ai_widget.dart' show MealFromAiWidget;
import 'package:flutter/material.dart';

class MealFromAiModel extends FlutterFlowModel<MealFromAiWidget> {
  ///  Local state fields for this component.

  String mealName = 'N/A';

  String mealImage =
      'https://imgs.search.brave.com/6z8TEuwCEHTFxR0EgXoaqn-ey2QV3z8bTCeM_sVTPKc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/dmVjdG9yc3RvY2su/Y29tL2kvNTAwcC80/NS81NS9mYXN0LWZv/b2QtaW4tY2FydG9v/bi1zdHlsZS1waWN0/dXJlcy12ZWN0b3It/MTUzNjQ1NTUuanBn';

  double? mealCalories = 0.0;

  List<String> mealRecipe = [];
  void addToMealRecipe(String item) => mealRecipe.add(item);
  void removeFromMealRecipe(String item) => mealRecipe.remove(item);
  void removeAtIndexFromMealRecipe(int index) => mealRecipe.removeAt(index);
  void insertAtIndexInMealRecipe(int index, String item) =>
      mealRecipe.insert(index, item);
  void updateMealRecipeAtIndex(int index, Function(String) updateFn) =>
      mealRecipe[index] = updateFn(mealRecipe[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
