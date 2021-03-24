class Veiculo {
  int _id;
  String _identificacao;
  String _placa;

  int get id => this._id;

  set id(int value) => this._id = value;

  get identificacao => this._identificacao;

  set identificacao(value) => this._identificacao = value;

  get placa => this._placa;

  set placa(value) => this._placa = value;

  Veiculo(this._id, this._identificacao, this._placa);
}
