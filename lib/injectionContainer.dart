import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:weatherapp/src/features/data/api/RestClient.dart';
import 'package:weatherapp/src/features/domain/repositories/WeatherRepository.dart';
import 'package:weatherapp/src/features/domain/usecases/GetWeatherUseCase.dart';
import 'package:weatherapp/src/features/presentation/bloc/HomeBloc.dart';
import 'package:dio/dio.dart';
import 'package:weatherapp/src/network/NetworkInfo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => HomeBloc(useCase: sl()));
  //use case
  sl.registerLazySingleton(() => GetWeatherUseCase(sl()));
  //repository
  sl.registerLazySingleton<WeatherRepository>(() =>
      WeatherRepositoryImpl(restClient: sl(), networkInfo: sl()));
  sl.registerLazySingleton(() => RestClient(Dio()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
}