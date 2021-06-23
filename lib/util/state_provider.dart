import 'package:flutter/widgets.dart';
import 'package:state_app/presentation/counter_view_model.dart';

class StateProvider extends InheritedNotifier<CounterViewModel> {
  const StateProvider({
    Key? key,
    required this.notifier,
    required this.child,
  }) : super(key: key, child: child);

  final CounterViewModel notifier;
  final Widget child;

  static CounterViewModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StateProvider>()!
        .notifier;
  }
}
