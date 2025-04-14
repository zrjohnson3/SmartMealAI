import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EdamamAPICallCall {
  static Future<ApiCallResponse> call({
    String? diet = 'balanced',
    String? caution,
  }) async {
    caution ??= null;

    return ApiManager.instance.makeApiCall(
      callName: 'EdamamAPICall',
      apiUrl:
          'https://api.edamam.com/api/recipes/v2?type=public&app_id=dd17f47b&app_key=3b712881cd0c24ba5a16a560c5d37358&mealType=Breakfast&mealType=Lunch&mealType=Dinner&random=true&calories=500-600',
      callType: ApiCallType.GET,
      headers: {
        'Edamam-Account-User': 'samron03',
      },
      params: {
        'diet': diet,
        'caution': caution,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? mealName1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.label''',
      ));
  static double? mealCalories1(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[0].recipe.calories''',
      ));
  static List<String>? mealRecipe1(dynamic response) => (getJsonField(
        response,
        r'''$.hits[0].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealName2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.label''',
      ));
  static double? mealCalories2(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[1].recipe.calories''',
      ));
  static List<String>? mealRecipe2(dynamic response) => (getJsonField(
        response,
        r'''$.hits[1].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealName3(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.label''',
      ));
  static double? mealCalories3(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[2].recipe.calories''',
      ));
  static List<String>? mealRecipe3(dynamic response) => (getJsonField(
        response,
        r'''$.hits[2].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealImage1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.image''',
      ));
  static String? mealImage2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.image''',
      ));
  static String? mealImage3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.image''',
      ));
  static List? mealIngredients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.ingredients''',
        true,
      ) as List?;
  static List? mealIngredients2(dynamic response) => getJsonField(
        response,
        r'''$.hits[1].recipe.ingredients''',
        true,
      ) as List?;
  static List? mealIngredients3(dynamic response) => getJsonField(
        response,
        r'''$.hits[2].recipe.ingredients''',
        true,
      ) as List?;
  static dynamic totalNutrients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.totalNutrients''',
      );
  static int? mealServings1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[0].recipe.yield''',
      ));
  static int? mealServings2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[1].recipe.yield''',
      ));
  static int? mealServings3(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[2].recipe.yield''',
      ));
  static String? mealID1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.uri''',
      ));
  static List<double>? totalCalories(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].recipe.calories''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine1(dynamic response) => (getJsonField(
        response,
        r'''$.hits[0].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine2(dynamic response) => (getJsonField(
        response,
        r'''$.hits[1].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine3(dynamic response) => (getJsonField(
        response,
        r'''$.hits[2].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic totalNutrients2(dynamic response) => getJsonField(
        response,
        r'''$.hits[1].recipe.totalNutrients''',
      );
  static dynamic totalNutrients3(dynamic response) => getJsonField(
        response,
        r'''$.hits[2].recipe.totalNutrients''',
      );
  static String? mealRecipeURL1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.url''',
      ));
  static String? mealRecipeURL2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.url''',
      ));
  static String? mealRecipeURL3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.url''',
      ));
  static List? mealNutrients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.totalNutrients''',
        true,
      ) as List?;
}

class EdamamAPICallDinnerCall {
  static Future<ApiCallResponse> call({
    String? diet = 'balanced',
    String? caution,
  }) async {
    caution ??= null;

    return ApiManager.instance.makeApiCall(
      callName: 'EdamamAPICallDinner',
      apiUrl:
          'https://api.edamam.com/api/recipes/v2?type=public&app_id=dd17f47b&app_key=3b712881cd0c24ba5a16a560c5d37358&mealType=Dinner&random=true&calories=500-1000',
      callType: ApiCallType.GET,
      headers: {
        'Edamam-Account-User': 'samron03',
      },
      params: {
        'diet': diet,
        'caution': caution,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? mealName1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.label''',
      ));
  static double? mealCalories1(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[0].recipe.calories''',
      ));
  static List<String>? mealRecipe1(dynamic response) => (getJsonField(
        response,
        r'''$.hits[0].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealName2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.label''',
      ));
  static double? mealCalories2(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[1].recipe.calories''',
      ));
  static List<String>? mealRecipe2(dynamic response) => (getJsonField(
        response,
        r'''$.hits[1].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealName3(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.label''',
      ));
  static double? mealCalories3(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[2].recipe.calories''',
      ));
  static List<String>? mealRecipe3(dynamic response) => (getJsonField(
        response,
        r'''$.hits[2].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealImage1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.image''',
      ));
  static String? mealImage2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.image''',
      ));
  static String? mealImage3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.image''',
      ));
  static List? mealIngredients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.ingredients''',
        true,
      ) as List?;
  static List? mealIngredients2(dynamic response) => getJsonField(
        response,
        r'''$.hits[1].recipe.ingredients''',
        true,
      ) as List?;
  static List? mealIngredients3(dynamic response) => getJsonField(
        response,
        r'''$.hits[2].recipe.ingredients''',
        true,
      ) as List?;
  static dynamic totalNutrients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.totalNutrients''',
      );
  static int? mealServings1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[0].recipe.yield''',
      ));
  static int? mealServings2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[1].recipe.yield''',
      ));
  static int? mealServings3(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[2].recipe.yield''',
      ));
  static String? mealID1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.uri''',
      ));
  static List<double>? totalCalories(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].recipe.calories''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine1(dynamic response) => (getJsonField(
        response,
        r'''$.hits[0].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine2(dynamic response) => (getJsonField(
        response,
        r'''$.hits[1].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine3(dynamic response) => (getJsonField(
        response,
        r'''$.hits[2].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic totalNutrients2(dynamic response) => getJsonField(
        response,
        r'''$.hits[1].recipe.totalNutrients''',
      );
  static dynamic totalNutrients3(dynamic response) => getJsonField(
        response,
        r'''$.hits[2].recipe.totalNutrients''',
      );
  static String? mealRecipeURL1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.url''',
      ));
  static String? mealRecipeURL2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.url''',
      ));
  static String? mealRecipeURL3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.url''',
      ));
  static List? mealNutrients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.totalNutrients''',
        true,
      ) as List?;
}

class EdamamAPICallLunchCall {
  static Future<ApiCallResponse> call({
    String? diet = 'balanced',
    String? caution,
  }) async {
    caution ??= null;

    return ApiManager.instance.makeApiCall(
      callName: 'EdamamAPICallLunch',
      apiUrl:
          'https://api.edamam.com/api/recipes/v2?type=public&app_id=dd17f47b&app_key=3b712881cd0c24ba5a16a560c5d37358&mealType=Lunch&random=true&calories=400-900',
      callType: ApiCallType.GET,
      headers: {
        'Edamam-Account-User': 'samron03',
      },
      params: {
        'diet': diet,
        'caution': caution,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? mealName1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.label''',
      ));
  static double? mealCalories1(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[0].recipe.calories''',
      ));
  static List<String>? mealRecipe1(dynamic response) => (getJsonField(
        response,
        r'''$.hits[0].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealName2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.label''',
      ));
  static double? mealCalories2(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[1].recipe.calories''',
      ));
  static List<String>? mealRecipe2(dynamic response) => (getJsonField(
        response,
        r'''$.hits[1].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealName3(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.label''',
      ));
  static double? mealCalories3(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[2].recipe.calories''',
      ));
  static List<String>? mealRecipe3(dynamic response) => (getJsonField(
        response,
        r'''$.hits[2].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealImage1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.image''',
      ));
  static String? mealImage2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.image''',
      ));
  static String? mealImage3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.image''',
      ));
  static List? mealIngredients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.ingredients''',
        true,
      ) as List?;
  static List? mealIngredients2(dynamic response) => getJsonField(
        response,
        r'''$.hits[1].recipe.ingredients''',
        true,
      ) as List?;
  static List? mealIngredients3(dynamic response) => getJsonField(
        response,
        r'''$.hits[2].recipe.ingredients''',
        true,
      ) as List?;
  static dynamic totalNutrients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.totalNutrients''',
      );
  static int? mealServings1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[0].recipe.yield''',
      ));
  static int? mealServings2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[1].recipe.yield''',
      ));
  static int? mealServings3(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[2].recipe.yield''',
      ));
  static String? mealID1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.uri''',
      ));
  static List<double>? totalCalories(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].recipe.calories''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine1(dynamic response) => (getJsonField(
        response,
        r'''$.hits[0].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine2(dynamic response) => (getJsonField(
        response,
        r'''$.hits[1].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine3(dynamic response) => (getJsonField(
        response,
        r'''$.hits[2].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic totalNutrients2(dynamic response) => getJsonField(
        response,
        r'''$.hits[1].recipe.totalNutrients''',
      );
  static dynamic totalNutrients3(dynamic response) => getJsonField(
        response,
        r'''$.hits[2].recipe.totalNutrients''',
      );
  static String? mealRecipeURL1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.url''',
      ));
  static String? mealRecipeURL2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.url''',
      ));
  static String? mealRecipeURL3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.url''',
      ));
  static List? mealNutrients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.totalNutrients''',
        true,
      ) as List?;
}

class EdamamAPICallBreakfastCall {
  static Future<ApiCallResponse> call({
    String? caution,
    String? diet = 'balanced',
  }) async {
    caution ??= null;

    return ApiManager.instance.makeApiCall(
      callName: 'EdamamAPICallBreakfast',
      apiUrl:
          'https://api.edamam.com/api/recipes/v2?type=public&app_id=dd17f47b&app_key=3b712881cd0c24ba5a16a560c5d37358&mealType=Breakfast&random=true&calories=200-500',
      callType: ApiCallType.GET,
      headers: {
        'Edamam-Account-User': 'samron03',
      },
      params: {
        'diet': diet,
        'caution': caution,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? mealName1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.label''',
      ));
  static double? mealCalories1(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[0].recipe.calories''',
      ));
  static List<String>? mealRecipe1(dynamic response) => (getJsonField(
        response,
        r'''$.hits[0].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealName2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.label''',
      ));
  static double? mealCalories2(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[1].recipe.calories''',
      ));
  static List<String>? mealRecipe2(dynamic response) => (getJsonField(
        response,
        r'''$.hits[1].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealName3(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.label''',
      ));
  static double? mealCalories3(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.hits[2].recipe.calories''',
      ));
  static List<String>? mealRecipe3(dynamic response) => (getJsonField(
        response,
        r'''$.hits[2].recipe.ingredientLines''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? mealImage1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.image''',
      ));
  static String? mealImage2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.image''',
      ));
  static String? mealImage3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.image''',
      ));
  static List? mealIngredients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.ingredients''',
        true,
      ) as List?;
  static List? mealIngredients2(dynamic response) => getJsonField(
        response,
        r'''$.hits[1].recipe.ingredients''',
        true,
      ) as List?;
  static List? mealIngredients3(dynamic response) => getJsonField(
        response,
        r'''$.hits[2].recipe.ingredients''',
        true,
      ) as List?;
  static dynamic totalNutrients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.totalNutrients''',
      );
  static int? mealServings1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[0].recipe.yield''',
      ));
  static int? mealServings2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[1].recipe.yield''',
      ));
  static int? mealServings3(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.hits[2].recipe.yield''',
      ));
  static String? mealID1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.uri''',
      ));
  static List<double>? totalCalories(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].recipe.calories''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine1(dynamic response) => (getJsonField(
        response,
        r'''$.hits[0].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine2(dynamic response) => (getJsonField(
        response,
        r'''$.hits[1].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? mealCuisine3(dynamic response) => (getJsonField(
        response,
        r'''$.hits[2].recipe.cuisineType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic totalNutrients2(dynamic response) => getJsonField(
        response,
        r'''$.hits[1].recipe.totalNutrients''',
      );
  static dynamic totalNutrients3(dynamic response) => getJsonField(
        response,
        r'''$.hits[2].recipe.totalNutrients''',
      );
  static String? mealRecipeURL1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[0].recipe.url''',
      ));
  static String? mealRecipeURL2(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[1].recipe.url''',
      ));
  static String? mealRecipeURL3(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.hits[2].recipe.url''',
      ));
  static List? mealNutrients1(dynamic response) => getJsonField(
        response,
        r'''$.hits[0].recipe.totalNutrients''',
        true,
      ) as List?;
}

class SpoonTacularApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'spoonTacularApi',
      apiUrl:
          'https://api.spoonacular.com/recipes/complexSearch?apiKey=62869ac001024e52b8bad66fd4e61659&query=pancakes',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SpoonTacularRecipeApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'spoonTacularRecipeApi',
      apiUrl:
          'https://api.spoonacular.com/recipes//information?apiKey=62869ac001024e52b8bad66fd4e61659',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
