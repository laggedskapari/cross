import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cross/repositories/local_database_repository_implementation.dart';

final localDatabaseRepositoryProvider = Provider<LocalDatabaseRepositoryImplementation>((ref) => LocalDatabaseRepositoryImplementation());