class Motorista {
  int _id;
  String _identificacao;
  String _cnh;

  int get id => this._id;

  set id(int value) => this._id = value;

  get identificacao => this._identificacao;

  set identificacao(value) => this._identificacao = value;

  get cnh => this._cnh;

  set cnh(value) => this._cnh = value;

  Motorista(this._id, this._identificacao, this._cnh);
}
