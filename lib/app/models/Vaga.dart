import 'Movimentacao.dart';

class Vaga {
  int _id;
  String _identificacao;
  List<Movimentacao> _movimentacoes;

  int get id => this._id;

  set id(int value) => this._id = value;

  get identificacao => this._identificacao;

  set identificacao(value) => this._identificacao = value;

  get movimentacoes => this._movimentacoes;

  set movimentacoes(movimentacoes) => this._movimentacoes = movimentacoes;

  Vaga(this._id, this._identificacao, this._movimentacoes);
}
