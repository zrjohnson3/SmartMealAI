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
      _dietLabel = prefs.getString('ff_dietLabel') ?? _dietLabel;
    });
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
    _safeInit(() {
      _planBreakfastFats = prefs
              .getStringList('ff_planBreakfastFats')
              ?.map(double.parse)
              .toList() ??
          _planBreakfastFats;
    });
    _safeInit(() {
      _planBreakfastProteins = prefs
              .getStringList('ff_planBreakfastProteins')
              ?.map(double.parse)
              .toList() ??
          _planBreakfastProteins;
    });
    _safeInit(() {
      _planBreakfastCarbs = prefs
              .getStringList('ff_planBreakfastCarbs')
              ?.map(double.parse)
              .toList() ??
          _planBreakfastCarbs;
    });
    _safeInit(() {
      _planLunchProteins = prefs
              .getStringList('ff_planLunchProteins')
              ?.map(double.parse)
              .toList() ??
          _planLunchProteins;
    });
    _safeInit(() {
      _planLunchCarbs = prefs
              .getStringList('ff_planLunchCarbs')
              ?.map(double.parse)
              .toList() ??
          _planLunchCarbs;
    });
    _safeInit(() {
      _planDinnerProtein = prefs
              .getStringList('ff_planDinnerProtein')
              ?.map(double.parse)
              .toList() ??
          _planDinnerProtein;
    });
    _safeInit(() {
      _planDinnerFats = prefs
              .getStringList('ff_planDinnerFats')
              ?.map(double.parse)
              .toList() ??
          _planDinnerFats;
    });
    _safeInit(() {
      _planDinnerCarbs = prefs
              .getStringList('ff_planDinnerCarbs')
              ?.map(double.parse)
              .toList() ??
          _planDinnerCarbs;
    });
    _safeInit(() {
      _planLunchFats =
          prefs.getStringList('ff_planLunchFats')?.map(double.parse).toList() ??
              _planLunchFats;
    });
    _safeInit(() {
      _planBreakfastCalories = prefs
              .getStringList('ff_planBreakfastCalories')
              ?.map(double.parse)
              .toList() ??
          _planBreakfastCalories;
    });
    _safeInit(() {
      _planLunchCalories = prefs
              .getStringList('ff_planLunchCalories')
              ?.map(double.parse)
              .toList() ??
          _planLunchCalories;
    });
    _safeInit(() {
      _planDinnerCalories = prefs
              .getStringList('ff_planDinnerCalories')
              ?.map(double.parse)
              .toList() ??
          _planDinnerCalories;
    });
    _safeInit(() {
      _planBreakfastServings = prefs
              .getStringList('ff_planBreakfastServings')
              ?.map(int.parse)
              .toList() ??
          _planBreakfastServings;
    });
    _safeInit(() {
      _planLunchServings = prefs
              .getStringList('ff_planLunchServings')
              ?.map(int.parse)
              .toList() ??
          _planLunchServings;
    });
    _safeInit(() {
      _planDinnerServings = prefs
              .getStringList('ff_planDinnerServings')
              ?.map(int.parse)
              .toList() ??
          _planDinnerServings;
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
    prefs.setString('ff_dietLabel', value);
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

  List<String> _dietPrefs = [];
  List<String> get dietPrefs => _dietPrefs;
  set dietPrefs(List<String> value) {
    _dietPrefs = value;
  }

  void addToDietPrefs(String value) {
    dietPrefs.add(value);
  }

  void removeFromDietPrefs(String value) {
    dietPrefs.remove(value);
  }

  void removeAtIndexFromDietPrefs(int index) {
    dietPrefs.removeAt(index);
  }

  void updateDietPrefsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dietPrefs[index] = updateFn(_dietPrefs[index]);
  }

  void insertAtIndexInDietPrefs(int index, String value) {
    dietPrefs.insert(index, value);
  }

  List<String> _favCuisine = [];
  List<String> get favCuisine => _favCuisine;
  set favCuisine(List<String> value) {
    _favCuisine = value;
  }

  void addToFavCuisine(String value) {
    favCuisine.add(value);
  }

  void removeFromFavCuisine(String value) {
    favCuisine.remove(value);
  }

  void removeAtIndexFromFavCuisine(int index) {
    favCuisine.removeAt(index);
  }

  void updateFavCuisineAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    favCuisine[index] = updateFn(_favCuisine[index]);
  }

  void insertAtIndexInFavCuisine(int index, String value) {
    favCuisine.insert(index, value);
  }

  String _editDietPreferences = '';
  String get editDietPreferences => _editDietPreferences;
  set editDietPreferences(String value) {
    _editDietPreferences = value;
  }

  List<double> _planBreakfastFats = [];
  List<double> get planBreakfastFats => _planBreakfastFats;
  set planBreakfastFats(List<double> value) {
    _planBreakfastFats = value;
    prefs.setStringList(
        'ff_planBreakfastFats', value.map((x) => x.toString()).toList());
  }

  void addToPlanBreakfastFats(double value) {
    planBreakfastFats.add(value);
    prefs.setStringList('ff_planBreakfastFats',
        _planBreakfastFats.map((x) => x.toString()).toList());
  }

  void removeFromPlanBreakfastFats(double value) {
    planBreakfastFats.remove(value);
    prefs.setStringList('ff_planBreakfastFats',
        _planBreakfastFats.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanBreakfastFats(int index) {
    planBreakfastFats.removeAt(index);
    prefs.setStringList('ff_planBreakfastFats',
        _planBreakfastFats.map((x) => x.toString()).toList());
  }

  void updatePlanBreakfastFatsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planBreakfastFats[index] = updateFn(_planBreakfastFats[index]);
    prefs.setStringList('ff_planBreakfastFats',
        _planBreakfastFats.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanBreakfastFats(int index, double value) {
    planBreakfastFats.insert(index, value);
    prefs.setStringList('ff_planBreakfastFats',
        _planBreakfastFats.map((x) => x.toString()).toList());
  }

  List<double> _planBreakfastProteins = [];
  List<double> get planBreakfastProteins => _planBreakfastProteins;
  set planBreakfastProteins(List<double> value) {
    _planBreakfastProteins = value;
    prefs.setStringList(
        'ff_planBreakfastProteins', value.map((x) => x.toString()).toList());
  }

  void addToPlanBreakfastProteins(double value) {
    planBreakfastProteins.add(value);
    prefs.setStringList('ff_planBreakfastProteins',
        _planBreakfastProteins.map((x) => x.toString()).toList());
  }

  void removeFromPlanBreakfastProteins(double value) {
    planBreakfastProteins.remove(value);
    prefs.setStringList('ff_planBreakfastProteins',
        _planBreakfastProteins.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanBreakfastProteins(int index) {
    planBreakfastProteins.removeAt(index);
    prefs.setStringList('ff_planBreakfastProteins',
        _planBreakfastProteins.map((x) => x.toString()).toList());
  }

  void updatePlanBreakfastProteinsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planBreakfastProteins[index] = updateFn(_planBreakfastProteins[index]);
    prefs.setStringList('ff_planBreakfastProteins',
        _planBreakfastProteins.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanBreakfastProteins(int index, double value) {
    planBreakfastProteins.insert(index, value);
    prefs.setStringList('ff_planBreakfastProteins',
        _planBreakfastProteins.map((x) => x.toString()).toList());
  }

  List<double> _planBreakfastCarbs = [];
  List<double> get planBreakfastCarbs => _planBreakfastCarbs;
  set planBreakfastCarbs(List<double> value) {
    _planBreakfastCarbs = value;
    prefs.setStringList(
        'ff_planBreakfastCarbs', value.map((x) => x.toString()).toList());
  }

  void addToPlanBreakfastCarbs(double value) {
    planBreakfastCarbs.add(value);
    prefs.setStringList('ff_planBreakfastCarbs',
        _planBreakfastCarbs.map((x) => x.toString()).toList());
  }

  void removeFromPlanBreakfastCarbs(double value) {
    planBreakfastCarbs.remove(value);
    prefs.setStringList('ff_planBreakfastCarbs',
        _planBreakfastCarbs.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanBreakfastCarbs(int index) {
    planBreakfastCarbs.removeAt(index);
    prefs.setStringList('ff_planBreakfastCarbs',
        _planBreakfastCarbs.map((x) => x.toString()).toList());
  }

  void updatePlanBreakfastCarbsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planBreakfastCarbs[index] = updateFn(_planBreakfastCarbs[index]);
    prefs.setStringList('ff_planBreakfastCarbs',
        _planBreakfastCarbs.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanBreakfastCarbs(int index, double value) {
    planBreakfastCarbs.insert(index, value);
    prefs.setStringList('ff_planBreakfastCarbs',
        _planBreakfastCarbs.map((x) => x.toString()).toList());
  }

  List<double> _planLunchProteins = [];
  List<double> get planLunchProteins => _planLunchProteins;
  set planLunchProteins(List<double> value) {
    _planLunchProteins = value;
    prefs.setStringList(
        'ff_planLunchProteins', value.map((x) => x.toString()).toList());
  }

  void addToPlanLunchProteins(double value) {
    planLunchProteins.add(value);
    prefs.setStringList('ff_planLunchProteins',
        _planLunchProteins.map((x) => x.toString()).toList());
  }

  void removeFromPlanLunchProteins(double value) {
    planLunchProteins.remove(value);
    prefs.setStringList('ff_planLunchProteins',
        _planLunchProteins.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanLunchProteins(int index) {
    planLunchProteins.removeAt(index);
    prefs.setStringList('ff_planLunchProteins',
        _planLunchProteins.map((x) => x.toString()).toList());
  }

  void updatePlanLunchProteinsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planLunchProteins[index] = updateFn(_planLunchProteins[index]);
    prefs.setStringList('ff_planLunchProteins',
        _planLunchProteins.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanLunchProteins(int index, double value) {
    planLunchProteins.insert(index, value);
    prefs.setStringList('ff_planLunchProteins',
        _planLunchProteins.map((x) => x.toString()).toList());
  }

  List<double> _planLunchCarbs = [];
  List<double> get planLunchCarbs => _planLunchCarbs;
  set planLunchCarbs(List<double> value) {
    _planLunchCarbs = value;
    prefs.setStringList(
        'ff_planLunchCarbs', value.map((x) => x.toString()).toList());
  }

  void addToPlanLunchCarbs(double value) {
    planLunchCarbs.add(value);
    prefs.setStringList(
        'ff_planLunchCarbs', _planLunchCarbs.map((x) => x.toString()).toList());
  }

  void removeFromPlanLunchCarbs(double value) {
    planLunchCarbs.remove(value);
    prefs.setStringList(
        'ff_planLunchCarbs', _planLunchCarbs.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanLunchCarbs(int index) {
    planLunchCarbs.removeAt(index);
    prefs.setStringList(
        'ff_planLunchCarbs', _planLunchCarbs.map((x) => x.toString()).toList());
  }

  void updatePlanLunchCarbsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planLunchCarbs[index] = updateFn(_planLunchCarbs[index]);
    prefs.setStringList(
        'ff_planLunchCarbs', _planLunchCarbs.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanLunchCarbs(int index, double value) {
    planLunchCarbs.insert(index, value);
    prefs.setStringList(
        'ff_planLunchCarbs', _planLunchCarbs.map((x) => x.toString()).toList());
  }

  List<double> _planDinnerProtein = [];
  List<double> get planDinnerProtein => _planDinnerProtein;
  set planDinnerProtein(List<double> value) {
    _planDinnerProtein = value;
    prefs.setStringList(
        'ff_planDinnerProtein', value.map((x) => x.toString()).toList());
  }

  void addToPlanDinnerProtein(double value) {
    planDinnerProtein.add(value);
    prefs.setStringList('ff_planDinnerProtein',
        _planDinnerProtein.map((x) => x.toString()).toList());
  }

  void removeFromPlanDinnerProtein(double value) {
    planDinnerProtein.remove(value);
    prefs.setStringList('ff_planDinnerProtein',
        _planDinnerProtein.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanDinnerProtein(int index) {
    planDinnerProtein.removeAt(index);
    prefs.setStringList('ff_planDinnerProtein',
        _planDinnerProtein.map((x) => x.toString()).toList());
  }

  void updatePlanDinnerProteinAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planDinnerProtein[index] = updateFn(_planDinnerProtein[index]);
    prefs.setStringList('ff_planDinnerProtein',
        _planDinnerProtein.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanDinnerProtein(int index, double value) {
    planDinnerProtein.insert(index, value);
    prefs.setStringList('ff_planDinnerProtein',
        _planDinnerProtein.map((x) => x.toString()).toList());
  }

  List<double> _planDinnerFats = [];
  List<double> get planDinnerFats => _planDinnerFats;
  set planDinnerFats(List<double> value) {
    _planDinnerFats = value;
    prefs.setStringList(
        'ff_planDinnerFats', value.map((x) => x.toString()).toList());
  }

  void addToPlanDinnerFats(double value) {
    planDinnerFats.add(value);
    prefs.setStringList(
        'ff_planDinnerFats', _planDinnerFats.map((x) => x.toString()).toList());
  }

  void removeFromPlanDinnerFats(double value) {
    planDinnerFats.remove(value);
    prefs.setStringList(
        'ff_planDinnerFats', _planDinnerFats.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanDinnerFats(int index) {
    planDinnerFats.removeAt(index);
    prefs.setStringList(
        'ff_planDinnerFats', _planDinnerFats.map((x) => x.toString()).toList());
  }

  void updatePlanDinnerFatsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planDinnerFats[index] = updateFn(_planDinnerFats[index]);
    prefs.setStringList(
        'ff_planDinnerFats', _planDinnerFats.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanDinnerFats(int index, double value) {
    planDinnerFats.insert(index, value);
    prefs.setStringList(
        'ff_planDinnerFats', _planDinnerFats.map((x) => x.toString()).toList());
  }

  List<double> _planDinnerCarbs = [];
  List<double> get planDinnerCarbs => _planDinnerCarbs;
  set planDinnerCarbs(List<double> value) {
    _planDinnerCarbs = value;
    prefs.setStringList(
        'ff_planDinnerCarbs', value.map((x) => x.toString()).toList());
  }

  void addToPlanDinnerCarbs(double value) {
    planDinnerCarbs.add(value);
    prefs.setStringList('ff_planDinnerCarbs',
        _planDinnerCarbs.map((x) => x.toString()).toList());
  }

  void removeFromPlanDinnerCarbs(double value) {
    planDinnerCarbs.remove(value);
    prefs.setStringList('ff_planDinnerCarbs',
        _planDinnerCarbs.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanDinnerCarbs(int index) {
    planDinnerCarbs.removeAt(index);
    prefs.setStringList('ff_planDinnerCarbs',
        _planDinnerCarbs.map((x) => x.toString()).toList());
  }

  void updatePlanDinnerCarbsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planDinnerCarbs[index] = updateFn(_planDinnerCarbs[index]);
    prefs.setStringList('ff_planDinnerCarbs',
        _planDinnerCarbs.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanDinnerCarbs(int index, double value) {
    planDinnerCarbs.insert(index, value);
    prefs.setStringList('ff_planDinnerCarbs',
        _planDinnerCarbs.map((x) => x.toString()).toList());
  }

  List<double> _planLunchFats = [];
  List<double> get planLunchFats => _planLunchFats;
  set planLunchFats(List<double> value) {
    _planLunchFats = value;
    prefs.setStringList(
        'ff_planLunchFats', value.map((x) => x.toString()).toList());
  }

  void addToPlanLunchFats(double value) {
    planLunchFats.add(value);
    prefs.setStringList(
        'ff_planLunchFats', _planLunchFats.map((x) => x.toString()).toList());
  }

  void removeFromPlanLunchFats(double value) {
    planLunchFats.remove(value);
    prefs.setStringList(
        'ff_planLunchFats', _planLunchFats.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanLunchFats(int index) {
    planLunchFats.removeAt(index);
    prefs.setStringList(
        'ff_planLunchFats', _planLunchFats.map((x) => x.toString()).toList());
  }

  void updatePlanLunchFatsAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planLunchFats[index] = updateFn(_planLunchFats[index]);
    prefs.setStringList(
        'ff_planLunchFats', _planLunchFats.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanLunchFats(int index, double value) {
    planLunchFats.insert(index, value);
    prefs.setStringList(
        'ff_planLunchFats', _planLunchFats.map((x) => x.toString()).toList());
  }

  List<double> _planBreakfastCalories = [];
  List<double> get planBreakfastCalories => _planBreakfastCalories;
  set planBreakfastCalories(List<double> value) {
    _planBreakfastCalories = value;
    prefs.setStringList(
        'ff_planBreakfastCalories', value.map((x) => x.toString()).toList());
  }

  void addToPlanBreakfastCalories(double value) {
    planBreakfastCalories.add(value);
    prefs.setStringList('ff_planBreakfastCalories',
        _planBreakfastCalories.map((x) => x.toString()).toList());
  }

  void removeFromPlanBreakfastCalories(double value) {
    planBreakfastCalories.remove(value);
    prefs.setStringList('ff_planBreakfastCalories',
        _planBreakfastCalories.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanBreakfastCalories(int index) {
    planBreakfastCalories.removeAt(index);
    prefs.setStringList('ff_planBreakfastCalories',
        _planBreakfastCalories.map((x) => x.toString()).toList());
  }

  void updatePlanBreakfastCaloriesAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planBreakfastCalories[index] = updateFn(_planBreakfastCalories[index]);
    prefs.setStringList('ff_planBreakfastCalories',
        _planBreakfastCalories.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanBreakfastCalories(int index, double value) {
    planBreakfastCalories.insert(index, value);
    prefs.setStringList('ff_planBreakfastCalories',
        _planBreakfastCalories.map((x) => x.toString()).toList());
  }

  List<double> _planLunchCalories = [];
  List<double> get planLunchCalories => _planLunchCalories;
  set planLunchCalories(List<double> value) {
    _planLunchCalories = value;
    prefs.setStringList(
        'ff_planLunchCalories', value.map((x) => x.toString()).toList());
  }

  void addToPlanLunchCalories(double value) {
    planLunchCalories.add(value);
    prefs.setStringList('ff_planLunchCalories',
        _planLunchCalories.map((x) => x.toString()).toList());
  }

  void removeFromPlanLunchCalories(double value) {
    planLunchCalories.remove(value);
    prefs.setStringList('ff_planLunchCalories',
        _planLunchCalories.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanLunchCalories(int index) {
    planLunchCalories.removeAt(index);
    prefs.setStringList('ff_planLunchCalories',
        _planLunchCalories.map((x) => x.toString()).toList());
  }

  void updatePlanLunchCaloriesAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planLunchCalories[index] = updateFn(_planLunchCalories[index]);
    prefs.setStringList('ff_planLunchCalories',
        _planLunchCalories.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanLunchCalories(int index, double value) {
    planLunchCalories.insert(index, value);
    prefs.setStringList('ff_planLunchCalories',
        _planLunchCalories.map((x) => x.toString()).toList());
  }

  List<double> _planDinnerCalories = [];
  List<double> get planDinnerCalories => _planDinnerCalories;
  set planDinnerCalories(List<double> value) {
    _planDinnerCalories = value;
    prefs.setStringList(
        'ff_planDinnerCalories', value.map((x) => x.toString()).toList());
  }

  void addToPlanDinnerCalories(double value) {
    planDinnerCalories.add(value);
    prefs.setStringList('ff_planDinnerCalories',
        _planDinnerCalories.map((x) => x.toString()).toList());
  }

  void removeFromPlanDinnerCalories(double value) {
    planDinnerCalories.remove(value);
    prefs.setStringList('ff_planDinnerCalories',
        _planDinnerCalories.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanDinnerCalories(int index) {
    planDinnerCalories.removeAt(index);
    prefs.setStringList('ff_planDinnerCalories',
        _planDinnerCalories.map((x) => x.toString()).toList());
  }

  void updatePlanDinnerCaloriesAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    planDinnerCalories[index] = updateFn(_planDinnerCalories[index]);
    prefs.setStringList('ff_planDinnerCalories',
        _planDinnerCalories.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanDinnerCalories(int index, double value) {
    planDinnerCalories.insert(index, value);
    prefs.setStringList('ff_planDinnerCalories',
        _planDinnerCalories.map((x) => x.toString()).toList());
  }

  List<int> _planBreakfastServings = [];
  List<int> get planBreakfastServings => _planBreakfastServings;
  set planBreakfastServings(List<int> value) {
    _planBreakfastServings = value;
    prefs.setStringList(
        'ff_planBreakfastServings', value.map((x) => x.toString()).toList());
  }

  void addToPlanBreakfastServings(int value) {
    planBreakfastServings.add(value);
    prefs.setStringList('ff_planBreakfastServings',
        _planBreakfastServings.map((x) => x.toString()).toList());
  }

  void removeFromPlanBreakfastServings(int value) {
    planBreakfastServings.remove(value);
    prefs.setStringList('ff_planBreakfastServings',
        _planBreakfastServings.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanBreakfastServings(int index) {
    planBreakfastServings.removeAt(index);
    prefs.setStringList('ff_planBreakfastServings',
        _planBreakfastServings.map((x) => x.toString()).toList());
  }

  void updatePlanBreakfastServingsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    planBreakfastServings[index] = updateFn(_planBreakfastServings[index]);
    prefs.setStringList('ff_planBreakfastServings',
        _planBreakfastServings.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanBreakfastServings(int index, int value) {
    planBreakfastServings.insert(index, value);
    prefs.setStringList('ff_planBreakfastServings',
        _planBreakfastServings.map((x) => x.toString()).toList());
  }

  List<int> _planLunchServings = [];
  List<int> get planLunchServings => _planLunchServings;
  set planLunchServings(List<int> value) {
    _planLunchServings = value;
    prefs.setStringList(
        'ff_planLunchServings', value.map((x) => x.toString()).toList());
  }

  void addToPlanLunchServings(int value) {
    planLunchServings.add(value);
    prefs.setStringList('ff_planLunchServings',
        _planLunchServings.map((x) => x.toString()).toList());
  }

  void removeFromPlanLunchServings(int value) {
    planLunchServings.remove(value);
    prefs.setStringList('ff_planLunchServings',
        _planLunchServings.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanLunchServings(int index) {
    planLunchServings.removeAt(index);
    prefs.setStringList('ff_planLunchServings',
        _planLunchServings.map((x) => x.toString()).toList());
  }

  void updatePlanLunchServingsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    planLunchServings[index] = updateFn(_planLunchServings[index]);
    prefs.setStringList('ff_planLunchServings',
        _planLunchServings.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanLunchServings(int index, int value) {
    planLunchServings.insert(index, value);
    prefs.setStringList('ff_planLunchServings',
        _planLunchServings.map((x) => x.toString()).toList());
  }

  List<int> _planDinnerServings = [];
  List<int> get planDinnerServings => _planDinnerServings;
  set planDinnerServings(List<int> value) {
    _planDinnerServings = value;
    prefs.setStringList(
        'ff_planDinnerServings', value.map((x) => x.toString()).toList());
  }

  void addToPlanDinnerServings(int value) {
    planDinnerServings.add(value);
    prefs.setStringList('ff_planDinnerServings',
        _planDinnerServings.map((x) => x.toString()).toList());
  }

  void removeFromPlanDinnerServings(int value) {
    planDinnerServings.remove(value);
    prefs.setStringList('ff_planDinnerServings',
        _planDinnerServings.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromPlanDinnerServings(int index) {
    planDinnerServings.removeAt(index);
    prefs.setStringList('ff_planDinnerServings',
        _planDinnerServings.map((x) => x.toString()).toList());
  }

  void updatePlanDinnerServingsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    planDinnerServings[index] = updateFn(_planDinnerServings[index]);
    prefs.setStringList('ff_planDinnerServings',
        _planDinnerServings.map((x) => x.toString()).toList());
  }

  void insertAtIndexInPlanDinnerServings(int index, int value) {
    planDinnerServings.insert(index, value);
    prefs.setStringList('ff_planDinnerServings',
        _planDinnerServings.map((x) => x.toString()).toList());
  }

  String _activityPref = '';
  String get activityPref => _activityPref;
  set activityPref(String value) {
    _activityPref = value;
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
