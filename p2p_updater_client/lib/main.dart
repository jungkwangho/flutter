import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:p2p_updater_client/installed.dart';
import 'package:path_provider/path_provider.dart';
import 'package:p2p_updater_client/config.dart';

/*
1. 설정을 읽는다. (*)
2. 업데이트 대상 버전 목록을 구성한다.
3. 각 항목에 대해
  a) 업데이트 여부를 확인한다.
  b) 업데이트를 다운로드 한다.
  c) 업데이트를 실행한다.
  d) 실행결과를 report한다.
*/
const dummy_config = """{
  "servers":[
    {
      "ip": "127.0.0.1",
      "port": 8088
    }
  ],
  "update targets":[
    {
      "name": "nexess client",
      "versioned file": "/PROGRAMFILES/INITECH/INISAFE Nexess Client/STANDARD/IniNxClient.exe",
      "type": "package"
    }
  ],
  "use report": true
}""";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  runApp(MyApp(basepath: dir.path));
}

class MyApp extends StatefulWidget {
  MyApp({super.key, required this.basepath});

  late Config _config;
  late Installed _installed;
  final String basepath;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //
    _loadConfig();

    _constructTargetList();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
    );
  }

  void _loadConfig() {
    widget._config = Config.loadConfig(widget.basepath);
    widget._config.saveConfig(widget.basepath);
  }

  void _constructTargetList() {
    widget._installed = Installed(config: widget._config);
    widget._installed.construct();
  }
}
