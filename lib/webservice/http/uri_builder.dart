class UriBuilder {
  final _baseUrlAuthority;

  static UriBuilder? _instance;

  factory UriBuilder({
    required String? baseUrlAuthority,
  }) {
    _instance ??= UriBuilder._internal(
      baseUrlAuthority,
    );
    return _instance!;
  }

  final _api = '/api';
  final _ticker = '/ticker';
  final _orderBook = '/order_book';
  final _pathVersion2 = '/v2';

  UriBuilder._internal(
    this._baseUrlAuthority,
  );

  static UriBuilder? get get {
    return _instance;
  }

  Uri getCurrencyData({required String currency}) {
    return Uri.https(
      _baseUrlAuthority,
      _api+_pathVersion2+_ticker+'/'+currency,
    );
  }

  Uri getOrderBookData({required String currency}) {
    return Uri.https(
      _baseUrlAuthority,
      _api+_pathVersion2+_orderBook+'/'+currency,
    );
  }
}
