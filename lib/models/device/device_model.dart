class DeviceModel {
  Data? data;
  Null? error;

  DeviceModel({this.data, this.error});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  int? uniqueId;
  VersionInfo? versionInfo;

  Data({this.uniqueId, this.versionInfo});

  Data.fromJson(Map<String, dynamic> json) {
    uniqueId = json['uniqueId'];
    versionInfo = json['versionInfo'] != null
        ? new VersionInfo.fromJson(json['versionInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uniqueId'] = this.uniqueId;
    if (this.versionInfo != null) {
      data['versionInfo'] = this.versionInfo!.toJson();
    }
    return data;
  }
}

class VersionInfo {
  int? id;
  String? deviceId;
  String? devicePlatform;
  int? currentVersion;
  int? lastCompulsoryVersion;
  String? locationPath;

  VersionInfo(
      {this.id,
      this.deviceId,
      this.devicePlatform,
      this.currentVersion,
      this.lastCompulsoryVersion,
      this.locationPath});

  VersionInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['deviceId'];
    devicePlatform = json['devicePlatform'];
    currentVersion = json['currentVersion'];
    lastCompulsoryVersion = json['lastCompulsoryVersion'];
    locationPath = json['locationPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['deviceId'] = this.deviceId;
    data['devicePlatform'] = this.devicePlatform;
    data['currentVersion'] = this.currentVersion;
    data['lastCompulsoryVersion'] = this.lastCompulsoryVersion;
    data['locationPath'] = this.locationPath;
    return data;
  }
}
