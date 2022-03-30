import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/home_screen.dart';

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 6));

    animation = Tween<double>(begin: 10, end: 300).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation);
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo(Animation<double> animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          // Positioned.fill(
          //   child: Image(
          //     image: AssetImage("images/back.jpg"),
          //     fit: BoxFit.fill,
          //   ),
          // ),
          new Center(
            child: Container(
              height: animation.value,
              width: animation.value,
              child: Image.asset(
                "images/novo.gif",
                height: 420,
              ),
            ),
          )
        ],
      ),
    );
  }
}
