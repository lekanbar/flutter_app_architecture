import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/data/repository.dart';
import 'package:flutter_app_architecture/ui/scoped_model/profile_model.dart';
import 'package:flutter_app_architecture/ui/shared/widgets/loading_widget.dart';
import 'package:flutter_app_architecture/ui/shared/widgets/screen_body_widget.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelArchitectureScreen extends StatefulWidget {
  ScopedModelArchitectureScreen(this._userName, this._repository);

  final Repository _repository;
  final String _userName;

  @override
  State<StatefulWidget> createState() => _ScopedModelArchitectureScreenState();
}

class _ScopedModelArchitectureScreenState extends State<ScopedModelArchitectureScreen> {
  ProfileModel _profileModel;

  @override
  void initState() {
    _profileModel = ProfileModel(widget._userName, widget._repository);
    _profileModel.loadGithubProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _profileModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scoped Model'),
        ),
        body: SafeArea(
          child: ScopedModelDescendant<ProfileModel>(
            builder: (context, child, model) {
              if (model.isLoading)
                return LoadingWidget();
              else
                return ScreenBodyWidget(model.profile);
            },
          ),
        ),
      ),
    );
  }
}