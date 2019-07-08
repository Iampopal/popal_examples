import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:popal_examples/presistence/sqllite_client/model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    //if db is null we init it
    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "MyTest.db");

    return await openDatabase(
      path,
      version: 4,
      onOpen: (db) {},
      onCreate: (Database db, int v) async {
        await db.execute("CREATE TABLE Client ("
            "id INTEGER PRIMARY KEY,"
            "firstName TEXT,"
            "lastName TEXT,"
            "blocked BIT"
            ")");
      },
    );
  } //INIT DB

  //* rowInsert 1
  newClient1(Client newClient) async {
    final db = await database;

    var res = await db.rawInsert("Insert into Client (id, firstname)"
        " VALUES (${newClient.id}, ${newClient.firstName})");
    return res;
  } //row Insert 1

  //* rowInsert 2, BIGGEST ID as first Row
  newClient(Client newClient) async {
    final db = await database;

    //Get the big iD
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    int id = table.first["id"];

    var row = await db.rawInsert(
        "INSERT INTO Client(id, firstname, lastname, blocked)"
        "VALUES (?, ?, ?, ?)",
        [id, newClient.firstName, newClient.lastName, newClient.blocked]);

    return row;
  } //row Insert 2

  //* Insert
  newClient2(Client newClient) async {
    final db = await database;
    var res = await db.insert("Client", newClient.toMap());

    return res;
  } // Insert

  //! READ
  getClient(int id) async {
    final db = await database;
    var res = await db.query("Client", whereArgs: [id]);

    return res.isNotEmpty ? Client.fromMap(res.first) : null;
  } //get Client 1

  //! READ All
  getClients() async {
    final db = await database;

    var res = await db.query("Client");

    List<Client> list =
        res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];

    return list;
  }

  Future<List<Client>> getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<Client> list =
        res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  //! READ BLOCKED CLIENTS
  getBlockedClients() async {
    final db = await database;
    var res = await db.query("Select * from Client where blocked = 1");

    List<Client> list =
        res.isNotEmpty ? res.toList().map((c) => Client.fromMap(c)) : null;
    return list;
  }

  //! Update Client
  updateClient(Client newClient) async {
    print("Updating ${newClient.id} - ${newClient.firstName}");

    final db = await database;
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  //! Update Client
  updateClient2(Client newClient) async {
    final db = await database;
    return await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
  }

  //! Blocked or unBlocked Clients
  blockOrUnblock(Client client) async {
    final db = await database;

    Client blocked = Client(
      id: client.id,
      firstName: client.firstName,
      lastName: client.lastName,
      blocked: !client.blocked,
    );

    var res = await db.update(
      "Client",
      blocked.toMap(),
      where: "id = ?",
      whereArgs: [client.id],
    );

    return res;
  }

  //! Delete one
  deleteClient(int id) async {
    final db = await database;
    db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  //! Delete all
  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }
}
