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

  final _post = '/posts';
  final _comments = '/comments';
  final _postId = 'postId';
  final _v1 = '/v1';
  final _hash = '/78877c96-1af5-4d21-b380-4990c529eb98';

  static UriBuilder? get get {
    return _instance;
  }

  Uri getNewsData({
    int? id,
  }) {
    return Uri.https(_baseUrlAuthority, _post + "${id != null ? "/$id" : ""}");
  }

  Uri getCommentsData({
    int? id,
  }) {
    final queryParams = {_postId: "$id"};

    return Uri.https(_baseUrlAuthority, _comments, queryParams);
  }

  Uri getTodoData() {
    return Uri.https(_baseUrlAuthority, _v1 + _hash);
  }
}
