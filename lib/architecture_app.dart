import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/generated/i18n.dart';
import 'package:flutter_app_architecture/ui/bloc/bloc_screen.dart';
import 'package:flutter_app_architecture/ui/scoped_model/scoped_model_screen.dart';
import 'package:flutter_app_architecture/ui/shared/dimensions.dart';
import 'package:flutter_app_architecture/ui/vanilla/vanilla_screen.dart';

import 'data/repository.dart';

class ArchitectureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Architecture Demo',
      home: HomePage(Repository()),
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback:
          S.delegate.resolution(fallback: new Locale("en", "")),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage(this._repository);

  final Repository _repository;

  @override
  State<StatefulWidget> createState() => _HomePageScreenState(_repository);
}

class _HomePageScreenState extends State<HomePage> {
  _HomePageScreenState(this._repository);

  final Repository _repository;
  final TextEditingController _textEditingController = TextEditingController();

  String error;
  int selectedArchitectureType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.flutter_app_architecture)
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.n16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: S.current.enter_user_name,
                  contentPadding: EdgeInsets.only(
                      left: Dimensions.n4,
                      right: Dimensions.n4,
                      bottom: Dimensions.n4,
                      top: Dimensions.n15),
                  errorText: error,
                ),
              ),
              Column(
                children: <Widget>[
                  RadioListTile(
                    title: Text(
                      S.current.vanilla,
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    value: 0,
                    groupValue: selectedArchitectureType,
                    onChanged: (value) {
                      _handleRadioValueChange(value);
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      S.current.bloc,
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    value: 1,
                    groupValue: selectedArchitectureType,
                    onChanged: (value) {
                      _handleRadioValueChange(value);
                    },
                  ),
                  RadioListTile(
                    title: Text(
                      S.current.scoped_model,
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    value: 2,
                    groupValue: selectedArchitectureType,
                    onChanged: (value) {
                      _handleRadioValueChange(value);
                    },
                  ),
                ],
              ),
              RaisedButton(
                child: Text(
                  S.current.search,
                ),
                onPressed: () {
                  if (!validateField()) openArchitectureType(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateField() {
    bool isEmpty = _textEditingController.value.text.isEmpty;

    setState(() {
      error = isEmpty ? S.current.error_user_name : null;
    });

    return isEmpty;
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      selectedArchitectureType = value;
    });
  }

  void openArchitectureType(BuildContext context) {
    switch (selectedArchitectureType) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocArchitectureScreen(
                _textEditingController.text, _repository),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScopedModelArchitectureScreen(
                _textEditingController.text, _repository),
          ),
        );
        break;
      case 0:
      default:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VanillaArchitectureScreen(
                _textEditingController.text, _repository),
          ),
        );
        break;
    }
  }
}
