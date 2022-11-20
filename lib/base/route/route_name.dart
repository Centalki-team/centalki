class RouteName<T> {
  const RouteName(this.parent, this.route);

  final String route;
  final RouteName? parent;

  String get fullRoute {
    return toString();
  }

  String argument(T arguments) {
    return '${this}?$arguments';
  }

  String args(Map<String, dynamic> arguments) {
    String s = toString();
    if (arguments.isNotEmpty) {
      s += '?';
      for (var entry in arguments.entries) {
        s += '${entry.key}=${entry.value}&';
      }
      return s.substring(0, s.length - 1);
    }
    return s;
  }

  @override
  String toString() {
    if (parent != null) {
      return '$parent$route'.replaceAll('//', '/');
    } else {
      return route;
    }
  }
}

class ModuleRouteName extends RouteName {
  const ModuleRouteName(String route, {RouteName? parent})
      : super(parent, route);

  @override
  String get fullRoute {
    if (super.fullRoute == '/') {
      return super.fullRoute;
    }
    return '${super.fullRoute}/';
  }
}
