import 'package:flutter/material.dart';

class FloatingAppbarListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Floating Appbar List';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            //* App Bar
            SliverAppBar(
              title: Text(appTitle, style: TextStyle(fontSize: 24)),
              floating: true,
              flexibleSpace: Image.asset(
                "images/me.jpg",
                fit: BoxFit.cover,
              ),
              expandedHeight: 160.0,
            ),

            ///* List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return ListTile(
                    title: Text("Item #${i + 1}"),
                  );
                },
                childCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
