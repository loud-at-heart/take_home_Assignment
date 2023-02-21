import 'package:http/http.dart' as http;

class SessionManager {
  factory SessionManager() {
    return _instance;
  }

  SessionManager._internal();

  static final SessionManager _instance = SessionManager._internal();

  final Map<String, String> _cookies = {};
  final Map<String, String> _headers = {};

  void updateCookie(http.Response? response) {
    String? allSetCookie = response?.headers['set-cookie'];

    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      _headers['cookie'] = _generateCookieHeader();
    }
  }

  String? get getCookie => _headers['cookie'];

  void _setCookie(String rawCookie) {
    if (rawCookie.length > 0) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key.toLowerCase() == 'path' || key.toLowerCase() == 'expires')
          return;

        this._cookies[key] = value;
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in _cookies.keys) {
      if (cookie.length > 0) cookie += ";";
      cookie += key + "=" + (_cookies[key] ?? '');
    }

    return cookie;
  }
}
