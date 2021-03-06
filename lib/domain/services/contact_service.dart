import 'package:agenda_crud/domain/entities/contact.dart';
import 'package:agenda_crud/domain/exeptions/domain_layer_exeption.dart';
import 'package:agenda_crud/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

//regras de vaildação dos campos

class ContactService {
  var _dao = GetIt.I.get<ContactDAO>();
// tem que salvar um contato, ter a possibilidade de alterar e excluir e listar todos os contatos
  save(Contact contact) {
    validateName(contact.nome);
    validateEmail(contact.email);
    validatePhone(contact.telefone);
    _dao.save(contact);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

// nome → seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validateName(String? name) {
    var min = 3;
    var max = 50;

    if (name == null) {
      throw new DomainLayerExeption('O nome é obrigatório.');
    } else if (name.length < min) {
      throw new DomainLayerExeption(
          'O nome deve possuir pelo menos $min caracteres.');
    } else if (name.length > max) {
      throw new DomainLayerExeption(
          'O nome deve possuir no máximo $max caracteres.');
    }
  }

// e-mail → seja obrigatório e tenha @
  validateEmail(String? email) {
    if (email == null) {
      throw new DomainLayerExeption('O e-mail é obrigatório.');
    } else if (!email.contains('@')) {
      throw new DomainLayerExeption('O e-mail deve possuir @.');
    }
  }

// telefone → seja obrigatório e tenha o formato (99) 9 9999-9999
  validatePhone(String? phone) {
    var format = RegExp(
        r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
    if (phone == null) {
      throw new DomainLayerExeption('O telefone é obrigatório.');
    } else if (!format.hasMatch(phone)) {
      throw new DomainLayerExeption(
          'Formato inválido. O formato deve ser (99) 9 9999-9999.');
    }
  }
}
//Diferença do DAO para o serviço da camada de dominio
// DAO da acesso as operações de um banco de dados especifico
//service usa o DAO para ter acesso as operações do banco mas o objetivo é definir as funcionalidades do negocio
