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
  int vagasDisponiveis;

  @observable
  ObservableList<Vaga> vagas;

  HomeStoreBase(this.repository) {
    vagas = repository.getAllVagas().asObservable();
    vagasDisponiveis = repository.vagasDisponiveis();
  }
}
