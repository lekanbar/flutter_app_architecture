import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class GithubResponse {
  int httpStatusCode;
  String responseBody;

  Logger log = Logger("GithubResponse");

  T decode<T>(http.Response response) {
    httpStatusCode = response.statusCode;
    responseBody = response.body;

    T result;
    try {
      result = jsonDecode(responseBody) as T;
    } on FormatException catch (e) {
      log.severe("Invalid JSON formatting.", e);
    } on CastError catch (e) {
      log.severe(e.toString(), e);
    }
    return result;
  }
}