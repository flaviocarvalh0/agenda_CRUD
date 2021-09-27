//abstract uma classe que ñao pode ser instaciada, onde vai haver metodos de sem implementação
import 'package:agenda_crud/domain/entities/contact.dart';

abstract class ContactDAO {
  //salvar
  save(Contact contact);

//remover
  remove(int id);

//retonar a lista de contatos
  Future<List<Contact>> find();
}
