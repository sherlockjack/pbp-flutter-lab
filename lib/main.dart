import 'package:flutter/material.dart';
import 'page/drawer.dart';

void main() {
  runApp(const MyApp());
}
class BudgetData {
  const BudgetData(this.title, this.nominal, this.jenis);
  final String title;
  final int nominal;
  final String jenis;
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final List<BudgetData> Blist = [];

  void tambahBudget(BudgetData budget) {
    setState(() {
      Blist.add(budget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas PBP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        Blist: Blist,
        tambahBudget: tambahBudget,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.Blist, required this.tambahBudget});

  final String title = 'Program Counter';
  final List<BudgetData> Blist;
  final Function(BudgetData) tambahBudget;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _counterIsZero = true;

  void _increment() {
    setState(() {
      _counter++;
      _checkCounter();
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
      _checkCounter();
    });
  }

  void _checkCounter() {
    setState(() {
      _counterIsZero = _counter == 0 ? true : false;
    });
  }

  Text _showhasil() {
    if (_counter % 2 == 0) {
      return const Text(
        'GENAP',
        style: TextStyle(color: Colors.red),
      );
    } else {
      return const Text(
        'GANJIL',
        style: TextStyle(color: Colors.blue),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerReiou(
        Blist: widget.Blist,
        tambahBudget: widget.tambahBudget,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _showhasil(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Visibility(
              visible: !_counterIsZero,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: _decrement,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: _increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
