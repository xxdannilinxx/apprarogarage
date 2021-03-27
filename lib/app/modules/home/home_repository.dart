import 'package:apprarogarage/app/models/Vaga.dart';
import 'package:apprarogarage/app/modules/home/home_interface.dart';
import 'package:apprarogarage/app/modules/movimentacao/movimentacao_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeRepository extends HomeInterface {
  MovimentacaoRepository movimentacaoRepository =
      Modular.get<MovimentacaoRepository>();

  List<Vaga> getAllVagas() {
    return [
      Vaga(1, 'ALA SUL', movimentacaoRepository.getMovimentacoesPorVaga(1)),
      Vaga(2, 'ALA NORTE', movimentacaoRepository.getMovimentacoesPorVaga(2)),
      Vaga(3, 'ALA SUDESTE', movimentacaoRepository.getMovimentacoesPorVaga(3)),
      Vaga(4, 'ALA OESTE', movimentacaoRepository.getMovimentacoesPorVaga(4)),
      Vaga(5, 'ALA NEUTRA', movimentacaoRepository.getMovimentacoesPorVaga(5)),
    ];
  }

  int vagasDisponiveis() {
    return this
        .getAllVagas()
        .where((Vaga vaga) => vaga.ocupado != true)
        .toList()
        .length;
  }
}
