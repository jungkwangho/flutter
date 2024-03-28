import 'package:flutter/material.dart';
import 'package:p2p_updater_client/config.dart';

class InstalledFile {}

class Installed extends ChangeNotifier {
  Installed({required this.config});

  late List<InstalledFile> _targets;
  final Config config;

  void construct() {
    notifyListeners();
  }
}
