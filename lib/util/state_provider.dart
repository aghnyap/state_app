import 'package:flutter/widgets.dart';

class StateProvider extends InheritedWidget {
  const StateProvider({
    Key? key,
    required this.count,
    required this.child,
  }) : super(key: key, child: child);

  final int count;
  final Widget child;

  static StateProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateProvider>();
  }

  @override
  bool updateShouldNotify(StateProvider oldWidget) {
    return true;
  }
}
