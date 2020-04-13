import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/src/error/failures.dart';
import 'package:weatherapp/src/features/domain/usecases/GetWeatherUseCase.dart';
import 'package:weatherapp/src/features/presentation/bloc/State.dart';
import 'package:weatherapp/src/res/Strings.dart';

class HomeBloc extends Bloc<String, WState> {
  final GetWeatherUseCase useCase;

  HomeBloc({@required GetWeatherUseCase useCase})
      : assert(useCase != null),
        useCase = useCase;

  @override
  WState get initialState => Empty();

  @override
  Stream<WState> mapEventToState(String event) async* {
    yield Loading();
    final result = await useCase(event);
    yield result.fold((failure) => Error(failure: failure),
        (data) => Loaded(data: data));
  }
}
