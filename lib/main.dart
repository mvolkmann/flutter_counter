import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Counter'),
      ),
      body: Counter(initialValue: 10),
    );
  }
}

class Counter extends StatefulWidget {
  final int initialValue;

  const Counter({Key? key, this.initialValue = 0}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var _count = 0;

  static const textStyle = TextStyle(fontSize: 36);

  @override
  void initState() {
    // Note the use of "widget." to refer to
    // properties in the associated stateful widget.
    _count = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TextButton(
        child: const Text('-', style: textStyle),
        // The button is disabled when onPressed is null.
        onPressed: _count <= 0 ? null : () => setState(() => _count -= 1),
      ),
      Text('$_count', style: textStyle),
      TextButton(
        child: const Text('+', style: textStyle),
        onPressed: () => setState(() => _count += 1),
      ),
      ElevatedButton(
        child: const Text('Reset'),
        onPressed: () => setState(() => _count = 0),
      ),
    ]);
  }
}
