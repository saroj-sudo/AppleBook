import 'package:applebook/model/dummyData.dart';
import 'package:applebook/pages/common.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:applebook/model/menu_item.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  AudioPlayer _controller;
  AudioCache player;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    _controller = new AudioPlayer();
    player = new AudioCache(fixedPlayer: _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.greenAccent,
            ],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(
            11,
            (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return Common(menuItems[index].listOf);
                      },
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(4),
                  child: Container(
                    child: Image.asset(
                      menuItems[index].image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
