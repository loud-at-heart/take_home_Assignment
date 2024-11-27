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

  final _albums = '/albums';
  final _photos = '/photos';

  static UriBuilder? get get {
    return _instance;
  }

  Uri getAlbumData({
    int offset = 0,
  }) {
    final queryParam = {
      "_start": "$offset",
      "_limit": "4",
    };
    return Uri.https(_baseUrlAuthority, _albums, queryParam);
  }

  Uri getImageForAlbum({
    int offset = 0,
    String albumId = "",
  }) {
    final queryParam = {
      "_start": "$offset",
      "_limit": "4",
      "albumId": albumId,
    };
    return Uri.https(_baseUrlAuthority, _photos, queryParam);
  }
}
