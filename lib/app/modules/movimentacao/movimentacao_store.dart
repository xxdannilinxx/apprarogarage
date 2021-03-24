import 'package:apprarogarage/app/models/Movimentacao.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:apprarogarage/app/modules/movimentacao/movimentacao_repository.dart';

part 'movimentacao_store.g.dart';

class MovimentacaoStore = MovimentacaoStoreBase with _$MovimentacaoStore;

abstract class MovimentacaoStoreBase with Store {
  MovimentacaoRepository repository;

  @observable
  String error;

  @observable
  ObservableList<Movimentacao> movimentacoes;

  @observable
  ObservableList<Movimentacao> movimentacoesPorVaga;

  MovimentacaoStoreBase(this.repository) {
    int idVaga = int.parse("${Modular.args.params['id']}");
    movimentacoes = repository.getAllMovimentacoes().asObservable();
    movimentacoesPorVaga =
        repository.getMovimentacoesPorVaga(idVaga).asObservable();
  }
}
