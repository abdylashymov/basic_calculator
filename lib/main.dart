import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  String result = '';

  void calculate() {
    double num1 = double.tryParse(controller1.text) ?? 0.0;
    double num2 = double.tryParse(controller2.text) ?? 0.0;
    double sum = num1 + num2;

    setState(() {
      result = '$sum';
    });
  }

  void chygaruu() {
    double num1 = double.tryParse(controller1.text) ?? 0.0;
    double num2 = double.tryParse(controller2.text) ?? 0.0;
    double difference = num1 - num2;

    setState(() {
      result = '$difference';
    });
  }

  void koboituu() {
    double num1 = double.tryParse(controller1.text) ?? 0.0;
    double num2 = double.tryParse(controller2.text) ?? 0.0;
    double koboitundu = num1 * num2;

    setState(() {
      result = '$koboitundu';
    });
  }

  void boluu() {
    double num1 = double.tryParse(controller1.text) ?? 0.0;
    double num2 = double.tryParse(controller2.text) ?? 0.0;
    double kaldyk = num1 / num2;

    setState(() {
      result = '$kaldyk';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calculator',
          style: TextStyle(
              fontSize: 30, color: Colors.yellow, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: controller1,
              decoration: const InputDecoration(
                hintText: 'Биринчи санды жазыңыз: ',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: controller2,
              decoration: const InputDecoration(
                hintText: 'Экинчи санды жазыңыз: ',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: calculate,
                  label: const Text(
                    'Кошуу',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.yellow)),
                  icon: const Icon(Icons.add),
                ),
                ElevatedButton.icon(
                  onPressed: chygaruu,
                  label: const Text(
                    'Кемитүү',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.yellow)),
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: koboituu,
                  label: const Text(
                    'Көбөйтүү',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  style: const ButtonStyle(
                      // fixedSize: MaterialStatePropertyAll(Size(30, 15)),
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.yellow)),
                  icon: const Icon(Icons.cancel_presentation),
                ),
                ElevatedButton.icon(
                  onPressed: boluu,
                  label: const Text(
                    'Бөлүү',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.yellow)),
                  icon: const Icon(Icons.safety_divider),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Жыйынтык: $result',
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();

    super.dispose();
  }
}
