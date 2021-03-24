import 'package:apprarogarage/app/models/Motorista.dart';
import 'package:apprarogarage/app/models/Veiculo.dart';

class Movimentacao {
  int _id;
  double _kmetragem;
  String _tipo;
  int _idVaga;
  Motorista _motorista;
  Veiculo _veiculo;
  String _data;

  int get id => this._id;

  set id(int value) => this._id = value;

  double get kmetragem => this._kmetragem;

  set kmetragem(double value) => this._kmetragem = value;

  get tipo => this._tipo;

  set tipo(value) => this._tipo = value;

  int get vaga => this._idVaga;

  set vaga(int value) => this._idVaga = value;

  Motorista get motorista => this._motorista;

  set motorista(Motorista value) => this._motorista = value;

  Veiculo get veiculo => this._veiculo;

  set veiculo(Veiculo value) => this._veiculo = value;

  get data => this._data;

  set data(value) => this._data = value;

  Movimentacao(this._id, this._kmetragem, this._motorista, this._tipo,
      this._idVaga, this._veiculo, this._data);
}
