import 'package:flutter/material.dart';

/// this is a list abstract Item */
abstract class ListItem {}

///Heading Item
class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

///Message Item
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

class MixedListApp extends StatelessWidget {
  final items = List<ListItem>.generate(
    1200,
    (i) => (i % 6 == 0)
        ? HeadingItem("Heading")
        : MessageItem("Sender $i", "Message Body $i"),
  );

  @override
  Widget build(BuildContext context) {
    const appTitle = "Mixed List";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            final item = items[i];

            if (item is HeadingItem) {
              return ListTile(
                title: Text(
                  item.heading,
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            } else if (item is MessageItem) {
              return ListTile(
                title: Text(item.sender),
                subtitle: Text(item.body),
              );
            }
          },
        ),
      ),
    );
  }
}
