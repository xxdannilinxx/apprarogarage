import 'package:apprarogarage/app/modules/movimentacao/widgets/list_movimentacao_widget.dart';
import 'package:apprarogarage/app/shared_widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:apprarogarage/app/shared_widgets/error_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fluxo de Movimentação'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (store.error != null) {
            return ErrorText(store.error);
          }
          if (store.movimentacoesPorVaga.length <= 0) {
            return EmptyText();
          }
          return ListMovimentacao(store.movimentacoesPorVaga);
        },
      ),
    );
  }
}
