import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ShaderMask',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShaderMask"),
      ),
      body: SafeArea(
        child: Center(
          child: ShaderMask(
            shaderCallback: (bounds) {
              print('bounds : $bounds');
              return const RadialGradient(
                  center: Alignment.center,
                  radius: 1,
                  tileMode: TileMode.mirror,
                  colors: [
                    Colors.red,
                    Colors.blue,
                    Colors.teal,
                    Colors.tealAccent,
                    Colors.yellow,
                    Colors.green,
                    Colors.orange,
                  ]).createShader(bounds);
            },
            child: const Text(
              "Shader Mask",
              style: TextStyle(fontSize: 50,color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
