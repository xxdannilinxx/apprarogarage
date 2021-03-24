import 'package:mobx/mobx.dart';
import 'package:apprarogarage/app/models/Vaga.dart';
import 'package:apprarogarage/app/modules/home/home_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeRepository repository;

  @observable
  String error;

  @observable
  int totalVagas = 0;

  @observable
  List<int> vagasOcupadas = [];

  @observable
  ObservableList<Vaga> vagas;

  HomeStoreBase(this.repository) {
    vagas = repository.getAllVagas().asObservable();
    totalVagas = vagas.length;
  }

  int getVagasDisponiveis() {
    return (this.totalVagas - this.vagasOcupadas.length);
  }
}
