import 'package:dartz/dartz.dart';
import 'package:weatherapp/src/error/failures.dart';
import 'package:weatherapp/src/features/data/model/WeatherResponse.dart';
import 'package:weatherapp/src/features/domain/repositories/WeatherRepository.dart';
import 'package:weatherapp/src/features/domain/usecases/usecase.dart';

class GetWeatherUseCase implements UseCase<WeatherResponse, String> {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Either<Failure, WeatherResponse>> call(String query) async {
    return await repository.getWeather(query);
  }
}
