import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/models/global_models.dart';

class BottomNavigation extends StatefulWidget {
  _BottomNavigation createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _selectedIndex = 1;
  final Map tabIndexTitle = {
    0: '时间',
    1: '待办',
    2: '我的'
  };
  void _onItemTapped(int index) {
    // 全局状态，修改底部导航栏
    var globalModels = Provider.of<GlobalModels>(context);
    if (index == globalModels.tabIndex) {
      return null;
    }
    setState(() {
      _selectedIndex = index;
      globalModels.changeTabIndexAndTabTitle(index, tabIndexTitle[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          title: Text('时间'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list),
          title: Text('待办'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('我的'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
