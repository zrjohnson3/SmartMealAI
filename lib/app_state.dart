import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userAge = prefs.getInt('ff_userAge') ?? _userAge;
    });
    _safeInit(() {
      _userGender = prefs.getString('ff_userGender') ?? _userGender;
    });
    _safeInit(() {
      _mealCycle = prefs.getInt('ff_mealCycle') ?? _mealCycle;
    });
    _safeInit(() {
      _userHeight = prefs.getString('ff_userHeight') ?? _userHeight;
    });
    _safeInit(() {
      _userWeight = prefs.getString('ff_userWeight') ?? _userWeight;
    });
    _safeInit(() {
      _userHealthGoals =
          prefs.getString('ff_userHealthGoals') ?? _userHealthGoals;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _healthLabel = '';
  String get healthLabel => _healthLabel;
  set healthLabel(String value) {
    _healthLabel = value;
  }

  String _dietLabel = '';
  String get dietLabel => _dietLabel;
  set dietLabel(String value) {
    _dietLabel = value;
  }

  String _cautionLabel = '';
  String get cautionLabel => _cautionLabel;
  set cautionLabel(String value) {
    _cautionLabel = value;
  }

  double _totalCalories = 0.0;
  double get totalCalories => _totalCalories;
  set totalCalories(double value) {
    _totalCalories = value;
  }

  List<int> _totalCaloriesList = [];
  List<int> get totalCaloriesList => _totalCaloriesList;
  set totalCaloriesList(List<int> value) {
    _totalCaloriesList = value;
  }

  void addToTotalCaloriesList(int value) {
    totalCaloriesList.add(value);
  }

  void removeFromTotalCaloriesList(int value) {
    totalCaloriesList.remove(value);
  }

  void removeAtIndexFromTotalCaloriesList(int index) {
    totalCaloriesList.removeAt(index);
  }

  void updateTotalCaloriesListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    totalCaloriesList[index] = updateFn(_totalCaloriesList[index]);
  }

  void insertAtIndexInTotalCaloriesList(int index, int value) {
    totalCaloriesList.insert(index, value);
  }

  int _userAge = 0;
  int get userAge => _userAge;
  set userAge(int value) {
    _userAge = value;
    prefs.setInt('ff_userAge', value);
  }

  /// The current date that a user logs in to the application
  DateTime? _mealCreation;
  DateTime? get mealCreation => _mealCreation;
  set mealCreation(DateTime? value) {
    _mealCreation = value;
  }

  String _userGender = '';
  String get userGender => _userGender;
  set userGender(String value) {
    _userGender = value;
    prefs.setString('ff_userGender', value);
  }

  /// How many days it has been since the user last created a meal plan, if none
  /// of less than 4 will generate a create meal plan page
  int _mealCycle = 0;
  int get mealCycle => _mealCycle;
  set mealCycle(int value) {
    _mealCycle = value;
    prefs.setInt('ff_mealCycle', value);
  }

  String _userHeight = '';
  String get userHeight => _userHeight;
  set userHeight(String value) {
    _userHeight = value;
    prefs.setString('ff_userHeight', value);
  }

  int _recommendedCalories = 0;
  int get recommendedCalories => _recommendedCalories;
  set recommendedCalories(int value) {
    _recommendedCalories = value;
  }

  String _userWeight = '';
  String get userWeight => _userWeight;
  set userWeight(String value) {
    _userWeight = value;
    prefs.setString('ff_userWeight', value);
  }

  String _userHealthGoals = '';
  String get userHealthGoals => _userHealthGoals;
  set userHealthGoals(String value) {
    _userHealthGoals = value;
    prefs.setString('ff_userHealthGoals', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
