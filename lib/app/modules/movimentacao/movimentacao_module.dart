import 'package:flutter_modular/flutter_modular.dart';
import 'package:apprarogarage/app/modules/movimentacao/movimentacao_repository.dart';
import 'movimentacao_store.dart';

import 'movimentacao_page.dart';

class MovimentacaoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => MovimentacaoRepository()),
    Bind((i) => MovimentacaoStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/:id',
        child: (_, args) =>
            MovimentacaoPage(id: int.parse("${args.params['id']}"))),
  ];
}
