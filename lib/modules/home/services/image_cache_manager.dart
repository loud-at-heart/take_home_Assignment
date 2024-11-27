import 'package:flutter/material.dart';

class ImageCacheManager {
  static final Map<String, ImageProvider> _cache = {};

  static ImageProvider getImage(String url) {
    if (!_cache.containsKey(url)) {
      _cache[url] = NetworkImage(url);
    }
    return _cache[url]!;
  }

  static void clearCache() {
    _cache.clear();
  }
}