import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/modules/weather/bloc/weather_bloc.dart';

class LocationRoute extends StatefulWidget {
  const LocationRoute({Key? key}) : super(key: key);

  @override
  State<LocationRoute> createState() => _LocationRouteState();
}

class _LocationRouteState extends State<LocationRoute> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ServerResponse) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.weatherData!.name),
            ),
          );
        }
        return Container();
      },
      listenWhen: (previous, current) => !_isRebuildWidgetState(current),
      buildWhen: (previous, current) => _isRebuildWidgetState(current),
    );
  }

  bool _isRebuildWidgetState(WeatherState state) {
    return state is ServerResponse || state is LoadingState;
  }
}
