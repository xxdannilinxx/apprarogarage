import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../models/Vaga.dart';

class ListVagas extends StatelessWidget {
  final List<Vaga> items;
  ListVagas(this.items);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text("VAGA ${items[index].id}"),
            subtitle: Text("EM ${items[index].identificacao}"),
            leading: Icon(Icons.car_repair),
            trailing: Text(
              (items[index].ocupado ? 'OCUPADO' : 'LIVRE'),
              style: TextStyle(
                color: (items[index].ocupado ? Colors.red : Colors.green),
              ),
            ),
            onTap: () =>
                Modular.to.pushNamed('/movimentacao/${items[index].id}'),
          ),
        );
      },
    );
  }
}
