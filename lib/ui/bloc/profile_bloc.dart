import 'dart:async';

import 'package:flutter_app_architecture/data/repository.dart';
import 'package:flutter_app_architecture/data/profile.dart';

class ProfileBloc {
  ProfileBloc(this._userName, this._repository);

  final Repository _repository;
  final String _userName;

  final _profileStreamController = StreamController<ProfileState>();

  Stream<ProfileState> get user => _profileStreamController.stream;

  void loadGithubProfile() {
    _profileStreamController.sink.add(ProfileState._userLoading());
    _repository.getGitHubProfile(_userName).then((profile) {
      _profileStreamController.sink.add(ProfileState._userData(profile));
    });
  }

  void dispose() {
    _profileStreamController.close();
  }
}

class ProfileState {
  ProfileState();

  factory ProfileState._userData(Profile profile) = ProfileDataState;
  factory ProfileState._userLoading() = ProfileLoadingState;
}

class ProfileLoadingState extends ProfileState {}

class ProfileDataState extends ProfileState {
  ProfileDataState(this.profile);

  final Profile profile;
}