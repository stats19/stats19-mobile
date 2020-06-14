import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


import 'features/authentication/data/datasources/user_local_data_source.dart';
import 'features/authentication/data/datasources/user_remote_data_source.dart';
import 'features/authentication/data/repositories/user_repository_impl.dart';
import 'features/authentication/domain/repositories/user_repository.dart';
import 'features/authentication/domain/usecases/login_user.dart';
import 'features/authentication/domain/usecases/register_user.dart';
import 'features/authentication/presentation/bloc/user_bloc.dart';
import 'features/leagues/data/datasources/league_remote_data_source.dart';
import 'features/leagues/data/repositories/league_repository_impl.dart';
import 'features/leagues/domain/repositories/league_repository.dart';
import 'features/leagues/domain/usecases/get_leagues.dart';
import 'features/leagues/domain/usecases/get_matches_by_league.dart';
import 'features/leagues/presentation/bloc/leagues_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - User
  // Bloc
  sl.registerFactory(() => UserBloc(loginUser: sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUser(sl()));
  sl.registerLazySingleton(() => RegisterUser(sl()));

  // Repository
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: sl()));

  // data sources
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(sharedPreferences: sl()));

  //! Features - Leagues
  // Bloc 
  sl.registerFactory(() => LeaguesBloc(getLeagues: sl(), getMatchesByLeagues: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetLeagues(sl()));
  sl.registerLazySingleton(() => GetMatchesByLeagues(sl()));

  // repository
  sl.registerLazySingleton<LeagueRepository>(() => LeagueRepositoryImpl(remoteDataSource: sl()));

  // data sources
  sl.registerLazySingleton<LeagueRemoteDataSource>(() => LeagueRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));


  //! Core

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(()  => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
