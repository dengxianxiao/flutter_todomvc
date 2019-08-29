import 'package:flutter/material.dart';

/// 全局状态
class GlobalModels with ChangeNotifier {
  int tabIndex = 1;
  String tabTitle = '待办';

  void changeTabIndexAndTabTitle(int index, String title) {
    tabIndex = index;
    tabTitle = title;
    notifyListeners();
  }
}
