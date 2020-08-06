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
      "hostname": build.hostname,
      "os": build.os,
      "architecture": build.architecture,
      "kernel": build.kernel,
      "iconName": build.iconName,
      "chassis":build.chassis,
      "machineId":build.machineId,
      "bootId":build.bootId,
      "memInfo.memTotal": build.memInfo.memTotal,
      "memInfo.memFree": build.memInfo.memFree,
      "memInfo.memAvailable": build.memInfo.memAvailable,
      "memInfo.buffers": build.memInfo.buffers,
      "memInfo.cached": build.memInfo.cached,
      "memInfo.swapCached": build.memInfo.swapCached,
      "memInfo.active": build.memInfo.active,
      "memInfo.inactive": build.memInfo.inactive,
      "memInfo.activeAnon": build.memInfo.activeAnon,
      "memInfo.inactiveAnon": build.memInfo.inactiveAnon,
      "memInfo.activeFile": build.memInfo.activeFile,
      "memInfo.inactiveFile": build.memInfo.inactiveFile,
      "memInfo.unevictable": build.memInfo.unevictable,
      "memInfo.mLocked": build.memInfo.mLocked,
      "memInfo.swapTotal": build.memInfo.swapTotal,
      "memInfo.swapFree": build.memInfo.swapFree,
      "memInfo.dirty": build.memInfo.dirty,
      "memInfo.writeBack": build.memInfo.writeBack,
      "memInfo.anonPages": build.memInfo.anonPages,
      "memInfo.mapped": build.memInfo.mapped,
      "memInfo.shmem": build.memInfo.shmem,
      "memInfo.kReclaimable": build.memInfo.kReclaimable,
      "memInfo.sLab": build.memInfo.sLab,
      "memInfo.sReclaimable": build.memInfo.sReclaimable,
      "memInfo.sUnreclaim": build.memInfo.sUnreclaim,
      "memInfo.kernelStack": build.memInfo.kernelStack,
      "memInfo.pageTables": build.memInfo.pageTables,
      "memInfo.nfsUnstable": build.memInfo.nfsUnstable,
      "memInfo.bounce": build.memInfo.bounce,
      "memInfo.writeBackTmp": build.memInfo.writeBackTmp,
      "memInfo.commitLimit": build.memInfo.commitLimit,
      "memInfo.committedAs": build.memInfo.committedAs,
      "memInfo.vMallocTotal": build.memInfo.vMallocTotal,
      "memInfo.vMallocUsed": build.memInfo.vMallocUsed,
      "memInfo.vMallocChunk": build.memInfo.vMallocChunk,
      "memInfo.perCpu": build.memInfo.perCpu,
      "memInfo.hardwareCorrupted": build.memInfo.hardwareCorrupted,
      "memInfo.anonHugePages": build.memInfo.anonHugePages,
      "memInfo.shmemHugePages": build.memInfo.shmemHugePages,
      "memInfo.shmemPmdPages": build.memInfo.shmemPmdPages,
      "memInfo.fileHugePages": build.memInfo.fileHugePages,
      "memInfo.filePmdPages": build.memInfo.filePmdPages,
      "memInfo.hugePagesTotal": build.memInfo.hugePagesTotal,
      "memInfo.hugePagesFree": build.memInfo.hugePagesFree,
      "memInfo.hugePagesRsvd": build.memInfo.hugePagesRsvd,
      "memInfo.hugePagesSurp": build.memInfo.hugePagesSurp,
      "memInfo.hugePagesSize": build.memInfo.hugePagesSize,
      "memInfo.hugeTlb": build.memInfo.hugeTlb,
      "memInfo.directMap4K": build.memInfo.directMap4K,
      "memInfo.directMap2M": build.memInfo.directMap2M,
      "memInfo.directMap1G": build.memInfo.directMap1G,
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
