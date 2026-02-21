import 'package:flutter/material.dart';
import 'package:mon_cour_de_flutter/components/my_custom_button.dart';
import 'package:mon_cour_de_flutter/pages/form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const FormPage(),
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
  //Pour faire un input
  final TextEditingController textController = TextEditingController();

  String? selectedValue = "Rouge";
  final List<String> colors = ["Rouge", "Blue", "Vert"];

  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      _counter--;
    });
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,

        title: Text("Steeve APP"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyCustomButton(
                label: "Cliquez ici",
                onPressed: () {}
            ),
            const Text("Textfield de démo"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  labelText: "Saisissez votre text",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text("Dropdown"),
            DropdownButton(
              items: colors
                  .map(
                    (c) => DropdownMenuItem(
                      value: c,
                      child: Text(c, style: TextStyle(color: Colors.black)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() => selectedValue = value);
              },
            ),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Container(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        "Bonjour Steeve",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(color: Colors.blue),
                  Container(color: Colors.green),
                  Container(color: Colors.yellow),
                ],
              ),
            ),
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
