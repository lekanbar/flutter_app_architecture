import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/data/profile.dart';
import 'package:flutter_app_architecture/generated/i18n.dart';
import 'package:flutter_app_architecture/ui/shared/palette.dart';
import 'package:flutter_app_architecture/ui/shared/typography.dart';

import '../dimensions.dart';

class ScreenBodyWidget extends StatelessWidget {

  ScreenBodyWidget(this._profile);

  final Profile _profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(children: <Widget>[
        Center(
            child: Container(
              height: Dimensions.avatarImageSize,
              width: Dimensions.avatarImageSize,
              decoration: BoxDecoration(
                  border: Border.all(color: Palette.accentColor, width: 1.0),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_profile.avatarUrl))),
            )),
        SizedBox(height: Dimensions.n15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_profile.name.toUpperCase(), style: AppTypography().body,),
          ],
        ),
        SizedBox(height: Dimensions.n10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/username.png",
                height: Dimensions.iconSize),
            Text("@${_profile.username}", style: AppTypography().bodyNormal),
          ],
        ),
        SizedBox(height: Dimensions.n10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/location.png",
                height: Dimensions.iconSize),
            Text(_profile.location, style: AppTypography().bodyNormal),
          ],
        ),
        SizedBox(height: Dimensions.n10),
        SizedBox(height: Dimensions.n10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.current.bio, style: AppTypography().bodyLarge),
          ],
        ),
        SizedBox(height: Dimensions.n4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_profile.bio, style: AppTypography().bodyMediumItalic),
          ],
        ),
      ]),
    );
  }
}