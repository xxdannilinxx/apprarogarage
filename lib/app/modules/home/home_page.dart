import 'package:apprarogarage/app/models/Movimentacao.dart';
import 'package:apprarogarage/app/models/Vaga.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Início"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  bool _ocupado(List<Movimentacao> movimentacoes) {
    if (movimentacoes.length <= 0) {
      return false;
    }
    if (movimentacoes.last.tipo != 'ENTRADA') {
      return false;
    }
    store.vagasOcupadas.add(movimentacoes.last.id);
    return true;
  }

  Widget _erroText(String error) {
    return Center(
      child: Text(
        '$error',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _emptyText() {
    return Center(
      child: Text('Nenhuma vaga encontrada até o momento.'),
    );
  }

  Widget _getList(ObservableList<Vaga> items) {
    var listview = ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text("VAGA ${items[index].id}"),
            subtitle: Text("EM ${items[index].identificacao}"),
            leading: Icon(Icons.car_repair),
            trailing: Text(
              (this._ocupado(items[index].movimentacoes) ? 'OCUPADO' : 'LIVRE'),
              style: TextStyle(
                color: (this._ocupado(items[index].movimentacoes)
                    ? Colors.red
                    : Colors.green),
              ),
            ),
            onTap: () =>
                Modular.to.pushNamed('/movimentacao/${items[index].id}'),
          ),
        );
      },
    );
    return listview;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Olá João, temos ${store.getVagasDisponiveis()} vagas disponíveis!'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (store.error != null) {
            return this._erroText(store.error);
          }
          if (store.vagas.length <= 0) {
            return this._emptyText();
          }
          return this._getList(store.vagas);
        },
      ),
    );
  }
}
