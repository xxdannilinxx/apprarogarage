// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimentacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovimentacaoStore on MovimentacaoStoreBase, Store {
  final _$movimentacoesAtom = Atom(name: 'MovimentacaoStoreBase.movimentacoes');

  @override
  ObservableList<Movimentacao> get movimentacoes {
    _$movimentacoesAtom.reportRead();
    return super.movimentacoes;
  }

  @override
  set movimentacoes(ObservableList<Movimentacao> value) {
    _$movimentacoesAtom.reportWrite(value, super.movimentacoes, () {
      super.movimentacoes = value;
    });
  }

  @override
  String toString() {
    return '''
movimentacoes: ${movimentacoes}
    ''';
  }
}
