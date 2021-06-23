import 'package:scoped_model/scoped_model.dart';
import 'package:state_app/domain/counter.dart';

class CounterViewModel extends Model {
  final _counter = Counter();

  int _count = 0;
  int get count => _count;

  void increment() {
    _count = _counter.increment(_count);
    notifyListeners();
  }

  void reset() {
    _count = _counter.reset();
    notifyListeners();
  }
}