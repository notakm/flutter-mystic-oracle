import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortune App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const Practice(title: 'Ask Your Fate - Mystic Oracle'),
    );
  }
}

class Practice extends StatefulWidget {

  final String title;
  const Practice({super.key , required this.title});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {

  final List<String>fortuneList = ["A pleasant surprise awaits you today.",
  "Trust your instincts—they will guide you well.",
  "An exciting opportunity is on the horizon.",
  "Your kindness will return to you tenfold.",
  "A long-awaited wish may soon come true.",
  "Great things come to those who stay patient.",
  "Someone is thinking of you right now.",
  "Adventure and new experiences await you.",
  "Your creativity will shine brightly today.",
  "Fortune favors the bold. Take the first step.",
  "A challenge ahead will reveal your true strength.",
  "Good news will find you sooner than expected.",
  "Listen carefully - an important message is coming.",
  "The answer you seek already lies within you.",
  "A chance encounter may change your path.",
  "The stars encourage you to follow your dreams.",
  "Today is a perfect day to begin something new.",
  "Luck is quietly working in your favor.",
  "A hidden opportunity will soon reveal itself.",
  "Your future is brighter than you imagine.",
  "Believe in yourself, and magic will follow.",
  "Unexpected joy is heading your way.",
  "The universe is aligning in your favor.",
  "A small act of courage will bring great rewards.",
  "Peace and happiness will surround you today."];

  String currentFortune = 'Click Here';

  bool isPressed = false;
  void getfortune() {
    var random = Random();
    int r_value = random.nextInt(fortuneList.length);

    setState(() {
      currentFortune = fortuneList[r_value];
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
     var style = Theme.of(context).colorScheme.copyWith();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: style.onPrimary
          ),
          ),
        ),
        backgroundColor: style.primary,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait ? portraitmode() : landscapemode();
      }),
    );
  }
      Widget portraitmode()  {
        return Column(
          children: [ Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(
                      width: 3,
                      color: Colors.blueAccent
                    ),
                    color: Colors.blueAccent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: RichText(text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface
                        ),
                        children: [ TextSpan(
                          text: "Step into the world of magic and mystery with" ,
                          style: TextStyle(
                            color: Colors.white
                          )
                          ),
                          TextSpan(
                            text: ' Mystic Oracle!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            )
                          ),
                        ]
                        )
                      ),
                    ),
                  ),
                ),
                

                // Image of Fortune Ball

                InkWell(
                  onTap: () {
                    getfortune();
                  },
                  onTapUp: (_) {
                    setState(() {
                      isPressed = false;
                    });
                  },
                  onTapDown: (_) {
                    setState(() {
                      isPressed = true;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      isPressed = false;
                    });
                  },
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: 
                  AnimatedScale(scale: isPressed ? 0.9 : 1.0, 
                  duration: Duration(milliseconds: 50),
                  child: Image.asset('assets/images/logo.png'))),
                  Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(
                      width: 3,
                      color: Colors.deepOrange
                    ),
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(currentFortune ,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)
                                  ),
                    ),
                  )],
            ),
          ) ]
        );}

    Widget landscapemode() {
      return Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            
            Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.red
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text("Oops! The mystical energies are strongest in Portrait Mode. Rotate your phone to portrait mode for maximum magic.",
                  style: TextStyle(
                    color: Colors.red
                  ),),
                ]),
            )),
            Image.asset('assets/images/landscapemode.png', width: 400, height: 400,)],
            
        ),
      );
    }
  }
