import 'dart:async';

import 'package:flutter/services.dart';

class DeviceInfoLinux {
  /// Channel used to communicate to native code.
  static const MethodChannel _channel =
      const MethodChannel('device_info_linux');

  LinuxDeviceInfo _cachedLinuxDeviceInfo;

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<LinuxDeviceInfo> get linuxInfo async =>
      _cachedLinuxDeviceInfo ??= LinuxDeviceInfo._fromMap(
          await _channel.invokeMapMethod<String, dynamic>('linuxInfo'));
}

class LinuxDeviceInfo {
  LinuxDeviceInfo({
    this.memInfo,
    this.cpuInfo,
    this.architecture,
    this.hostname,
    this.kernel,
    this.os,
    this.iconName,
    this.chassis,
    this.machineId,
    this.bootId,
  });

  /// The current system hostname.
  final String hostname;

  /// The os of the system.
  final String os;

  /// The kernel version of the system.
  final String kernel;

  /// The architecture of the system.
  final String architecture;

  //// The name used by graphical applications to visualize the host.
  final String iconName;

  /// The chassis of the system.
  final String chassis;

  /// The machine-id of the system.
  final String machineId;

  /// The boot-id of the system.
  final String bootId;

  /// The memory information of the system using ` proc/meminfo `
  final MemInfo memInfo;

  /// The CPU configuration of the system using ` lspci `
  final CpuInfo cpuInfo;

  static LinuxDeviceInfo _fromMap(Map<String, dynamic> map) {
    print(map);
    return LinuxDeviceInfo(
      memInfo: MemInfo._fromMap(map['MemInfo']?.cast<String, dynamic>()),
      cpuInfo: CpuInfo._fromMap(map['CpuInfo']?.cast<String, dynamic>()),
      hostname: map["Static hostname"].toString().trim(),
      os: map['Operating System'].toString().trim(),
      kernel: map['Kernel'].toString().trim(),
      architecture: map['Architecture'].toString().trim(),
      iconName: map['Icon name'].toString().trim(),
      chassis: map['Chassis'].toString().trim(),
      machineId: map['Machine ID'].toString().trim(),
      bootId: map['Boot ID'].toString().trim(),
    );
  }
}

class MemInfo {
  MemInfo({
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
    this.shmemPmdMapped,
    this.fileHugePages,
    this.filePmdMapped,
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

  /// Total ram of the system
  final String memTotal;

  /// Free ram in the system.
  final String memFree;

  /// Available ram in the system.
  final String memAvailable;

  ///
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
  final String shmemPmdMapped;
  final String fileHugePages;
  final String filePmdMapped;
  final String hugePagesTotal;
  final String hugePagesFree;
  final String hugePagesRsvd;
  final String hugePagesSurp;
  final String hugePagesSize;
  final String hugeTlb;
  final String directMap4K;
  final String directMap2M;
  final String directMap1G;

  static MemInfo _fromMap(Map<String, dynamic> map) {
    return MemInfo(
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
      shmemPmdMapped: map['ShmemPmdMapped'],
      fileHugePages: map['FileHugePages'],
      filePmdMapped: map['FilePmdMapped'],
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

class CpuInfo {
  CpuInfo({
    this.hostBridge,
    this.pciBridge,
    this.vgaCompatibleController,
    this.signalProcessingController,
    this.usbController,
    this.ramMemory,
    this.networkController,
    this.communicationController,
    this.sataController,
    this.isaBridge,
    this.audioDevice,
    this.smBus,
    this.serialBusController,
    this.gpuController,
    this.ethernetController,
  });

  final String hostBridge;
  final String pciBridge;
  final String vgaCompatibleController;
  final String signalProcessingController;
  final String usbController;
  final String ramMemory;
  final String networkController;
  final String communicationController;
  final String sataController;
  final String isaBridge;
  final String audioDevice;
  final String smBus;
  final String serialBusController;
  final String gpuController;
  final String ethernetController;

  static CpuInfo _fromMap(Map<String, dynamic> map) {
    return CpuInfo(
      hostBridge: map["Host bridge"],
      pciBridge: map["PCI bridge"],
      vgaCompatibleController: map["VGA compatible controller"],
      signalProcessingController: map["Signal processing controller"],
      usbController: map["USB controller"],
      ramMemory: map["RAM memory"],
      networkController: map["Network controller"],
      communicationController: map["Communication controller"],
      sataController: map["SATA controller"],
      isaBridge: map["ISA bridge"],
      audioDevice: map["Audio device"],
      smBus: map["SMBus"],
      serialBusController: map["Serial bus controller [0c80]"],
      gpuController: map["3D controller"],
      ethernetController: map["Ethernet controller"],
    );
  }
}
