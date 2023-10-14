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


  final _post = '/posts';

  static UriBuilder? get get {
    return _instance;
  }

  Uri getNewsData({
    int? id,
  }) {
    return Uri.https(_baseUrlAuthority, _post + "${id != null ? "/$id" : ""}");
  }
}
