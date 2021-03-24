import 'package:apprarogarage/app/models/Movimentacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'movimentacao_store.dart';

class MovimentacaoPage extends StatefulWidget {
  final String title;
  final int id;
  const MovimentacaoPage({Key key, this.title = "Início", @required this.id})
      : super(key: key);

  @override
  _MovimentacaoPageState createState() => _MovimentacaoPageState();
}

class _MovimentacaoPageState
    extends ModularState<MovimentacaoPage, MovimentacaoStore> {
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
      child: Text('Nenhuma movimentação encontrada na vaga até o momento.'),
    );
  }

  Widget _getList(ObservableList<Movimentacao> items) {
    var listview = ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
                "${items[index].veiculo.identificacao} por ${items[index].motorista.identificacao}"),
            subtitle: Text(
              "${items[index].tipo} EM ${items[index].data}",
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            leading: Text("${items[index].veiculo.placa}",
                style: TextStyle(fontSize: 16)),
            trailing: Text("${items[index].kmetragem}KM"),
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
        title: Text('Fluxo de Movimentação'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (store.error != null) {
            return this._erroText(store.error);
          }
          if (store.movimentacoesPorVaga.length <= 0) {
            return this._emptyText();
          }
          return this._getList(store.movimentacoesPorVaga);
        },
      ),
    );
  }
}
