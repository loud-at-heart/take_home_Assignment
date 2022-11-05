import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:take_home_assignment/modules/weather/bloc/weather_bloc.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';
import 'package:take_home_assignment/utils/utils.dart';

import '../../../components/error_handling_screen.dart';
import '../../../components/loading_widget.dart';
import '../../../components/weather_item.dart';

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
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: WeatherUtils.getWeatherGradient(
                    state.weatherData?.condition ?? 0,
                  ),
                ),
                color: AppColors.black,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.margin24,
              ),
              constraints: BoxConstraints.expand(),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () async {
                            if (await WeatherUtils.internetConnectivity()) {
                              BlocProvider.of<WeatherBloc>(context).add(
                                FetchDataEvent(),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "No Internet Connection!\nShowing saved content",
                                  ),
                                ),
                              );
                            }
                          },
                          child: Icon(
                            Icons.near_me,
                            size: 50.0,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${state.weatherData?.temp.toInt()}°C',
                            style: AppTextStyles.bold(
                              FontSize.large100,
                              AppColors.white,
                              height: 1.5,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              WeatherUtils.getWeatherIcon(
                                state.weatherData?.condition ?? 0,
                              ),
                              style: AppTextStyles.bold(
                                72,
                                AppColors.white,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        '${WeatherUtils.getMessage(
                          (state.weatherData?.temp ?? 0.0).toInt(),
                        )} in ${state.weatherData?.name}',
                        textAlign: TextAlign.right,
                        style: AppTextStyles.bold(
                          FontSize.large40,
                          AppColors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        'Next 4 Days Forecast',
                        style: AppTextStyles.bold(
                          FontSize.large24,
                          AppColors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200.0,
                          child: (state.forecastData?.list ?? []).isNotEmpty
                              ? ListView.builder(
                                  itemCount: state.forecastData?.list.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => WeatherItem(
                                    weather: state.forecastData!.list
                                        .elementAt(index),
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                    ),
                    Spacing.sizeBoxHt32,
                  ],
                ),
              ),
            ),
          );
        } else if (state is LoadingState) {
          return LoadingScreen();
        } else if (state is NoInternetState) {
          return ErrorHandlingScreen(
            onButtonPressed: () {
              BlocProvider.of<WeatherBloc>(context).add(FetchLocationEvent());
            },
            errorHandlingType: ErrorHandlingEnum.NO_INTERNET,
          );
        } else if (state is PermissionDeniedState) {
          return ErrorHandlingScreen(
            onButtonPressed: () async {
              await Permission.location.isGranted
                  ? BlocProvider.of<WeatherBloc>(context)
                      .add(FetchLocationEvent())
                  : openAppSettings();
            },
            errorHandlingType: ErrorHandlingEnum.NO_PERMISSION,
          );
        } else if (state is RequestFailedWithMessageState) {
          return ErrorHandlingScreen(
            onButtonPressed: () async {
              BlocProvider.of<WeatherBloc>(context).add(FetchLocationEvent());
            },
            errorHandlingType: ErrorHandlingEnum.ERROR,
          );
        }
        return Container();
      },
      listenWhen: (previous, current) => !_isRebuildWidgetState(current),
      buildWhen: (previous, current) => _isRebuildWidgetState(current),
    );
  }

  bool _isRebuildWidgetState(WeatherState state) {
    return state is ServerResponse ||
        state is LoadingState ||
        state is NoInternetState ||
        state is PermissionDeniedState ||
        state is RequestFailedWithMessageState;
  }
}
