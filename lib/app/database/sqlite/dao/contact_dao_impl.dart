import 'package:agenda_crud/app/database/sqlite/connection.dart';
import 'package:agenda_crud/domain/entities/contact.dart';
import 'package:agenda_crud/domain/interfaces/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

class ContactDAOImpl implements ContactDAO {
  Database? _db;

  @override
  Future<List<Contact>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db!.query('contact');

    List<Contact> lista = List.generate(
      resultado.length,
      (i) {
        var linha = resultado[i];
        return Contact(
            id: linha['id'],
            nome: linha['nome'],
            telefone: linha['telefone'],
            email: linha['email']);
      },
    );
    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM contact WHERE id=?';
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(Contact contact) async {
    //aqui criamos um metodo para salvarmos o contato
    //armazemos em _db a conecxão com o banco e verificamos se o contato q vamos criar tem um id nulo
    _db = await Connection.get();
    var sql;
    //se o contato for nulo quer dizer que é um novo contato e vamos adicionalo a lista
  
    if (contact == null) {
      sql = 'INSERT INTO contact(nome,telefone,email) VALUES(?,?,?)';
      _db!.rawInsert(
        sql,
        [contact.nome, contact.telefone, contact.email],
      );
      //caso o contato ja exista pedimos o id para q possamos atualizar o contato
    } else {
      sql = 'UPDATE contact SET nome=?, telefone=?, emamil=? WHERE id= ?';
      _db!.rawUpdate(
        sql,
        [contact.nome, contact.telefone, contact.email, contact.id],
      );
    }
  }
}
