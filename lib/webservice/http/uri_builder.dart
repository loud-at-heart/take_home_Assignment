import 'package:take_home_assignment/utils/utils.dart';

class UriBuilder {
  factory UriBuilder({
    required String baseUrlAuthority,
  }) {
    _instance ??= UriBuilder._internal(
      baseUrlAuthority,
    );
    return _instance!;
  }

  UriBuilder._internal(
    this._baseUrlAuthority,
  );

  final String _baseUrlAuthority;

  static UriBuilder? _instance;

  final _data = '/data';
  final _ver = '/2.5';
  final _weather = '/weather';
  final _forecast = '/forecast';

  static UriBuilder? get get {
    return _instance;
  }

  Uri getWeatherData({double? lat, double? long, bool isForecast = false}) {
    Map<String, String> qParams = {
      'lat': '$lat',
      'lon': '$long',
      'units': 'metric',
      'appid': WeatherUtils.APPID,
    };
    return Uri.https(
      _baseUrlAuthority,
      _data + _ver + (isForecast ? _forecast : _weather),
      qParams,
    );
  }
}
