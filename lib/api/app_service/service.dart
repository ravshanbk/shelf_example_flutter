import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf_example_flutter/models/http_result_model.dart';

import 'package:http/http.dart' as http;
import 'package:shelf_example_flutter/utils/colored_print.dart';

class AppService {
  static String get baseUrl => "http://localhost:8181";
  static const Duration _duration = Duration(seconds: 30);
  static _parseUri(String v) => Uri.parse("$baseUrl$v");

  static final _headers = {"Content-Type": "application/json"};

  static Future<HttpResult> getResponse({
    required String path,
    int? seconds,
  }) async {
    try {
      http.Response res = seconds == null
          ? await http
              .get(
                _parseUri(path),
                headers: _headers,
              )
              .timeout(_duration)
          : await http.get(
              _parseUri(path),
              headers: _headers,
            );
      return _result(res: res, path: path);
    } on TimeoutException catch (_) {
      _.toString().printf("time exeption");
      return HttpResult(
        result: "Internet Error",
        isSuccess: false,
        statusCode: -1,
      );
    } on SocketException catch (_) {
      _.toString().printf("time exeption");
      return HttpResult(
        result: "Internet Error",
        isSuccess: false,
        statusCode: -1,
      );
    }
  }

  static Future<HttpResult> postResponse({
    required String path,
    dynamic body,
  }) async {
    try {
      http.Response res =
          await http.post(_parseUri(path), headers: _headers, body: body);
      return _result(res: res, path: path);
    } on TimeoutException catch (_) {
      _.toString().printf("time exeption");
      return HttpResult(
        result: "Internet Error",
        isSuccess: false,
        statusCode: -1,
      );
    } on SocketException catch (_) {
      _.toString().printf("time exeption");

      return HttpResult(
        result: "Internet Error",
        isSuccess: false,
        statusCode: -1,
      );
    }
  }

  static HttpResult _result(
      {required http.Response res, required String path, dynamic data}) {
    if (res.statusCode == 200) {
      return HttpResult(
        statusCode: 200,
        isSuccess: true,
        result: jsonDecode(res.body),
      );
    } else if (res.statusCode >= 500 && res.statusCode == 404) {
      return HttpResult(
        statusCode: res.statusCode,
        isSuccess: false,
        result: res.body.toString(),
      );
    } else {
      return HttpResult(
        statusCode: res.statusCode,
        isSuccess: false,
        result: res.body,
      );
    }
  }
}

class Urls {
  static String get categoryGetAll => "/category/getAll";
  static String get categoryUpload => "/category/upload";
  static String get itemsAdd => "/items/add";
  static String get itemsGetAll => "/items/getAll";

}
