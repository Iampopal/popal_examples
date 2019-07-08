import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:popal_examples/examples/tts.dart';

final chatSnapshot = [
  {'p1': 'Hello', 'p2': 'Hi'},
  {'p1': 'How are you?', 'p2': 'I am fine, How are you?'},
  {'p1': 'I am fine too, where are you from?', 'p2': 'I am from Afghanistn.'},
];

class Chat {
  final String p1;
  final String p2;

  Chat.fromMap(Map<String, dynamic> map)
      : p1 = map['p1'],
        p2 = map['p2'];
}

class TextToSpeachApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChatScreen();
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key key,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FlutterTts flutterTts = FlutterTts();
  TtsState ttsState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text To Speach'),
        ),
        body: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return _buildList(context, chatSnapshot);
  }

  _buildList(BuildContext context, List<Map> chatSnapshot) {
    return ListView(
      children: chatSnapshot
          .map<Widget>((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  _buildListItem(BuildContext context, Map data) {
    final chat = Chat.fromMap(data);
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(chat.p1),
          onTap: textToSpeach(chat.p1),
        ),
        ListTile(
          title: Text(chat.p2),
          onTap: textToSpeach(chat.p2),
        ),
      ],
    );
  }

  textToSpeach(String p) {
    _speak(p);
  }

  _speak(String p) async {
    var result = await flutterTts.speak(p);
    if (result == 1) {
      setState(() {
        ttsState = TtsState.playing;
      });
    }
  }


}
