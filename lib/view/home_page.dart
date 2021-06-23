import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_app/presentation/counter_view_model.dart';
import 'package:state_app/util/state_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _counter = CounterViewModel();

  @override
  Widget build(BuildContext context) {
    return StateProvider(
      notifier: _counter,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CounterTextWidget(),
              SizedBox(height: 8),
              TallyMarksWidget()
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _counter.reset,
              child: Icon(Icons.autorenew),
            ),
            SizedBox(width: 8),
            FloatingActionButton(
              onPressed: _counter.increment,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class TallyMarksWidget extends StatelessWidget {
  const TallyMarksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _count = StateProvider.of(context)?.value ?? 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _count ~/ 5,
        (_) => Icon(Icons.military_tech),
      ).toList(),
    );
  }
}

class CounterTextWidget extends StatelessWidget {
  const CounterTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _count = StateProvider.of(context)?.value ?? 0;

    return Text(
      '$_count',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
