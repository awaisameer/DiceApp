// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import "dart:math";

void main() {
  runApp(MaterialApp(
    home: const Dicegame(),
    debugShowCheckedModeBanner: false,
  ));
}

class Dicegame extends StatefulWidget {
  const Dicegame({super.key});

  @override
  State<Dicegame> createState() => _DicegameState();
}

class _DicegameState extends State<Dicegame> {
  int lefdiceNumber = 1;
  int rightdiceNumber = 1;
  int x = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: const Text(
          "DICE GAME",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.purple[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/logo.png"),
                  radius: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            lefdiceNumber == 6
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Player ONE Got $x point",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      FilledButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          shadowColor:
                              MaterialStateProperty.all(Colors.cyan.shade700),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple[500]),
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'CONGRATULATIONS',
                              style: TextStyle(color: Colors.purple),
                            ),
                            content: const Text(
                                'YOU GOT "6" DIGIT, AND THAT IS ENOUGH'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: const Text(
                          'GET PRIZE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Player ONE Got 0 Point",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
            rightdiceNumber == 6
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Player Two Got $x point",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      FilledButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          shadowColor:
                              MaterialStateProperty.all(Colors.cyan.shade700),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple[500]),
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'CONGRATULATIONS',
                              style: TextStyle(color: Colors.purple),
                            ),
                            content: const Text(
                                'YOU GOT "6" DIGIT, AND THAT IS ENOUGH'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: const Text(
                          'GET PRIZE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Player TWO Got 0 Point",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        lefdiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset(
                      "images/dice$lefdiceNumber.png",
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        rightdiceNumber = Random().nextInt(6) + 1;
                      });
                    },
                    child: Image.asset(
                      "images/dice$rightdiceNumber.png",
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "PLAYER ONE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "PLAYER TWO",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FilledButton extends StatelessWidget {
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final Widget? child;

  const FilledButton({
    super.key,
    this.style,
    this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: style,
      child: child!,
    );
  }
}
