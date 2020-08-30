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
    return Container(
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
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Center(
                child: Text(widget.alpha[_alphabetIndex].word,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    )),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              (_alphabetIndex == 0)
                  ? Container()
                  : FlatButton.icon(
                      color: Colors.grey,
                      icon: Icon(Icons.arrow_back_ios),
                      label: Text("Previous"),
                      onPressed: () {
                        setState(() {
                          _alphabetIndex--;
                        });
                      },
                    ),
              (_alphabetIndex == widget.alpha.length - 1)
                  ? Container()
                  : FlatButton.icon(
                      color: Colors.grey,
                      icon: Icon(Icons.arrow_forward_ios),
                      label: Text("Next"),
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
      backgroundColor: widget.alpha == englishCharacters
          ? Colors.white
          : widget.alpha == nepalialphabets
              ? Colors.green
              : widget.alpha == birds ? Colors.blue : Colors.orange,
      appBar: AppBar(
        title: Text("Page Title"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
          _buildcard(),
        ],
      ),
    );
  }
}

//(foo==1)?something1():(foo==2)? something2():(foo==3)? something3(): something4();
