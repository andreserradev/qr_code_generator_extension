import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QrCode Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 20))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String valueToGenerate = '';

  String? get valueToConvert {
    if (valueToGenerate == null || valueToGenerate == '') {
      return null;
    }
    return valueToGenerate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QrCode Generator'),
      ),
      body: Center(
          child: SizedBox(
        width: 340,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                padding: const EdgeInsets.all(5),
                child: valueToConvert == null
                    ? Container(
                        height: 320,
                      )
                    : QrImage(
                        data: valueToConvert!,
                        version: QrVersions.auto,
                        size: 320,
                        gapless: true,
                      )),
            TextField(
              onChanged: (value) {
                setState(() {
                  valueToGenerate = value;
                });
              },
              decoration: const InputDecoration(
                helperText: 'The QrCode will generate automatically',
                labelText: 'Enter your text here',
              ),
            ),
          ],
        ),
      )),
    );
  }
}
