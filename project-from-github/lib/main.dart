import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Finance App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // первая
            Container(
              width: 350,
              height: 80,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            
            // вторая
            Container(
              width: 350,
              height: 60,
              color: Colors.green,
            ),
            SizedBox(height: 10),
            
            // третья
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.orange,
                ),
                SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.orange,
                ),
                SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.orange,
                ),
                SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.orange,
                ),
              ],
            ),
            SizedBox(height: 10),
            
            // четвертая
            Container(
              width: 350,
              height: 60,
              color: Colors.red,
            ),
            SizedBox(height: 10),
            
            // пятая
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.purple,
                ),
                SizedBox(width: 5),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.purple,
                ),
                SizedBox(width: 5),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.purple,
                ),
                SizedBox(width: 5),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.purple,
                ),
                SizedBox(width: 5),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.purple,
                ),
                SizedBox(width: 5),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.purple,
                ),
                SizedBox(width: 5),
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.purple,
                ),
              ],
            ),
            SizedBox(height: 10),
            
            // шестая
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 80,
                  color: Colors.teal,
                ),
                SizedBox(width: 10),
               
              ],
            ),
            SizedBox(height: 10),
            
            // навигация
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 40,
                  color: Colors.blueGrey,
                ),
                SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 40,
                  color: Colors.blueGrey,
                ),
                SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 40,
                  color: Colors.blueGrey,
                ),
                SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 40,
                  color: Colors.blueGrey,
                ),
              ],
            ),
            SizedBox(height: 20),
            
            
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}