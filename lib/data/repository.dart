import 'dart:async';
import 'dart:io';
import "package:http/http.dart" as http;
import 'package:flutter_app_architecture/data/profile.dart';
import 'package:logging/logging.dart';

class Repository {

  Logger log = Logger("Repository");

  Future<Profile> getGitHubProfile(String userName) async {
    Map<String, String> headers = {
      "Accept": "application/vnd.github.v3+json"
    };

    try {
      final response = await http.get(_getUri(userName), headers: headers);
      return Profile.fromJSON(response);
    } on http.ClientException catch (e) {
      log.severe("ClientException has occurred: $e");
      throw Exception(e.message);
    } on IOException catch (e) {
      log.severe("IOException has occurred: $e");
      throw Exception(e.toString());
    }
  }

  Uri _getUri(String username) {
    return Uri(
        scheme: "https",
        host: "api.github.com",
        path: "/users/$username");
  }
}