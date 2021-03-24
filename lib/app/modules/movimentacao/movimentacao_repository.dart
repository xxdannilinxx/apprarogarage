import 'package:apprarogarage/app/models/Motorista.dart';
import 'package:apprarogarage/app/models/Movimentacao.dart';
import 'package:apprarogarage/app/models/Veiculo.dart';
import 'package:apprarogarage/app/modules/movimentacao/movimentacao_interface.dart';

class MovimentacaoRepository extends MovimentacaoInterface {
  DateTime data = DateTime.now();

  List<Movimentacao> movimentacoes = [
    Movimentacao(1, 300, Motorista(1, 'Danilo', '0606560402'), 'ENTRADA', 1,
        Veiculo(1, 'Fiat Mobi', 'BMO3409'), "23/03/2021 09:00:00"),
    Movimentacao(2, 300, Motorista(1, 'Danilo', '0606560402'), 'SAIDA', 1,
        Veiculo(1, 'Fiat Mobi', 'BMO3409'), "23/03/2021 12:00:00"),
    Movimentacao(3, 100, Motorista(2, 'José', '11111560422'), 'ENTRADA', 2,
        Veiculo(1, 'VW Gol', 'BWK3309'), "24/03/2021 09:00:00"),
    Movimentacao(4, 20, Motorista(3, 'Paulo', '160234402'), 'ENTRADA', 3,
        Veiculo(1, 'Citroen C3', 'KWI3884'), "23/03/2021 13:00:00"),
    Movimentacao(5, 500, Motorista(4, 'Maria', '2442560402'), 'ENTRADA', 4,
        Veiculo(1, 'Chevrolet Onix', 'MKS1024'), "24/03/2021 15:00:00"),
    Movimentacao(6, 330, Motorista(1, 'Danilo', '0606560402'), 'ENTRADA', 1,
        Veiculo(1, 'Fiat Mobi', 'BMO3409'), "23/03/2021 18:00:00"),
  ];

  List<Movimentacao> getAllMovimentacoes() {
    movimentacoes.sort((Movimentacao a, Movimentacao b) {
      return b.id.compareTo(a.id);
    });
    return movimentacoes;
  }

  List<Movimentacao> getMovimentacoesPorVaga(int idVaga) {
    List<Movimentacao> filtroMovimentacoes = movimentacoes
        .where((Movimentacao movimentacao) => movimentacao.vaga == idVaga)
        .toList();
    movimentacoes.sort((Movimentacao a, Movimentacao b) {
      return b.id.compareTo(a.id);
    });
    return filtroMovimentacoes;
  }
}
