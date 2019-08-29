import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/todo_list.dart';
import 'package:my_flutter_app/screens/time_select.dart';
import 'package:my_flutter_app/screens/profiles.dart';

final routes = {
  '/': (context, { arguments }) => TodoList(),
  '/timeSelect': (context) => TimeSelect(),
  '/profiles': (context) => Profiles()
};

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
          builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
        return route;
      } else {
        final Route route =MaterialPageRoute(
          builder: (context) => pageContentBuilder(context));
        return route;
      }
    }
    return null;
  }
}
