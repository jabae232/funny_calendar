import 'package:flutter/material.dart';
import 'package:funny_calendar/features/diary_screen/data/models/feeling.dart';

class DiaryViewModel extends ChangeNotifier {
  static const List<Feeling> _feelings = [
    Feeling(
      name: 'Радость',
      image: 'assets/images/happy.png',
      subFeelings: [
        'Возбуждение',
        'Восторг',
        'Игривость',
        'Наслаждение',
        'Очарование',
        'Осознанность',
        'Смелость',
        'Удовольствие',
        'Чувственность',
        'Энергичность',
        'Экстравагантность',
      ],
    ),
    Feeling(
      name: 'Страх',
      image: 'assets/images/fear.png',
      subFeelings: [
        'Тревога',
        'Дискомфорт',
        'Беспокойство',
        'Нервозность',
        'Паника',
        'Неуверенность',
        'Опасение',
        'Ужас',
        'Напряжение',
        'Сомнение',
        'Пугливость',
      ],
    ),
    Feeling(
      name: 'Бешенство',
      image: 'assets/images/furious.png',
      subFeelings: [
        'Агрессия',
        'Взбешенность',
        'Гнев',
        'Раздражение',
        'Ярость',
        'Недовольство',
        'Враждебность',
        'Волнения',
        'Ссора',
        'Возмущение',
        'Неистовая ярость',
      ],
    ),
    Feeling(
      name: 'Грусть',
      image: 'assets/images/sad.png',
      subFeelings: [
        'Печаль',
        'Меланхолия',
        'Тоска',
        'Уныние',
        'Скорбь',
        'Разочарование',
        'Опечаленность',
        'Сожаление',
        'Печаль',
        'Ностальгия',
        'Скука',
      ],
    ),
    Feeling(
      name: 'Спокойствие',
      image: 'assets/images/chill.png',
      subFeelings: [
        'Умиротворение',
        'Расслабленность',
        'Тишина',
        'Сбалансированность',
        'Комфорт',
        'Успокоенность',
        'Безмятежность',
        'Спокойствие',
        'Равновесие',
        'Отдых',
        'Удовлетворение',
      ],
    ),
    Feeling(
      name: 'Сила',
      image: 'assets/images/power.png',
      subFeelings: [
        'Мощь',
        'Энергия',
        'Уверенность',
        'Стойкость',
        'Влиятельность',
        'Решимость',
        'Могучесть',
        'Виталность',
        'Твердость',
        'Мужество',
        'Ресурсность',
      ],
    ),
  ];

  String _currentFeeling = '';

  String _currentSubFeeling = '';

  double _levelOfStress = 0.5;

  double _confidenceLevel = 0.5;

  bool _isPressable = false;

  final _notesController = TextEditingController();

  final _pageController = PageController();

  List<String> getSubFeelings() {
    for(final element in feelings) {
      if(element.name == currentFeeling) {
        return element.subFeelings;
      }
    }
    return [];
  }

  void isButtonPressable() {
    if(_currentFeeling.isNotEmpty && _currentSubFeeling.isNotEmpty && _notesController.text.isNotEmpty) {
      isPressable = true;
    } else {
      isPressable = false;
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  PageController get pageController => _pageController;

  bool get isPressable => _isPressable;

  set isPressable(bool value) {
    _isPressable = value;
    notifyListeners();
  }

  String get currentSubFeeling => _currentSubFeeling;

  set currentSubFeeling(String value) {
    _currentSubFeeling = value;
    isButtonPressable();
    notifyListeners();
  }

  get notesController => _notesController;

  List<Feeling> get feelings => _feelings;

  double get confidenceLevel => _confidenceLevel;

  set confidenceLevel(double value) {
    _confidenceLevel = value;
    notifyListeners();
  }

  double get levelOfStress => _levelOfStress;

  set levelOfStress(double value) {
    _levelOfStress = value;
    notifyListeners();
  }

  String get currentFeeling => _currentFeeling;

  set currentFeeling(String value) {
    _currentFeeling = value;
    isButtonPressable();
    notifyListeners();
  }
}
