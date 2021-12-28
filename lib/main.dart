import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    // controller.forward().then((_) async {
    //   await Future.delayed(Duration(seconds: 1));
    //   controller.reverse();
    // });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Icon"),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
          iconSize: 150,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            color: Colors.pink,
            progress: controller,
          ),
          onPressed: () {
            toggleIcon();
          },
        ),
      ),
    );
  }

  void toggleIcon() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying ? controller.forward() : controller.reverse();
    });
  }
}
