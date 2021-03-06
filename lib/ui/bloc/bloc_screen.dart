import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/data/repository.dart';
import 'package:flutter_app_architecture/ui/bloc/profile_bloc.dart';
import 'package:flutter_app_architecture/ui/shared/widgets/loading_widget.dart';
import 'package:flutter_app_architecture/ui/shared/widgets/screen_body_widget.dart';

class BlocArchitectureScreen extends StatefulWidget {
  BlocArchitectureScreen(this._userName, this._repository);

  final Repository _repository;
  final String _userName;

  @override
  State<StatefulWidget> createState() => _BlocArchitectureScreenState();
}

class _BlocArchitectureScreenState extends State<BlocArchitectureScreen> {
  ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = ProfileBloc(widget._userName, widget._repository);
    _profileBloc.loadGithubProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC'),
      ),
      body: SafeArea(
        child: StreamBuilder<ProfileState>(
          stream: _profileBloc.profileStream,
          initialData: ProfileLoadingState(),
          builder: (context, snapshot) {
            if (snapshot.data is ProfileDataState) {
              ProfileDataState state = snapshot.data;
              return ScreenBodyWidget(state.profile);
            }
            else
              return LoadingWidget();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _profileBloc.dispose();
    super.dispose();
  }
}