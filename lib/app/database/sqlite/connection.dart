import 'package:agenda_crud/app/database/sqlite/script.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'script.dart';

//separando as resposabilidades de uma classe da contact_list, deixando-a apenas responsavél pela exibição dos dados, a classe conection faz exatamento oq seu nom diz ela intermedia a conecxão entre o banco de dados e o solicitante dos dados.

class Connection {
  //usa-se o static pois só teremos apenas 1 usuario então tornamos a variavél visivel a todos os seus membros
  static Database? _db;

  //usando o metodo Future demos a enteder q aqui é de se esperar um dado q ainda estar por vim, o async e o await faz com que os dados sejam esperados e cheguem a seu destino
  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco_contatos');
      deleteDatabase(path);
      //abertura do banco de dados
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          //crianção da tabela
          db.execute(createTable);
          //inserção dos dados na tabela
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
        },
      );
    }
    return _db;
  }
}
