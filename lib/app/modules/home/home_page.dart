import 'package:apprarogarage/app/modules/home/widgets/list_vagas_widget.dart';
import 'package:apprarogarage/app/shared_widgets/empty_widget.dart';
import 'package:apprarogarage/app/shared_widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Início"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Olá João, temos ${store.vagasDisponiveis} vagas disponíveis!'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (store.error != null) {
            return ErrorText(store.error);
          }
          if (store.vagas.length <= 0) {
            return EmptyText();
          }
          return ListVagas(store.vagas);
        },
      ),
    );
  }
}
