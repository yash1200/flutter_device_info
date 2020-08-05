import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_info_linux/device_info_linux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    Map<String, dynamic> _deviceDataLocal = <String, dynamic>{};
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _deviceDataLocal = _readLinuxDeviceInfo(await DeviceInfoLinux.linuxInfo);
    } on PlatformException {
      _deviceDataLocal = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _deviceData = _deviceDataLocal;
    });
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo build) {
    return <String, dynamic>{
      "memTotal": build.memTotal,
      "memFree": build.memFree,
      "memAvailable": build.memAvailable,
      "buffers": build.buffers,
      "cached": build.cached,
      "swapCached": build.swapCached,
      "active": build.active,
      "inactive": build.inactive,
      "activeAnon": build.activeAnon,
      "inactiveAnon": build.inactiveAnon,
      "activeFile": build.activeFile,
      "inactiveFile": build.inactiveFile,
      "unevictable": build.unevictable,
      "mLocked": build.mLocked,
      "swapTotal": build.swapTotal,
      "swapFree": build.swapFree,
      "dirty": build.dirty,
      "writeBack": build.writeBack,
      "anonPages": build.anonPages,
      "mapped": build.mapped,
      "shmem": build.shmem,
      "kReclaimable": build.kReclaimable,
      "sLab":build.sLab,
      "sReclaimable": build.sReclaimable,
      "sUnreclaim": build.sUnreclaim,
      "kernelStack": build.kernelStack,
      "pageTables": build.pageTables,
      "nfsUnstable": build.nfsUnstable,
      "bounce": build.bounce,
      "writeBackTmp": build.writeBackTmp,
      "commitLimit": build.commitLimit,
      "committedAs": build.committedAs,
      "vMallocTotal": build.vMallocTotal,
      "vMallocUsed": build.vMallocUsed,
      "vMallocChunk": build.vMallocChunk,
      "perCpu": build.perCpu,
      "hardwareCorrupted": build.hardwareCorrupted,
      "anonHugePages": build.anonHugePages,
      "shmemHugePages": build.shmemHugePages,
      "shmemPmdPages":build.shmemPmdPages,
      "fileHugePages": build.fileHugePages,
      "filePmdPages": build.filePmdPages,
      "hugePagesTotal": build.hugePagesTotal,
      "hugePagesFree": build.hugePagesFree,
      "hugePagesRsvd": build.hugePagesRsvd,
      "hugePagesSurp": build.hugePagesSurp,
      "hugePagesSize": build.hugePagesSize,
      "hugeTlb": build.hugeTlb,
      "directMap4K": build.directMap4K,
      "directMap2M": build.directMap2M,
      "directMap1G": build.directMap1G,
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Linux Device Info'),
        ),
        body: ListView(
          children: _deviceData.keys.map((String property) {
            return Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    property,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      '${_deviceData[property]}',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
