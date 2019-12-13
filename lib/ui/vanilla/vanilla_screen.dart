import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/data/profile.dart';
import 'package:flutter_app_architecture/data/repository.dart';
import 'package:flutter_app_architecture/ui/shared/widgets/loading_widget.dart';
import 'package:flutter_app_architecture/ui/shared/widgets/screen_body_widget.dart';

class VanillaArchitectureScreen extends StatefulWidget {
  VanillaArchitectureScreen(this._userName, this._repository);
  final Repository _repository;
  final String _userName;

  @override
  State<StatefulWidget> createState() => _VanillaArchitectureScreenState();
}

class _VanillaArchitectureScreenState extends State<VanillaArchitectureScreen> {
  bool _isLoading = false;
  Profile _profile;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      widget._repository.getGitHubProfile(widget._userName).then((profile) {
        setState(() {
          _profile = profile;
          _isLoading = false;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vanilla'),
      ),
      body: SafeArea(
        child: _isLoading ? _buildLoading() : _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_profile != null) {
      return ScreenBodyWidget(_profile);
    } else {
      return LoadingWidget();
    }
  }

  Widget _buildLoading() {
    return LoadingWidget();
  }
}