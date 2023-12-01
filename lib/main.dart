import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

void playsound(int soundnumber) async {
  final player = AudioPlayer();
  await player.play(AssetSource('note$soundnumber.wav'));
}

Expanded buildkey({Color? colorkey, int? soundnumber}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(10),
      color: colorkey,
      child: TextButton(
        onPressed: () {
          playsound(soundnumber!);
        },
        child: const Text(''),
      ),
    ),
  );
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          title: const Text(
            'Xylophone App',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.blue.shade300,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildkey(colorkey: Colors.red, soundnumber: 1),
                buildkey(colorkey: Colors.blue, soundnumber: 2),
                buildkey(colorkey: Colors.green, soundnumber: 3),
                buildkey(colorkey: Colors.yellow, soundnumber: 4),
                buildkey(colorkey: Colors.orange, soundnumber: 5),
                buildkey(colorkey: Colors.amber, soundnumber: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
