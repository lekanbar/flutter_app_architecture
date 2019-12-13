import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'github_response.dart';

class Profile {
  final String name;
  final String username;
  final String bio;
  final String avatarUrl;
  final String location;

  Profile(
      {@required this.name,
      @required this.username,
      this.bio,
      @required this.avatarUrl,
      @required this.location});

  factory Profile.fromJSON(http.Response response) {
    var data = GithubResponse().decode<Map<String, dynamic>>(response);

    return Profile(
        name: data["name"],
        username: data["login"],
        bio: data["bio"],
        avatarUrl: data["avatar_url"],
        location: data["location"]);
  }
}
