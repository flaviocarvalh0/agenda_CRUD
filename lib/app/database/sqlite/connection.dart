import 'package:agenda_crud/app/database/sqlite/script.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'script.dart';

//separando as resposabilidades de uma classe da contact_list, deixando-a apenas responsavél pela exibição dos dados, a classe conection faz exatamento oq seu nom diz ela intermedia a conecxão entre o banco de dados e o solicitante dos dados.

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco_contatos');
      deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
        },
      );
    }
    return _db;
  }
}
