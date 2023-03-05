import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MeditationScreen extends StatefulWidget {
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isBreathing = false;

  void startBreathing() async {
    setState(() {
      isBreathing = true;
    });

    // Show the breathing dialogs
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Breathing'),
        content: Text('Breathe in for 4 seconds...'),
      ),
    );
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Breathing'),
        content: Text('Hold for 4 seconds...'),
      ),
    );
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Breathing'),
        content: Text('Breathe out for 4 seconds...'),
      ),
    );

    setState(() {
      isBreathing = false;
    });
  }

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/meditation_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meditation'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: startBreathing,
                child: Text('Start Breathing'),
              ),
              SizedBox(height: 20),
              if (isBreathing)
                CircularProgressIndicator(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await audioPlayer.play('assets/audio/om_chanting.mp3');
                    },
                    child: Text('Play Om Chanting'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await audioPlayer.stop();
                    },
                    child: Text('Stop'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


