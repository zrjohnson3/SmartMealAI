import '/flutter_flow/flutter_flow_util.dart';
import '/main_pages/main_page_comps/bottom_nav/bottom_nav_widget.dart';
import '/main_pages/main_page_comps/nutrition_bar/nutrition_bar_widget.dart';
import '/index.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  List<double> totalCalories = [];
  void addToTotalCalories(double item) => totalCalories.add(item);
  void removeFromTotalCalories(double item) => totalCalories.remove(item);
  void removeAtIndexFromTotalCalories(int index) =>
      totalCalories.removeAt(index);
  void insertAtIndexInTotalCalories(int index, double item) =>
      totalCalories.insert(index, item);
  void updateTotalCaloriesAtIndex(int index, Function(double) updateFn) =>
      totalCalories[index] = updateFn(totalCalories[index]);

  String chats = 'N/A';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [AI Agent - Send Message to aiAgentAnthony] action in mealplanDisplay widget.
  String? aiAgent;
  // Model for nutritionBar component.
  late NutritionBarModel nutritionBarModel;
  // Model for bottomNav component.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    nutritionBarModel = createModel(context, () => NutritionBarModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    nutritionBarModel.dispose();
    bottomNavModel.dispose();
  }
}
