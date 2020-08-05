import 'dart:async';

import 'package:flutter/services.dart';

class DeviceInfoLinux {
  static const MethodChannel _channel =
      const MethodChannel('device_info_linux');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<LinuxDeviceInfo> get linuxInfo async {
    final LinuxDeviceInfo linuxDeviceInfo = LinuxDeviceInfo._fromMap(
        await _channel.invokeMapMethod<String, dynamic>('linuxInfo'));
    return linuxDeviceInfo;
  }
}

class LinuxDeviceInfo {
  final String memTotal;
  final String memFree;
  final String memAvailable;
  final String buffers;
  final String cached;
  final String swapCached;
  final String active;
  final String inactive;
  final String activeAnon;
  final String inactiveAnon;
  final String activeFile;
  final String inactiveFile;
  final String unevictable;
  final String mLocked;
  final String swapTotal;
  final String swapFree;
  final String dirty;
  final String writeBack;
  final String anonPages;
  final String mapped;
  final String shmem;
  final String kReclaimable;
  final String sLab;
  final String sReclaimable;
  final String sUnreclaim;
  final String kernelStack;
  final String pageTables;
  final String nfsUnstable;
  final String bounce;
  final String writeBackTmp;
  final String commitLimit;
  final String committedAs;
  final String vMallocTotal;
  final String vMallocUsed;
  final String vMallocChunk;
  final String perCpu;
  final String hardwareCorrupted;
  final String anonHugePages;
  final String shmemHugePages;
  final String shmemPmdPages;
  final String fileHugePages;
  final String filePmdPages;
  final String hugePagesTotal;
  final String hugePagesFree;
  final String hugePagesRsvd;
  final String hugePagesSurp;
  final String hugePagesSize;
  final String hugeTlb;
  final String directMap4K;
  final String directMap2M;
  final String directMap1G;

  LinuxDeviceInfo({
    this.memTotal,
    this.memFree,
    this.memAvailable,
    this.buffers,
    this.cached,
    this.swapCached,
    this.active,
    this.inactive,
    this.activeAnon,
    this.inactiveAnon,
    this.activeFile,
    this.inactiveFile,
    this.unevictable,
    this.mLocked,
    this.swapTotal,
    this.swapFree,
    this.dirty,
    this.writeBack,
    this.anonPages,
    this.mapped,
    this.shmem,
    this.kReclaimable,
    this.sLab,
    this.sReclaimable,
    this.sUnreclaim,
    this.kernelStack,
    this.pageTables,
    this.nfsUnstable,
    this.bounce,
    this.writeBackTmp,
    this.commitLimit,
    this.committedAs,
    this.vMallocTotal,
    this.vMallocUsed,
    this.vMallocChunk,
    this.perCpu,
    this.hardwareCorrupted,
    this.anonHugePages,
    this.shmemHugePages,
    this.shmemPmdPages,
    this.fileHugePages,
    this.filePmdPages,
    this.hugePagesTotal,
    this.hugePagesFree,
    this.hugePagesRsvd,
    this.hugePagesSurp,
    this.hugePagesSize,
    this.hugeTlb,
    this.directMap4K,
    this.directMap2M,
    this.directMap1G,
  });

  static LinuxDeviceInfo _fromMap(Map<String, dynamic> map) {
    return LinuxDeviceInfo(
      memTotal: map["MemTotal"],
      memFree: map['MemFree'],
      memAvailable: map['MemAvailable'],
      buffers: map['Buffers'],
      cached: map['Cached'],
      swapCached: map['SwapCached'],
      active: map['Active'],
      inactive: map['Inactive'],
      activeAnon: map['Active(anon)'],
      inactiveAnon: map['Inactive(anon)'],
      activeFile: map['Active(file)'],
      inactiveFile: map['Inactive(file)'],
      unevictable: map['Unevictable'],
      mLocked: map['Mlocked'],
      swapTotal: map['SwapTotal'],
      swapFree: map['SwapFree'],
      dirty: map['Dirty'],
      writeBack: map['Writeback'],
      anonPages: map['AnonPages'],
      mapped: map['Mapped'],
      shmem: map['Shmem'],
      kReclaimable: map['KReclaimable'],
      sLab: map['Slab'],
      sReclaimable: map['SReclaimable'],
      sUnreclaim: map['SUnreclaim'],
      kernelStack: map['KernelStack'],
      pageTables: map['PageTables'],
      nfsUnstable: map['NFS_Unstable'],
      bounce: map['Bounce'],
      writeBackTmp: map['WritebackTmp'],
      commitLimit: map['CommitLimit'],
      committedAs: map['Committed_AS'],
      vMallocTotal: map['VmallocTotal'],
      vMallocUsed: map['VmallocUsed'],
      vMallocChunk: map['VmallocChunk'],
      perCpu: map['Percpu'],
      hardwareCorrupted: map['HardwareCorrupted'],
      anonHugePages: map['AnonHugePages'],
      shmemHugePages: map['ShmemHugePages'],
      shmemPmdPages: map['ShmemPmdMapped'],
      fileHugePages: map['FileHugePages'],
      filePmdPages: map['FilePmdMapped'],
      hugePagesTotal: map['HugePages_Total'],
      hugePagesFree: map['HugePages_Free'],
      hugePagesRsvd: map['HugePages_Rsvd'],
      hugePagesSurp: map['HugePages_Surp'],
      hugePagesSize: map['Hugepagesize'],
      hugeTlb: map['Hugetlb'],
      directMap4K: map['DirectMap4k'],
      directMap2M: map['DirectMap2M'],
      directMap1G: map['DirectMap1G'],
    );
  }
}
