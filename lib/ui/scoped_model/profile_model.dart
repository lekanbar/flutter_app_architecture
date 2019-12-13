import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/data/profile.dart';
import 'package:flutter_app_architecture/data/repository.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileModel extends Model {
  ProfileModel(this._userName, this._repository);

  final Repository _repository;
  final String _userName;

  bool _isLoading = false;
  Profile _profile;

  Profile get profile => _profile;
  bool get isLoading => _isLoading;

  void loadGithubProfile() {
    _isLoading = true;
    notifyListeners();

    _repository.getGitHubProfile(_userName).then((profile) {
      _profile = profile;
      _isLoading = false;
      notifyListeners();
    });
  }

  static ProfileModel of(BuildContext context) =>
      ScopedModel.of<ProfileModel>(context);
}