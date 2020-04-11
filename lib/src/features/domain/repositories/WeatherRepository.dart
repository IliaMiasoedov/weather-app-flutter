import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:weatherapp/src/error/failures.dart';
import 'package:weatherapp/src/features/data/api/RestClient.dart';
import 'package:weatherapp/src/features/data/model/WeatherResponse.dart';
import 'package:weatherapp/src/network/NetworkInfo.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherResponse>> getWeather(String query);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final NetworkInfo networkInfo;
  final RestClient restClient;

  WeatherRepositoryImpl(
      {@required this.restClient, @required this.networkInfo});

  @override
  Future<Either<Failure, WeatherResponse>> getWeather(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await restClient.getWeather(query);
        return Right(result);
      } on Exception {
        return Left(ServerError());
      }
    } else {
      return Left(ConnectionError());
    }
  }
}
