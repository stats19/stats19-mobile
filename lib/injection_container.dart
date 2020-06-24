import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stat19_app_mobile/features/navigation/data/datasources/forecast_remote_data_source.dart';
import 'package:stat19_app_mobile/features/navigation/data/repositories/forecast_repository_impl.dart';
import 'package:stat19_app_mobile/features/navigation/domain/repositories/forecast_repository.dart';
import 'package:stat19_app_mobile/features/navigation/domain/usecases/RefreshForecast.dart';
import 'package:stat19_app_mobile/features/navigation/presentation/bloc/navigation_bloc.dart';

import 'features/authentication/data/datasources/user_local_data_source.dart';
import 'features/authentication/data/datasources/user_remote_data_source.dart';
import 'features/authentication/data/repositories/user_repository_impl.dart';
import 'features/authentication/domain/repositories/user_repository.dart';
import 'features/authentication/domain/usecases/login_user.dart';
import 'features/authentication/domain/usecases/register_user.dart';
import 'features/authentication/presentation/bloc/user_bloc.dart';
import 'features/league/data/datasources/league_remote_data_source.dart';
import 'features/league/data/repositories/league_repository_impl.dart';
import 'features/league/domain/repositories/league_repository.dart';
import 'features/league/domain/usecases/get_leagues.dart';
import 'features/league/domain/usecases/get_matches_by_league.dart';
import 'features/league/domain/usecases/get_ranking.dart';
import 'features/league/presentation/bloc/leagues_bloc.dart';
import 'features/match/data/datasources/soccer_match_remote_data_source.dart';
import 'features/match/data/repositories/soccer_match_repository_impl.dart';
import 'features/match/domain/repositories/soccer_match_repository.dart';
import 'features/match/domain/usecases/get_soccer_match.dart';
import 'features/match/presentation/bloc/soccer_match_bloc.dart';
import 'features/player/data/datasources/player_remote_data_source.dart';
import 'features/player/data/repositories/player_repository_impl.dart';
import 'features/player/domain/repositories/player_repository.dart';
import 'features/player/domain/usecases/get_player.dart';
import 'features/player/presentation/bloc/player_bloc.dart';
import 'features/soccer_search/data/datasources/soccer_search_remote_data_source.dart';
import 'features/soccer_search/data/repositories/soccer_search_repository_impl.dart';
import 'features/soccer_search/domain/repositories/soccer_search_repository.dart';
import 'features/soccer_search/domain/usecases/get_soccer_search.dart';
import 'features/soccer_search/presentation/bloc/soccer_search_bloc.dart';
import 'features/team/data/datasources/team_remote_data_source.dart';
import 'features/team/data/repositories/team_repository_impl.dart';
import 'features/team/domain/repositories/team_repository.dart';
import 'features/team/domain/usecases/GetTeam.dart';
import 'features/team/presentation/bloc/team_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - User
  // Bloc
  sl.registerFactory(() => UserBloc(loginUser: sl(), registerUser: sl()));

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
  sl.registerFactory(() => LeaguesBloc(getLeagues: sl(), getMatchesByLeagues: sl(), getRanking: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetLeagues(sl()));
  sl.registerLazySingleton(() => GetMatchesByLeagues(sl()));
  sl.registerLazySingleton(() => GetRanking(sl()));

  // repository
  sl.registerLazySingleton<LeagueRepository>(() => LeagueRepositoryImpl(remoteDataSource: sl()));

  // data sources
  sl.registerLazySingleton<LeagueRemoteDataSource>(() => LeagueRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));

    //! Features - SoccerMatch
  // Bloc 
  sl.registerFactory(() => SoccerMatchBloc(getSoccerMatch: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetSoccerMatch(sl()));

  // repository
  sl.registerLazySingleton<SoccerMatchRepository>(() => SoccerMatchRepositoryImpl(remoteDataSource: sl()));

  // data sources
  sl.registerLazySingleton<SoccerMatchRemoteDataSource>(() => SoccerMatchRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));


  //! Features - SoccerSearch
  // Bloc 
  sl.registerFactory(() => SoccerSearchBloc(getSoccerSearch: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetSoccerSearch(sl()));

  // repository
  sl.registerLazySingleton<SoccerSearchRepository>(() => SoccerSearchRepositoryImpl(remoteDataSource: sl()));

  // data sources
  sl.registerLazySingleton<SoccerSearchRemoteDataSource>(() => SoccerSearchRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));

  //! Features - Player
  // Bloc
  sl.registerFactory(() => PlayerBloc(getPlayer: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetPlayer(sl()));

  // repository
  sl.registerLazySingleton<PlayerRepository>(() => PlayerRepositoryImpl(remoteDataSource: sl()));

  // data sources
  sl.registerLazySingleton<PlayerRemoteDataSouce>(() => PlayerRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));

  //! Features - Team
  // Bloc
  sl.registerFactory(() => TeamBloc(getTeam: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetTeam(sl()));

  // repository
  sl.registerLazySingleton<TeamRepository>(() => TeamRepositoryImpl(remoteDataSource: sl()));

  // data sources
  sl.registerLazySingleton<TeamRemoteDataSource>(() => TeamRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));

  //! Features - Navigation
  // Bloc
  sl.registerFactory(() => NavigationBloc(refreshForecast: sl()));

  // Use cases
  sl.registerLazySingleton(() => RefreshForecast(sl()));

  // repository
  sl.registerLazySingleton<ForecastRepository>(() => ForecastRepositoryImpl(remoteDataSource: sl()));

  // data sources
  sl.registerLazySingleton<ForecastRemoteDataSource>(() => ForecastRemoteDataSourceImpl(client: sl(), sharedPreferences: sl()));

  //! Core

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(()  => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
