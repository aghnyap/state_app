import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_app/reducer/counter_reducer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final store = Store<int>(counterReducer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
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
        floatingActionButton: FloatingActionsButtons(),
      ),
    );
  }
}

class FloatingActionsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, Store>(
      converter: (store) => store,
      builder: (context, store) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => store.dispatch(CounterActions.Reset),
            child: Icon(Icons.autorenew),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () => store.dispatch(CounterActions.Increment),
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
    return StoreConnector<int, int>(
      converter: (store) => store.state,
      builder: (context, count) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count ~/ 5,
          (_) => Icon(Icons.military_tech),
        ).toList(),
      ),
    );
  }
}

class CounterTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, int>(
      converter: (store) => store.state,
      builder: (context, count) => Text(
        '$count',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
