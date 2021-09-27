################ ANOTAÇÕES CURSO FLUTTER ########################################



############################ Rotas nomeadas #################################

Navigator.of(context).pushedname('NOME DA ROTA')

--Maneira mais simples de navegar pelas rotas a partir de widget ja antes definidos onde ele é: 

const HOME = '/';
const CONTACT_FORM = 'contact-form';
routes: {
    HOME: (context) => ContactList();
    CONTACT_FORM: (context) => ContactForm();
}

-- dessa forma usamos outro widgte para armazenamos nossa rotas aplicando um nome "mais facil" para passarmos para os botões de navegação


########################### ListView.Builder ##############################

 body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          var contato = lista[index];
          return Text(contato['nome']);
        },

- Um listview.builder é uma lista dinamica onde você só precisa criar um item, passando pra ele um tamanho a partir de uma lista.
--itemCount: recebe o tamaho que vc deseja repetir o item ou o tamanho de uma lista como lista.length
--itemBuilder: fazemos uma função (context,index) passamos o contexto do proprio widget.



############### ASSINCRINISMO ####################

-- funçoes assincronas são usadas para q os componentes visuais não seja carregados antes dos dados, evitando assim futuros incovenientes, como se seu banco de dados venha a cair os itens ñ serem carregados sem os dados.
    no dart Usamos o Future para dizer aquela função espere algo. Usado muito na parte do banco de dados.

void main() async{
  await buscarDados();
  print("imagens");
  print("dados");
  print("botões");
}

Future buscarDados() {
  return Future.delayed(
      Duration(seconds: 5), () => print("carregou os dados..."));
}

##################### PADRÃO DE PROJETO #####################