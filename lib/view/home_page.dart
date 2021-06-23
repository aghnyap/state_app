import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:state_app/presentation/counter_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterViewModel(),
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
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
        floatingActionButton: FloatingActionButtons(),
      ),
    );
  }
}

class FloatingActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterViewModel>(
      builder: (context, child, model) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: model.reset,
            child: Icon(Icons.autorenew),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            onPressed: model.increment,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class TallyMarksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterViewModel>(
      builder: (context, child, model) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          model.count ~/ 5,
          (_) => Icon(Icons.military_tech),
        ).toList(),
      ),
    );
  }
}

class CounterTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterViewModel>(
      builder: (context, child, model) => Text(
        '${model.count}',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
