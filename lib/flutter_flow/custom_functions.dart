import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? recipeConvert(List<String>? recipeList) {
  // Create a function that takes in a list of strings and formats each item into its own bullet with a new line in between each one, making the return type of string
  if (recipeList == null || recipeList.isEmpty) {
    return null; // Return null if the input list is null or empty
  }

  final validRecipes = recipeList
      .where((recipe) => RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(recipe));

  return validRecipes
      .map((item) => '• $item')
      .join('\n'); // Format each item with a bullet and join with new lines
}

int? calorieConvert(
  double? calorieNum,
  int? totalServings,
) {
  // take in a double of calories and an integer or servings, return the calories per serving in a rounded integer
  if (calorieNum == null || totalServings == null || totalServings <= 0) {
    return null; // Return null if inputs are invalid
  }

  double caloriePerServing = calorieNum / totalServings;
  return caloriePerServing.round(); // Return the rounded calories per serving
}

String? cuisineConvert(List<String>? cuisineList) {
  // Write a function that takes in a list of strings and converts it to a string
  if (cuisineList == null || cuisineList.isEmpty) {
    return null; // Return null if the input list is null or empty
  }

  return cuisineList.join(', '); // Join the items with a comma and space
}

int? calorieTextConvert(double? calorieTotal) {
  // Write a function that takes in a value that is a percentage of 2000, I would like to multiply this percentage to get the correct total out of 2000 it is represented as an integer then return this integer
// Check if the input is null
  if (calorieTotal == null || calorieTotal < 0 || calorieTotal > 1) {
    return null; // Return null if input is invalid
  }

  // Calculate the total calories out of 2000
  int totalCalories = (calorieTotal * 2000).round();
  return totalCalories; // Return the calculated total calories
}

String? numServings(int? s) {
  if (s == null) {
    return null;
  }

  String servings = "$s serving";
  servings += s > 1 ? 's' : '';

  return servings;
}

double? totalCalorieAppStateConvert(List<double>? doubleList) {
  // Write me a function that takes in a list of doubles and adds them up and divides by 2000 to give a percentage out of 2000
  if (doubleList == null || doubleList.isEmpty) {
    return null; // Return null if the input list is null or empty
  }

  double total =
      doubleList.reduce((a, b) => a + b); // Sum all values in the list
  return total / 2000; // Return the total divided by 2000
}

double? caloriePercentageForNutritionBar(List<int>? intList) {
// Write a function that takes in a list of integers, adds all of them together, then divides by 2000 to give a percentage out of 2000 that the integers are. If it is more than .99 then return 1
  if (intList == null || intList.isEmpty) {
    return null; // Return null if the input list is null or empty
  }

  int total = intList.reduce((a, b) => a + b); // Sum all values in the list
  double percentage = total / 2000; // Calculate percentage out of 2000
  return percentage > 0.99
      ? 1.0
      : percentage; // Return 1 if greater than 0.99, else return percentage
}

String? aiAgentFormatting(
  List<String>? mealRecipe,
  String? mealName,
) {
  // Write a function that will take in a list of strings, and a string. I want the output to be a string with the string input mealName at the top, and each item of the recipe on a new line. The output will be one string
  if (mealRecipe == null || mealName == null)
    return null; // Check for null inputs
  StringBuffer output =
      StringBuffer(); // Create a StringBuffer for efficient string concatenation
  output.writeln(mealName); // Add the meal name at the top
  for (String item in mealRecipe) {
    // Iterate through each recipe item
    output.writeln(item); // Add each item on a new line
  }
  return output.toString(); // Return the final formatted string
}

int? dayOfPlan(DateTime? lastCreatedMeal) {
  // Create a function that takes in a datetime and grabs the current time. It normalizes these times to be dependent on only the month , day , and year. Then it will subtract the current time from the datetime argument and return the number of days that have passed since the datetime arguement
  if (lastCreatedMeal == null) return 4;

  DateTime currentTime = DateTime.now();
  DateTime normalizedLastCreatedMeal = DateTime(
    lastCreatedMeal.year,
    lastCreatedMeal.month,
    lastCreatedMeal.day,
  );

  DateTime normalizedCurrentTime = DateTime(
    currentTime.year,
    currentTime.month,
    currentTime.day,
  );

  int days = normalizedCurrentTime.difference(normalizedLastCreatedMeal).inDays;

  if (days == 0) {
    return 1;
  } else if (days == 1) {
    return 2;
  } else if (days == 2) {
    return 3;
  } else {
    return 4;
  }
}

List<String>? calorieDistributionFunction(int? calorieInput) {
  if (calorieInput == null) return null;

  List<String> distribution = [];

  int caloriePercent = (calorieInput * 0.2)
      .round(); //The breakfast is about 20% of the total calories
  int tempUnder = caloriePercent - 150, tempUpper = caloriePercent + 150;
  String calorieDistribution = "$tempUnder-$tempUpper";
  distribution.add(calorieDistribution);

  caloriePercent = (calorieInput * 0.35)
      .round(); //The breakfast is about 35% of the total calories
  tempUnder = caloriePercent - 150;
  tempUpper = caloriePercent + 150;
  calorieDistribution = "$tempUnder-$tempUpper";
  distribution.add(calorieDistribution);

  caloriePercent = (calorieInput * 0.45)
      .round(); //The breakfast is about 45% of the total calories
  tempUnder = caloriePercent - 150;
  tempUpper = caloriePercent + 150;
  calorieDistribution = "$tempUnder-$tempUpper";
  distribution.add(calorieDistribution);

  return distribution;
}

int calTargetDropDwn(String option) {
  if (option == "Under 1500 calories") {
    return 1200;
  } else if (option == "1500-2000 calories") {
    return 1700;
  } else if (option == "2000-2500 calories") {
    return 2200;
  } else if (option == "2500+ calories") {
    return 2700;
  } else {
    return 2000;
  }
}

int? calorieGoal(
  String age,
  String height,
  String gender,
  String activityLevel,
  String weight,
  String goal,
) {
  if (age == null ||
      weight == null ||
      height == null ||
      activityLevel == null ||
      gender == null ||
      goal == null) {
    return null;
  }
  int calorieGoalNum;

  double weightKg = double.parse(weight) * 4.5359237;
  double heightCm = double.parse((height.split("'"))[0]) * 12 +
      double.parse((height.split("'"))[1]);
  heightCm *= 2.54;
  gender = gender.toLowerCase();
  double bmr = weightKg + 6.25 * heightCm - 5 * int.parse(age);
  if (gender == "Man") {
    bmr += 5;
  } else if (gender == "Woman") {
    bmr -= 161;
  } else {
    bmr -= 78;
  }
  if (activityLevel == "Sedentary") {
    calorieGoalNum = (bmr * 1.2).round();
  } else if (activityLevel == "Light (Exercises 1-2 times a week)") {
    calorieGoalNum = (bmr * 1.375).round();
  } else if (activityLevel == "Moderate (Exercises 3-5 times a week)") {
    calorieGoalNum = (bmr * 1.55).round();
  } else if (activityLevel == "Heavy (Exercises 6-7 times a week)") {
    calorieGoalNum = (bmr * 1.725).round();
  } else {
    calorieGoalNum = (bmr * 1.9).round();
  }

  if (goal == "Fat loss") {
    calorieGoalNum -= 1000;
  } else if (goal == "Weight loss") {
    calorieGoalNum -= 500;
  } else if (goal == "Lean out") {
    calorieGoalNum -= 250;
  } else if (goal == "Muscle gain") {
    calorieGoalNum += 500;
  }

  return calorieGoalNum;
}

double dailyProgressNutrition(
  double daily,
  int target,
) {
  if (daily == null || target == null) {
    return 0.5;
  }
  if (daily / target > 1) {
    return 1;
  }
  return daily / target;
}

int recCarbIntake(
  String diet,
  int calories,
) {
  if (diet == "balanced") {
    return (calories * 0.4 / 4).round();
  } else if (diet == "high-protein") {
    return (calories * 0.3 / 4).round();
  } else if (diet == "low-fat") {
    return (calories * 0.5 / 4).round();
  } else {
    return (calories * .04 / 4).round();
  }
}

int recFatIntake(
  String diet,
  int calories,
) {
  if (diet == "balanced") {
    return (calories * 0.3 / 9).round();
  } else if (diet == "high-protein") {
    return (calories * 0.3 / 9).round();
  } else if (diet == "low-fat") {
    return (calories * 0.15 / 9).round();
  } else {
    return (calories * .3 / 9).round();
  }
}

int recProteinIntake(
  String diet,
  int calories,
) {
  if (diet == "balanced") {
    return (calories * 0.3 / 4).round();
  } else if (diet == "high-protein") {
    return (calories * 0.35 / 4).round();
  } else if (diet == "low-fat") {
    return (calories * 0.35 / 4).round();
  } else {
    return (calories * 0.35 / 4).round();
  }
}

int addTotalProgress(
  List<double> num1,
  List<double> num2,
  List<double> num3,
  List<int> num1Servings,
  List<int> num2Servings,
  List<int> num3Servings,
  int mealDay,
) {
  if (num1 == null || num2 == null || num3 == null || num1.length == 0) {
    return 1;
  }
  int day = mealDay - 1;
  double total = 0;
  total = (num1[day] / num1Servings[day]) +
      (num2[day] / num2Servings[day]) +
      (num3[day] / num3Servings[day]);

  return total.round();
}

String? aiFormatSummary(
  int? proteinGoal,
  int? fatGoal,
  int? carbGoal,
  int? proteinTotal,
  int? fatTotal,
  int? carbTotal,
  String? healthGoals,
  String? activityLevel,
) {
  String protein = '${proteinTotal ?? 0}/${proteinGoal ?? 0} protein';
  String fat = '${fatTotal ?? 0}/${fatGoal ?? 0} fat';
  String carbs = '${carbTotal ?? 0}/${carbGoal ?? 0} carbs';
  String activity = '$activityLevel activity';
  String health = '$healthGoals health';

  // Check if mealNames is a List and handle it properly

  return '$protein\n$fat\n$carbs\n$activity\n$health';
}

String? nutrientConvert(
  dynamic nutrientList,
  int? numServings,
) {
  if (nutrientList == null || numServings == null) {
    return "null";
  }

  String nutrientStr = "";

  String excludedUnit = "Âµg";

  // Set of labels we want to exclude
  final excludedLabels = {
    "Energy",
    "Carbohydrates (net)",
    "Folate equivalent (total)",
    "Folate (food)",
    "Folic acid"
  };

  final includedLabels = {
    "Saturated",
    "Trans",
    "Monounsaturated",
    "Polyunsaturated",
    "Fiber",
    "Sugars"
  };

  final nutrients = nutrientList as Map<String, dynamic>;

  nutrients.forEach((key, value) {
    final quantity = value['quantity'];
    final label = value['label'];
    final unit = value['unit'];

    // Skip excluded nutrients and skip any zero quantity
    if (quantity is num &&
        ((quantity > 0 && unit == "g") || (quantity > 25 && unit == "mg")) &&
        label is String &&
        unit is String) {
      if (includedLabels.contains(label)) {
        nutrientStr += "\t\t   ";
      } else if (!excludedLabels.contains(label) && unit != excludedUnit) {
        nutrientStr += "• ";
      }
      if (!excludedLabels.contains(label) && unit != excludedUnit) {
        double tempHolder = quantity / numServings;
        nutrientStr += "$label: ${(tempHolder).toStringAsFixed(1)}$unit\n";
      }
    }
  });

  return nutrientStr;
  //return nutrientStr.isNotEmpty ? nutrientStr : null;
}

int? subtractForIndex(int? dayDisplay) {
  if (dayDisplay == null) {
    return 0;
  }
  return dayDisplay - 1;
}
