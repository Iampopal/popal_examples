import 'package:flutter/material.dart';
import 'package:popal_examples/presistence/sqllite_client/database.dart';
import 'package:popal_examples/presistence/sqllite_client/model.dart';

class MySQLiteApp extends StatefulWidget {
  @override
  _MySQLiteAppState createState() => _MySQLiteAppState();
}

class _MySQLiteAppState extends State<MySQLiteApp> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My SQLite"),
        ),
        body: FutureBuilder(
          future: DBProvider.db.getAllClients(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                controller: _scrollController,
                itemCount: snapshot.data.length,
                itemBuilder: (context, indext) {
                  Client client = snapshot.data[indext];
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      padding: EdgeInsets.only(left: 16),
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      Scaffold.of(context).hideCurrentSnackBar();
                      SnackBar snackBar = SnackBar(
                        content: Text("Deleting ${client.firstName}"),
                        action: SnackBarAction(
                          label: "UNDO",
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                      );

                      Scaffold.of(context)
                          .showSnackBar(snackBar)
                          .closed
                          .then((reson) {
                        // On Snackbar hide Delete
                        if (reson != SnackBarClosedReason.action) {
                          DBProvider.db.deleteClient(client.id);
                        }
                      });
                    },
                    child: ListTile(
                      title: Text(client.firstName),
                      subtitle: Text(client.lastName),
                      leading: Text(client.id.toString()),
                      trailing: Checkbox(
                        onChanged: (value) {
                          DBProvider.db.blockOrUnblock(client);
                          setState(() {});
                        },
                        value: client.blocked,
                      ),
                      onTap: () async {
                        MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) =>
                              AddEditClientScreen(client: client),
                        );
                        Navigator.of(context).push(route);
                      },
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (context) => AddEditClientScreen());
            Navigator.of(context).push(route);
          },
        ),
      ),
    );
  }
}

//! Add or Edit Screen Screen
class AddEditClientScreen extends StatefulWidget {
  final Client client;
  AddEditClientScreen({this.client});

  @override
  _AddClientScreenState createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddEditClientScreen> {
  final _firstNameTextEditingController = TextEditingController();
  final _lastNameTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (widget.client != null) {
      _firstNameTextEditingController.text = widget.client.firstName;
      _lastNameTextEditingController.text = widget.client.lastName;
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(widget.client == null ? "New Client" : "Edit Client")),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: (widget.client != null) ? false : true,
                controller: _firstNameTextEditingController,
                decoration: InputDecoration(labelText: "First name"),
                validator: (v) {
                  if (v.isEmpty) {
                    return "Name is required";
                  }
                },
              ),
              TextFormField(
                controller: _lastNameTextEditingController,
                decoration: InputDecoration(labelText: "Last name"),
              ),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    "SAVE",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      if (widget.client == null) {
                        //Insert
                        Client client = Client(
                            firstName: _firstNameTextEditingController.text,
                            lastName: _lastNameTextEditingController.text,
                            blocked: false);

                        DBProvider.db.newClient(client);
                      } else {
                        print("UPDATE TIME");

                        Client client = Client(
                            id: widget.client.id,
                            firstName: _firstNameTextEditingController.text,
                            lastName: _lastNameTextEditingController.text,
                            blocked: widget.client.blocked);

                        DBProvider.db.updateClient2(client);
                      }
                    }

                    // Navigator.pop(context);
                    final route =
                        MaterialPageRoute(builder: (context) => MySQLiteApp());
                    Navigator.of(context).push(route);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class _MySQLiteAppState extends State<MySQLiteApp> {
//   final List<Client> testClients = [
//     Client(firstName: "Raouf", lastName: "Rahiche", blocked: false),
//     Client(firstName: "Zaki", lastName: "oun", blocked: true),
//     Client(firstName: "oussama", lastName: "ali", blocked: false),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Flutter SQLite")),
//       body: FutureBuilder<List<Client>>(
//         future: DBProvider.db.getAllClients(),
//         builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 Client item = snapshot.data[index];
//                 return Dismissible(
//                   key: UniqueKey(),
//                   background: Container(color: Colors.red),
//                   onDismissed: (direction) {
//                     DBProvider.db.deleteClient(item.id);
//                   },
//                   child: ListTile(
//                     title: Text(item.lastName),
//                     leading: Text(item.id.toString()),
//                     trailing: Checkbox(
//                       onChanged: (bool value) {
//                         DBProvider.db.blockOrUnblock(item);
//                         setState(() {});
//                       },
//                       value: item.blocked,
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () async {
//           Client rnd = testClients[Random().nextInt(testClients.length)];
//           await DBProvider.db.newClient(rnd);
//           setState(() {});
//         },
//       ),
//     );
//   }
// }
