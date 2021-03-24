import 'package:apprarogarage/app/modules/movimentacao/movimentacao_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:apprarogarage/app/modules/home/home_repository.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => MovimentacaoRepository()),
    Bind((i) => HomeRepository()),
    Bind((i) => HomeStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
