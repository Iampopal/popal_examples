import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

final chatSnapshot = [
  {
    'recive': 'Hello',
    'send': 'Hi',
  },
  {
    'recive': 'How are you?',
    'send': 'I am fine, How are you?',
  },
  {
    'recive': 'I am fine too, where are you from?',
    'send': 'I am from Afghanistan.',
  },
  {
    'recive': 'Great, i like Afghanistan.',
    'send': 'Thank you, where are you from.',
  },
  {
    'recive': 'I am from India',
    'send': 'Great, I like Indian movies.',
  },
  {
    'recive': 'Nice to meet you.',
    'send': 'Nice to meet you too.',
  },
];

class Chat {
  final String send;
  final String recive;
  bool isSend = false;

  Chat.fromMap(Map<String, dynamic> map)
      : recive = map['recive'],
        send = map['send'];

  Map<String, dynamic> toMap() => {
        'recive': recive,
        'send': send,
      };
}

class MessageItem {
  final String text;
  final bool isSend;
  MessageItem({this.text, this.isSend});
}

class TextToSpeachApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessageScreen(),
    );
  }
}

enum TtsState { play, stop }

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    Key key,
  }) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var maleVoice = "en-us-x-sfg#male_2-local",
      femaleVoice = "en-us-x-sfg#female_2-local";

  bool isUserMale = true;

  FlutterTts flutterTts;
  dynamic languages, voices;
  String language, voice;
  TtsState ttsState = TtsState.play;

  List<String> maleVoices;
  List<String> femaleVoices;

  Chat currentChat;
  bool _canSaySend = false;
  int nextChatIndex = 0;

  List<MessageItem> messageItems = List<MessageItem>();

  get isPlaying => ttsState == TtsState.play;
  get isStopped => ttsState == TtsState.stop;

  @override
  void initState() {
    super.initState();

    initTts();
  }

  void initTts() {
    flutterTts = FlutterTts();

    //Set TTS speach
    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.play;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        if (_canSaySend) {
          setState(() {
            messageItems.add(MessageItem(text: currentChat.send, isSend: true));
          });
          _speakSend(currentChat.send);
          _canSaySend = false;
        } else {
          _getNextMessage();
          _startSpeak();
        }

        ttsState = TtsState.stop;
      });
    });

    flutterTts.setErrorHandler((message) {
      setState(() {
        ttsState = TtsState.stop;
      });
    });

    _getNextMessage();
    _startSpeak();
  }

  _getNextMessage() {
    if (nextChatIndex > chatSnapshot.length) return;

    currentChat = Chat.fromMap(chatSnapshot[nextChatIndex]);
    setState(() {
      messageItems.add(MessageItem(text: currentChat.recive, isSend: false));
    });

    nextChatIndex++;
  }

  void _startSpeak() {
    Timer(
        Duration(
          milliseconds: 1000,
        ), () {
      //Wait 0.5 Second
    });
    _speakRecive(currentChat.recive);
    _canSaySend = true;
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    flutterTts.setPitch(1);
    flutterTts.setSpeechRate(0.9);

    return Scaffold(
      appBar: AppBar(
        title: Text('Text To Speach'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              messageItems.clear();
              nextChatIndex = 0;
              _getNextMessage();
              _startSpeak();
            },
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Column(children: <Widget>[
      // _buildSelectVoice(),
      Flexible(
        child: _buildList(context, messageItems),
      ),
    ]);
  }

  Widget _buildList(BuildContext context, List<MessageItem> chatSnapshot) {
    return ListView(
      children: chatSnapshot
          .map<Widget>((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  _buildListItem(BuildContext context, MessageItem chat) {
    // final chat = Chat.fromMap(data);
    return Message(
      message: chat.text,
      isSend: chat.isSend,
    );
  }

  _speakSend(String message) {
    if (isUserMale) {
      flutterTts.setVoice(maleVoice);
    } else {
      flutterTts.setVoice(femaleVoice);
    }

    _speak(message);
  }

  _speakRecive(String message) {
    if (isUserMale) {
      flutterTts.setVoice(femaleVoice);
    } else {
      flutterTts.setVoice(maleVoice);
    }

    _speak(message);
  }

  Future _speak(String p) async {
    var result = await flutterTts.speak(p);
    if (result == 1) {
      setState(() {
        ttsState = TtsState.play;
      });
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1)
      setState(() {
        ttsState = TtsState.stop;
      });
  }

  _setUpVoices() async {
    maleVoices = List<String>();
    femaleVoices = List<String>();
    for (String voice in await flutterTts.getVoices) {
      if (voice.contains("#male") && voice.contains("en-")) {
        maleVoices.add(voice);
      }
    }
    for (String voice in await flutterTts.getVoices) {
      if (voice.contains("#female") && voice.contains("en-")) {
        femaleVoices.add(voice);
      }
    }
    setState(() {});
  }

  int no = 0;
  Container _buildSelectVoice() {
    return Container(
      padding: EdgeInsets.only(top: 18),
      child: Column(
        children: <Widget>[
          Divider(height: 2),
          //! MALE
          Text("MALE VOICE"),
          DropdownButton<String>(
            onChanged: (newVoice) {
              setState(() {
                maleVoice = newVoice;
              });
            },
            hint: Text(maleVoice),
            items: maleVoices.map((String voice) {
              return DropdownMenuItem<String>(
                value: voice,
                child: Text(voice),
              );
            }).toList(),
          ),

          //! FEMALE
          Divider(height: 2),
          Text("FEMALE VOICE"),
          DropdownButton<String>(
            onChanged: (newVoice) {
              setState(() {
                femaleVoice = newVoice;
              });
            },
            hint: Text(femaleVoice),
            items: femaleVoices.map((String voice) {
              return DropdownMenuItem<String>(
                value: voice,
                child: Text(voice),
              );
            }).toList(),
          ),
          Divider(height: 2),
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  final String message;
  final bool isSend;
  Message({this.message, this.isSend = false});

  @override
  Widget build(BuildContext context) {
    MaterialColor sendColor = Colors.blue;
    MaterialColor reciveColor = Colors.grey;

    return Row(
      children: <Widget>[
        isSend ? Text("") : Icon(Icons.mail),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            alignment: isSend ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(right: isSend ? 6 : 0),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              decoration: BoxDecoration(
                color: isSend ? sendColor : reciveColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isSend ? 12 : 0),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(isSend ? 0 : 12),
                ),
              ),
              child: Text(message,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.normal)),
            ),
          ),
        ),
      ],
    );
  }
}
