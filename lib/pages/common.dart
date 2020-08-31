import 'package:applebook/model/character.dart';
import 'package:applebook/model/dummyData.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Common extends StatefulWidget {
  final List<Character> alpha;
  Common(this.alpha);
  @override
  _CommonState createState() => _CommonState();
}

class _CommonState extends State<Common> {
  AudioCache player;
  AudioPlayer _controller;
  int _alphabetIndex = 0;

  @override
  void initState() {
    super.initState();
    initPlayer();
    // player.play(englishAlphabets[_alphabetIndex].audioPath);
  }

  void initPlayer() {
    _controller = new AudioPlayer();
    player = new AudioCache(fixedPlayer: _controller);
  }

  Widget _buildcard() {
    player.play(widget.alpha[_alphabetIndex].audioPath);
    return Expanded(
      child: Column(
        children: <Widget>[
          Text(
            widget.alpha[_alphabetIndex].letter,
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          InkWell(
            onTap: () {
              player.play(widget.alpha[_alphabetIndex].audioPath);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Container(
                height: 250.0,
                width: 250.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.alpha[_alphabetIndex].imagPath),
                      fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(widget.alpha[_alphabetIndex].word,
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: 4,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              (_alphabetIndex == 0)
                  ? Container()
                  : FlatButton.icon(
                      // color: Colors.grey,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Previous",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _alphabetIndex--;
                        });
                      },
                    ),
              Spacer(),
              (_alphabetIndex == widget.alpha.length - 1)
                  ? Container()
                  : FlatButton.icon(
                      // color: Colors.grey,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _alphabetIndex++;
                          // _controller.stop();
                        });
                      },
                    )
            ],
          ),
          FlatButton.icon(
            color: Colors.green,
            label: Text(
              "Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Varela",
              ),
            ),
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Page Title"),
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: Colors.black.withOpacity(0.1),
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: (widget.alpha == englishCharacters)
                  ? [
                      Color.fromRGBO(0, 191, 255, 1),
                      Color.fromRGBO(191, 255, 0, 1)
                    ]
                  : (widget.alpha == nepalialphabets)
                      ? [
                          Color.fromRGBO(255, 64, 0, 1),
                          Color.fromRGBO(0, 255, 0, 1)
                        ]
                      : (widget.alpha == birds)
                          ? [
                              Color.fromRGBO(102, 51, 0, 1),
                              Color.fromRGBO(64, 64, 64, 1),
                            ]
                          : (widget.alpha == vegetables)
                              ? [
                                  Color.fromRGBO(0, 102, 0, 1),
                                  Color.fromRGBO(102, 51, 0, 1),
                                ]
                              : (widget.alpha == transportation)
                                  ? [
                                      Color.fromRGBO(255, 0, 0, 1),
                                      Color.fromRGBO(13, 13, 13, 1),
                                    ]
                                  : (widget.alpha == flowers)
                                      ? [
                                          Color.fromRGBO(255, 64, 0, 1),
                                          Color.fromRGBO(255, 255, 0, 1),
                                        ]
                                      : (widget.alpha == fruits)
                                          ? [
                                              Color.fromRGBO(0, 77, 26, 1),
                                              Color.fromRGBO(204, 153, 0, 1),
                                            ]
                                          : (widget.alpha == insects)
                                              ? [
                                                  Color.fromRGBO(
                                                      153, 102, 51, 1),
                                                  Color.fromRGBO(0, 0, 0, 1),
                                                ]
                                              : (widget.alpha == bodyparts)
                                                  ? [
                                                      Color.fromRGBO(
                                                          77, 51, 0, 1),
                                                      Color.fromRGBO(
                                                          255, 204, 255, 1),
                                                    ]
                                                  : (widget.alpha ==
                                                          wildanimals)
                                                      ? [
                                                          Color.fromRGBO(
                                                              102, 102, 0, 1),
                                                          Color.fromRGBO(
                                                              0, 102, 102, 1),
                                                        ]
                                                      : (widget.alpha ==
                                                              domesticanimals)
                                                          ? [
                                                              Color.fromRGBO(
                                                                  255, 0, 0, 1),
                                                              Color.fromRGBO(13,
                                                                  13, 13, 1),
                                                            ]
                                                          : [
                                                              Color.fromRGBO(
                                                                  255,
                                                                  64,
                                                                  0,
                                                                  1),
                                                              Color.fromRGBO(
                                                                  0, 128, 0, 1),
                                                            ],
            ),
          ),
          child: _buildcard(),
        ),
      ),
    );
  }
}
