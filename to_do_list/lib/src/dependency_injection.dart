import 'package:get_it/get_it.dart';
import 'package:to_do_list/src/cubits/auth/auth_cubit.dart';
import 'package:to_do_list/src/resources/data/remote_datasource/auth_datasource.dart';
import 'package:to_do_list/src/resources/respository/auth_repo.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource('users'));

  getIt.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(
      dataSource: getIt(),
    ),
  );

  // Bloc
  getIt.registerFactory<AuthCubit>(() {
    // lấy object B bên trên...
    final b = getIt.get<AuthRepositoryImpl>();

    // ...truyền vào constructor của A
    return AuthCubit(b);
  });
}
