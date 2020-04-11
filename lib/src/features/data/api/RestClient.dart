import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weatherapp/src/features/data/model/WeatherResponse.dart';
import 'package:weatherapp/src/res/Strings.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: Strings.BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/current")
  Future<WeatherResponse> getWeather(@Query("query") String query,
      {@Query("access_key") String apiKey = Strings.API_KEY});
}
