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

  final _api = '/api';
  final _users = '/users';

  static UriBuilder? get get {
    return _instance;
  }

  Uri getPageDat({int page = 2}) {
    Map<String, String> qParams = {
      'page': '$page',
    };
    return Uri.https(
      _baseUrlAuthority,
      _api + _users,
      qParams,
    );
  }
}
