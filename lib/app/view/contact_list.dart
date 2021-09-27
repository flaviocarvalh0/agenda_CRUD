import 'package:agenda_crud/app/my_app.dart';
import 'package:agenda_crud/app/view/contact_list_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget {
  //busca dados no sqflite, todos os dados retornam um json ou uma list de map, sempre q trabalharmos com consuta em banco de dados usamos o future ou seja uma lista assincrona q espera um retorno em algum momento
  final _back = ContactListBack();

  /*CircleAvatar circleAvatar(String url){
      return Uri.tryParse(url).isAbsolute) ?
      CircleAvatar(backgroundImage: NetworkImage(url))
     : return CircleAvatar(child:icon (Icons.person));
    

  }*/

  Widget iconEditButton(dynamic onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.edit),
      color: Colors.orange,
    );
  }

  Widget iconRemovebutton(BuildContext context, dynamic onRemove) {
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Confirmar a exclusão?'),
            actions: [
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                label: Text('Não'),
              ),
              FloatingActionButton.extended(
                onPressed: onRemove,
                label: Text('Sim'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _back.goToForm(context);
              })
        ],
      ),
      body: Observer(
        builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  dynamic lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      dynamic contato = lista[i];
                      return ListTile(
                        title: Text(contato.nome),
                        subtitle: Text(contato.telefone),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(() {
                                _back.goToForm(context, contato);
                              }),
                              iconRemovebutton(context, () {
                                _back.remove(contato.id);
                                Navigator.of(context).pop();
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        },
      ),
    );
  }
}
