import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/injectionContainer.dart';
import 'package:weatherapp/src/features/presentation/bloc/HomeBloc.dart';
import 'package:weatherapp/src/features/presentation/bloc/HomeState.dart';
import 'package:weatherapp/src/res/Dimens.dart';
import 'package:weatherapp/src/res/Strings.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc;

  @override
  void initState() {
    bloc = sl();
    bloc.add(Strings.saintPetersburgQuery);
    super.initState();
  }

  @override
  void deactivate() {
    bloc.close();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(Strings.homePageTitle), actions: <Widget>[popupMenu()]),
      body: body(),
    );
  }

  Widget body() {
    return BlocProvider(
        create: (_) => bloc,
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return mapStateToWidget(state);
        }));
  }

  Widget mapStateToWidget(HomeState state) {
    if (state is Error) {
      return Column(
        children: <Widget>[
          centeredTextWidget(state.message, Dimens.mediumSize)
        ],
      );
    } else if (state is Loaded) {
      final data = state.data;
      return Column(
        children: <Widget>[
          centeredTextWidget(data.location.name, Dimens.mediumSize),
          centeredTextWidget(
              "${data.current.temperature}${Strings.celsiusMark}",
              Dimens.bigSize),
          centeredTextWidget(
              "${data.current.weatherDescriptions.first}", Dimens.mediumSize)
        ],
      );
    } else {
      return Column(children: <Widget>[
        Expanded(
            child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.black),
          ),
        ))
      ]);
    }
  }

  Widget popupMenu() {
    final cities = [
      Strings.saintPetersburgQuery,
      Strings.moscowQuery,
      Strings.newYorkQuery
    ];
    return PopupMenuButton<String>(
      onSelected: (String city) => {bloc.add(city)},
      itemBuilder: (BuildContext context) {
        return cities
            .map<PopupMenuItem<String>>((city) => PopupMenuItem(
                  value: city,
                  child: Text(city),
                ))
            .toList();
      },
    );
  }

  Widget centeredTextWidget(String label, double fontSize) {
    return Expanded(
      child: Center(
          child: Text(
        label,
        style: TextStyle(fontSize: fontSize),
      )),
    );
  }
}
