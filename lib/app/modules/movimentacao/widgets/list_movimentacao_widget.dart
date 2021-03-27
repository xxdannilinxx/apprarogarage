import 'package:flutter/material.dart';

import '../../../models/Movimentacao.dart';

class ListMovimentacao extends StatelessWidget {
  final List<Movimentacao> items;
  ListMovimentacao(this.items);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
                "${items[index].veiculo.identificacao} por ${items[index].motorista.identificacao}"),
            subtitle: Text(
              "${items[index].tipo} EM ${items[index].data}",
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            leading: Text("${items[index].veiculo.placa}",
                style: TextStyle(fontSize: 16)),
            trailing: Text("${items[index].kmetragem}KM"),
          ),
        );
      },
    );
  }
}
