import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_selector/test_seletor.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TestSeletor(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SelectorScreen(),
    );
  }
}

class SelectorScreen extends StatelessWidget {
  const SelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TestSeletor, int>(
      selector: (context, testSeletor) => testSeletor.value,
      builder: (BuildContext context, testSeletor, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Test Selector'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "$testSeletor",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Provider.of<TestSeletor>(context, listen: false).inCrement();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
