import 'package:demo_app/themes/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/services/profile_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ProfileService _profileService = ProfileService();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _profileService.getUserProfiles(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: CustomTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitPumpingHeart(
                  color: CustomTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        //
      },
    );
  }
}
