import 'package:agenda_crud/app/view/contact_form_back.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fildName(ContactFormBack back) {
    return TextFormField(
      validator: back.validateName,
      onSaved: (newValue) => back.contact!.nome = newValue,
      initialValue: back.contact!.nome,
      decoration: InputDecoration(labelText: 'Nome'),
    );
  }

  Widget fildEmail(ContactFormBack back) {
    return TextFormField(
      validator: back.validateEmail,
      onSaved: (newValue) => back.contact!.email = newValue,
      initialValue: back.contact!.email,
      decoration: InputDecoration(labelText: 'E-mail'),
    );
  }

  Widget fildPhone(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
      validator: back.validatePhone,
      onSaved: (newValue) => back.contact!.telefone = newValue,
      initialValue: back.contact!.telefone,
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Telefone',
        hintText: '(99) 9 9999-9999',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de contato"),
        actions: [
          IconButton(
            onPressed: () {
              _form.currentState!.validate();
              _form.currentState!.save();
              if (_back.isValid) {
                _back.save();
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fildName(_back),
              fildEmail(_back),
              fildPhone(_back),
            ],
          ),
        ),
      ),
    );
  }
}
