import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'pageview_store.g.dart';

class PageViewStore = PageViewStoreBase with _$PageViewStore;

abstract class PageViewStoreBase with Store {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  PageController get pageController => _pageController;

  @observable
  int currentIndex = 0;

  @action
  void setCurrentScreen(int value) {
    currentIndex = value;
    pageController.jumpToPage(value);
    //pageController.animateToPage(value, duration: const Duration(milliseconds: 100), curve: const ElasticInCurve());
  }
}