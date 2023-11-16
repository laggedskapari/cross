import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cross/domain/usecases/local_database_usecase_implementation.dart';
import 'local_database_repository_provider.dart';

final localDatabaseUseCaseProvider = Provider<LocalDatabaseUseCaseImplementation>((ref) {
  final localDatabaseRepository = ref.watch(localDatabaseRepositoryProvider);
  return LocalDatabaseUseCaseImplementation(localDatabaseRepository);
});