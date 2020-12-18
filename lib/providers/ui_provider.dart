import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{

  int _selectMenuOpt = 0;
  PageController _pageController = new PageController();

  int get selectMenuOpt {
    return this._selectMenuOpt;
  }

  set selectMenuOpt(int i){
    this._selectMenuOpt = i;
    _pageController.animateToPage(i, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}