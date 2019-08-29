import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/global_models.dart';
import 'package:provider/provider.dart';

/// app默认头部
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;

  AppBarWidget([ this.appBarTitle = '' ]);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: appBarTitle.isNotEmpty ? Text(appBarTitle)
        : Consumer<GlobalModels>(
          builder: (context, global, child) => Text(global.tabTitle),
      ),
      actions: <Widget>[
        new IconButton(
          icon: const Icon(Icons.list),
          onPressed: () => Navigator.pushNamed(context, '/finishTodoList'),
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
