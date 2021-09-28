//abstract uma classe que ñao pode ser instaciada, onde vai haver metodos de sem implementação
import 'package:agenda_crud/domain/entities/contact.dart';

abstract class ContactDAO {
  save(Contact contact); 

  remove(int id); 

  Future<List<Contact>> find();
}
