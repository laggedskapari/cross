import 'package:cross/domain/repositories/local_database_repo.dart';
import 'package:cross/domain/usecases/local_database_usecase.dart';

import '../entities/task.dart';

class LocalDatabaseUseCaseImplementation extends LocalDatabaseUseCase {
  final LocalDatabaseRepo localDatabaseRepository;

  LocalDatabaseUseCaseImplementation(this.localDatabaseRepository);

  @override
  Future<void> addTask({ required String title }){
    return localDatabaseRepository.addTask(title: title);
  }

  @override
  Future<void> deleteTask(String id){
    return localDatabaseRepository.deleteTask(id);
  }

  @override
  Future<List<Task>> loadTasks() {
    return localDatabaseRepository.loadTasks();
  }

  @override
  Future<void> crossTask(String id){
    return localDatabaseRepository.crossTask(id);
  }

  @override
  Future<void> unCrossTask(String id) {
    return localDatabaseRepository.unCrossTask(id);
  }

}