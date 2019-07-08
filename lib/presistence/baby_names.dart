import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final dummySnapshot = [
  {"name": "Abubakr", "votes": 2},
  {"name": "Abraham", "votes": 14},
  {"name": "Zabi", "votes": 11},
  {"name": "Sami", "votes": 10},
  {"name": "Gul", "votes": 1},
];

class BabyNamesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baby Names"),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("baby").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot
          .map<Widget>((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap:
              // () {
              //   record.reference.updateData({'votes': record.votes + 1});
              // },

              //* 2: if 2 user update at the same time, update both; work slow
              () => Firestore.instance.runTransaction(
                    (transactionHandler) async {
                      final freshSnapshot =
                          await transactionHandler.get(record.reference);
                      final fresh = Record.fromSnapshot(freshSnapshot);

                      await transactionHandler
                          .update(record.reference, {'votes': fresh.votes + 1});
                    },
                  ),
        ),
      ),
    );
  }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
