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
        nutrientStr += "- ";
      }
      if (!excludedLabels.contains(label) && unit != excludedUnit) {
        nutrientStr +=
            "$label: ${(quantity / numServings).toStringAsFixed(1)}$unit\n";
      }
    }
  });

  return nutrientStr;
  //return nutrientStr.isNotEmpty ? nutrientStr : null;
}

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

int? dayOfPlan(DateTime? lastCreatedMeal) {
  if (lastCreatedMeal == null) {
    return 4;
  }

  // Get current date in UTC to match Firestore timestamps
  final now = DateTime.now().toUtc();
  final today = DateTime.utc(now.year, now.month, now.day);

  // Convert the meal date to UTC if it isn't already
  final planDay = DateTime.utc(
    lastCreatedMeal.year,
    lastCreatedMeal.month,
    lastCreatedMeal.day,
  );

  // Calculate days between the dates
  final daysDifference = today.difference(planDay).inDays;

  // Handle future dates (though this shouldn't normally happen)
  if (daysDifference < 0) {
    return 4;
  }

  // Return appropriate value based on the difference
  switch (daysDifference) {
    case 0:
      return 1; // Same day
    case 1:
      return 2; // One day after
    case 2:
      return 3; // Two days after
    default:
      return 4; // More than 2 days after
  }
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
