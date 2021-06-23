import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_app/domain/counter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _counter = Counter();
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count = _counter.increment(_count);
    });
  }

  void _resetCounter() {
    setState(() {
      _count = _counter.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_count',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _count ~/ 5,
                (_) => Icon(Icons.military_tech),
              ).toList(),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _resetCounter,
            child: Icon(Icons.autorenew),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
