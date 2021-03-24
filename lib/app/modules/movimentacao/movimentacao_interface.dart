import 'package:apprarogarage/app/models/Movimentacao.dart';

abstract class MovimentacaoInterface {
  List<Movimentacao> getAllMovimentacoes();
  List<Movimentacao> getMovimentacoesPorVaga(int idVaga);
}
