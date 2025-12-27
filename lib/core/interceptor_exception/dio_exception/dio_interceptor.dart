import 'package:dio/dio.dart';

class AppLogInterceptor extends Interceptor {
  void _divider([String title = ""]) {
    final line =
        "════════════════════════════════════════════════════════════════";
    print("\n$line");
    if (title.isNotEmpty) {
      print("📌 $title");
      print(line);
    }
  }

  /// Shortens very long strings in JSON logs
  dynamic _sanitize(dynamic value) {
    if (value is String && value.length > 500) {
      return "${value.substring(0, 500)}... [truncated ${value.length} chars]";
    }
    if (value is Map) {
      return value.map((k, v) => MapEntry(k, _sanitize(v)));
    }
    if (value is List) {
      return value.map((e) => _sanitize(e)).toList();
    }
    return value;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _divider("📤 REQUEST");
    print("🔗 URL: ${options.uri}");
    print("🔧 Method: ${options.method}");

    if (options.headers.isNotEmpty) {
      print("📋 Headers:");
      options.headers.forEach((key, value) {
        print("   $key: $value");
      });
    }

    if (options.queryParameters.isNotEmpty) {
      print("🔍 Query Parameters:");
      options.queryParameters.forEach((key, value) {
        print("   $key: $value");
      });
    }

    if (options.data != null) {
      print("📦 Body: ${_sanitize(options.data)}");
    }

    _divider();
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _divider("📥 RESPONSE");
    print("🔗 URL: ${response.requestOptions.uri}");
    print("✅ Status Code: ${response.statusCode}");
    print("⏱️ Duration: ${DateTime.now().difference(
        DateTime.fromMillisecondsSinceEpoch(
            response.requestOptions.extra['start_time'] ?? 0
        )
    ).inMilliseconds}ms");

    if (response.headers.map.isNotEmpty) {
      print("📋 Headers:");
      response.headers.map.forEach((key, value) {
        print("   $key: ${value.join(', ')}");
      });
    }

    print("📦 Response Data:");
    print(_sanitize(response.data));
    _divider();
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _divider("❌ ERROR");
    print("🔗 URL: ${err.requestOptions.uri}");
    print("❗ Error Type: ${err.type}");
    print("💬 Message: ${err.message}");

    if (err.response != null) {
      print("📛 Status Code: ${err.response?.statusCode}");
      print("📦 Error Data: ${_sanitize(err.response?.data)}");
    }

    _divider();
    super.onError(err, handler);
  }
}