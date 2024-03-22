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

  final _v1 = '/v1';
  final _gifs = '/gifs';
  final _trending = '/trending';
  final _search = '/search';

  static UriBuilder? get get {
    return _instance;
  }

  Uri getTrendingGifs({
    int offset = 0,
  }) {
    final queryParam = {
      "api_key": "KUiwhCM64t7t6UV2XzmaBwzvrCoa93gR",
      "limit": "25",
      "offset": "$offset"
    };
    return Uri.https(_baseUrlAuthority, "$_v1$_gifs$_trending", queryParam);
  }

  Uri getSearchedGifs({
    int offset = 0,
    String query = "",
  }) {
    final queryParam = {
      "api_key": "KUiwhCM64t7t6UV2XzmaBwzvrCoa93gR",
      "limit": "25",
      "offset": "$offset",
      "q": query
    };
    return Uri.https(_baseUrlAuthority, "$_v1$_gifs$_search", queryParam);
  }
}
