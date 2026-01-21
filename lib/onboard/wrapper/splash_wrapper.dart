import 'package:artsays_app/services/local_data_storage_service.dart';
import 'package:flutter/material.dart';

import '../screen/one_time_splash_screen.dart';
import '../screen/spalsh_screen.dart.dart';

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  bool? _isFirstLaunch, _isEarlierLogin;

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final bool firstLaunch = await getFirstLaunch();

    final bool isEarlierLogin = await getEarlierLogin();

    if (firstLaunch) {
      await setFirstLaunch(false);
    }

    if (mounted) {
      setState(() {
        _isFirstLaunch = firstLaunch;
        _isEarlierLogin = isEarlierLogin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstLaunch == null) {
      return const Scaffold(backgroundColor: Colors.black);
    }

    if (_isFirstLaunch!) {
      return const OneTimeSplashScreen();
    }

    return SplashScreen(
      showAnimation: true,
      isEarlierLoggedIn: _isEarlierLogin!,
    );
  }
}
