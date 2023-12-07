// import 'dart:html';
// import 'dart:io' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Album {
  final int status;
  final bool success;
  final String token;
  final String name;
  final String Udid;
  final String gender;
  final String? companyName;
  final String custId_coupon;
  final String dob;
  Album({
    required this.status,
    required this.success,
    required this.token,
    required this.name,
    required this.Udid,
    required this.gender,
    required this.companyName,
    required this.custId_coupon,
    required this.dob,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        status: json['status'],
        success: json['success'],
        token: json['token'],
        name: json['UserInfo']['customerName'],
        Udid: json['UserInfo']['customerUdid'],
        gender: json['UserInfo']['gender'],
        companyName: json['UserInfo']['companyName'] == null
            ? null
            : json['UserInfo']['companyName'],
        custId_coupon: json['UserInfo']['_id'],
        dob: json['UserInfo']['dob']);
  }
}

class Album2 {
  final int status;
  final bool success;
  final String message;

  Album2({required this.status, required this.success, required this.message});

  factory Album2.fromJson(Map<String, dynamic> json) {
    return Album2(
      status: json['status'],
      success: json['success'],
      message: json['message'],
    );
  }
}

Future<Object> createAlbum(
    String userId, String password, bool isPhoneNum) async {
  final response = await http.post(
    Uri.parse(
        'http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/api/auth/customer/login/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'userId': userId,
      'password': password,
      'isPhoneNum': isPhoneNum
    }),
  );

// Dispatch action depending upon
// the server response
  print('------------------');
  if (json.decode(response.body)['success']) {
    print(json.decode(response.body)['UserInfo']['companyName']);
    print(json.decode(response.body)['UserInfo']['companyName'] == null);
    return Album.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body));
    return Album2.fromJson(json.decode(response.body));
  }
}

Future<Object> createAlbum1(
    String userId, String password, bool isPhoneNum) async {
  final response = await http.post(
    Uri.parse(
        'http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer-auth/login/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'userId': userId,
      'password': password,
      'isPhoneNum': isPhoneNum
    }),
  );
  return json.decode(response.body);
}

class Album3 {
  final String message;
  final Object? couponDetails;

  Album3({required this.message, required this.couponDetails});

  factory Album3.fromJson(Map<String, dynamic> json) {
    print(json);
    return Album3(
        message: json['message'], couponDetails: json["couponDetails"]);
  }
}

Future<Album3> createAlbum56(
    String i,
    String id,
    String clientId,
    String batchNo,
    File? bill,
    Position? LOCATION,
    String postsale,
    String contactType) async {
  final response = http.MultipartRequest(
      'POST',
      Uri.parse(
          "http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer/claim-product"));

  //  final headers={"Content-type":"multipart/form-data; charset=UTF-8"};
  final headers = <String, String>{
    'Content-Type': 'multipart/form-data; charset=UTF-8',
  };

  response.fields['i'] = i;
  response.fields[contactType] = id;
  response.fields['codeType'] = 'postsale';
  response.fields['postsale'] = postsale; // new
  response.fields['clientId'] = clientId;
  response.fields['contactType'] = contactType; //new
  response.fields['batchNo'] = batchNo;
  response.fields['latitude'] = LOCATION!.latitude.toString();
  response.fields['longitude'] = LOCATION.longitude.toString();

  if (bill?.path == "") {
    response.fields['bill'] = "";
  } else {
    response.files.add(
      http.MultipartFile(
          'bill', bill!.readAsBytes().asStream(), bill.lengthSync(),
          filename: bill.path.split("/").last),
    );
  }
  response.headers.addAll(headers);
  final responsefinal = await response.send();
  var responseString = await responsefinal.stream.bytesToString();
  final decodedMap = json.decode(responseString);
  return Album3.fromJson(decodedMap);
}

class Album_reset {
  // final String message;
  final int status;
  Album_reset(
      {
      // required this.message,
      required this.status});

  factory Album_reset.fromJson(Map<String, dynamic> json) {
    return Album_reset(
        // message: json['message'],
        // status: json['status'],
        status: json["status"]);
  }
}

Future<Album_reset> createAlbum_reset(
    int i, bool isPhoneNo, String Number, String password) async {
  final response = await http.post(
    Uri.parse(
        'http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/api/auth/customer/forgot-password/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "isPhoneNo": isPhoneNo,
      "userIdentification": Number,
      "newPassword": password,
    }),
  );
  // print((response.statusCode));
  print(response.body);
  return Album_reset.fromJson(json.decode(response.body));
}

Future createAlbum_verify(String link, Position? LOCATION, String id,
    String establishmentname, String checklink) async {
  print("hello");
  final response = await http.post(
    Uri.parse(link),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: (checklink.length == 30 || checklink.length == 29)
        ? jsonEncode(<String, dynamic>{
            'latitude': LOCATION?.latitude,
            'longitude': LOCATION?.longitude,
            'contact': id,
            'establishmentName': establishmentname,
          })
        : jsonEncode(<String, dynamic>{
            'latitude': LOCATION?.latitude,
            'longitude': LOCATION?.longitude,
          }),
  );

  return response;
}

class Album_reupload {
  final String message;
  final String type;
  Album_reupload({required this.message, required this.type});

  factory Album_reupload.fromJson(Map<String, dynamic> json) {
    return Album_reupload(
      message: json['message'],
      type: json['type'],
    );
  }
}

Future<Album_reupload> createAlbum_reupload(String link, String ID,
    String codeType, String contactType, File? bill) async {
  final response = http.MultipartRequest(
      'POST',
      Uri.parse(
          "http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer/reupload-bill"));

  //  final headers={"Content-type":"multipart/form-data; charset=UTF-8"};
  final headers = <String, String>{
    'Content-Type': 'multipart/form-data; charset=UTF-8',
  };

  response.fields['contactType'] = contactType;
  print(response.fields['contactType']); //new
  response.fields[contactType] = ID;
  print('------------------');
  response.fields['codeType'] = codeType;
  print('------------------');
  response.fields[codeType] = link;
  print('------------------');
  if (bill?.path == "") {
    response.fields['bill'] = "";
  } else {
    response.files.add(
      http.MultipartFile(
          'bill', bill!.readAsBytes().asStream(), bill.lengthSync(),
          filename: bill.path.split("/").last),
    );
  }
  print(response.fields['bill']);
  response.headers.addAll(headers);
  final responsefinal = await response.send();
  var responseString = await responsefinal.stream.bytesToString();
  final decodedMap = json.decode(responseString);
  // print(json.decode(response.body));
  print("gggggggggggggggggggggggggg");

  print(Album_reupload.fromJson(decodedMap));
  print("gg2222222222222222222222222222");
  return Album_reupload.fromJson(decodedMap);
}

class Album_report {
  final String message;
  final String type;
  Album_report({required this.message, required this.type});

  factory Album_report.fromJson(Map<String, dynamic> json) {
    return Album_report(
      message: json['message'],
      type: json['type'],
    );
  }
}

Future<Album_report> createAlbum_report(
    String? reason,
    String id,
    String? preSaleCode,
    String Udid,
    Position? LOCATION,
    String batchNo,
    String comment,
    String postSaleCode,
    String? fakebill) async {
  final response = http.MultipartRequest(
      'POST',
      Uri.parse(
          "http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer/reportfake"));

  //  final headers={"Content-type":"multipart/form-data; charset=UTF-8"};
  final headers = <String, String>{
    'Content-Type': 'multipart/form-data; charset=UTF-8',
  };

  response.fields['reason'] = reason!;
  print(response.fields['reason']); //new
  response.fields['contact'] = id;

  response.fields['udid'] = Udid;

  response.fields['preSaleCode'] = preSaleCode!;
  response.fields['batchNo'] = batchNo;

  response.fields['latitude'] = LOCATION!.latitude.toString();
  response.fields['longitude'] = LOCATION.longitude.toString();
  response.fields['comment'] = comment;
  response.fields['postSaleCode'] = postSaleCode;
  if (fakebill != null) {
    final bill = File(fakebill);
    if (bill.path == "") {
      response.fields['fakebill'] = "";
    } else {
      response.files.add(
        http.MultipartFile(
            'fakebill', bill.readAsBytes().asStream(), bill.lengthSync(),
            filename: bill.path.split("/").last),
      );
    }
  }
//

//  print(response.fields['fakebill']);
  response.headers.addAll(headers);
  final responsefinal = await response.send();
  var responseString = await responsefinal.stream.bytesToString();
  final decodedMap = json.decode(responseString);
  // print(json.decode(response.body));
  print("gggggggggggggggggggggggggg");
  print(decodedMap);
  print(Album_report.fromJson(decodedMap));
  print("gg2222222222222222222222222222");
  return Album_report.fromJson(decodedMap);
}

Future createAlbum_decativate(
    String id, bool isPhoneNum, String password) async {
  final response = await http.post(
    Uri.parse(
        "http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer/hard-delete-customer-profile"),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "userId": id,
      "isPhoneNo": isPhoneNum,
      "customerPassword": password
    }),
  );
  return response;
}

class Album_notification {
  final String message;
  final String type;
  final List data;
  Album_notification(
      {required this.message, required this.type, required this.data});

  factory Album_notification.fromJson(Map<String, dynamic> json) {
    return Album_notification(
      message: json['message'],
      type: json['type'],
      data: json['data'],
    );
  }
  List<String> convert(List data) {
    List<String> list = [];
    for (int i = 0; i < data.length; i++) {
      String s = data[i]['batchNo'];
      s = s + ' ' + data[i]['expiryDate'];
      s = s + ' ' + data[i]['clientId'];
      s = s + ' ' + data[i]['Pimage'];
      s = s + ' ' + data[i]['qrid'];
      print(s);
      list.insert(i, s);
    }
    return list;
  }
}

Future<Album_notification> createAlbum_notification(
    String contactType, String id, String dateTime) async {
  final response = await http.post(
    Uri.parse(
        'http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer/expiryalert'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'contactType': contactType,
      contactType: id,
      'date': dateTime
    }),
  );
  print(json.decode(response.body));
  return Album_notification.fromJson(json.decode(response.body));
}

Future createAlbum_notificat_details(String batchNo, String clientId) async {
  final response = await http.post(
    Uri.parse(
        'http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer/productdetails'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body:
        jsonEncode(<String, dynamic>{'batchNo': batchNo, 'clientId': clientId}),
  );
  return response;
}

Future createAlbum_update_info(
  bool isUserNameUpdated,
  bool isGenderUpdated,
  bool isUserIdUpdated,
  bool isPasswordUpdated,
  bool isDobUpdated,
  bool isCompanyNameUpdated,
  bool isPhoneNo,
  String? name,
  String? gender,
  String oldId,
  String? newId,
  String curpass,
  String? newpass,
  String? companyName,
  String? dob,
) async {
  final response = await http.post(
      Uri.parse(
          'http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer/update-customer-profile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "fieldsStatusObj": {
          "isUserNameUpdated": isUserNameUpdated,
          "isGenderUpdated": isGenderUpdated,
          "isUserIdUpdated": isUserIdUpdated,
          "isPasswordUpdated": isPasswordUpdated,
          "isPhoneNo": isPhoneNo,
          "isDobUpdated": isDobUpdated,
          'isCompanyNameUpdated': isCompanyNameUpdated
        },
        "updatedFieldsData": {
          "userName": name,
          "gender": gender,
          "currUserId": oldId,
          "newUserId": newId,
          "currPassword": curpass,
          "newPassword": newpass,
          'companyName': companyName,
          "dob": dob
        },
      }));
  print({
    "fieldsStatusObj": {
      "isUserNameUpdated": isUserNameUpdated,
      "isGenderUpdated": isGenderUpdated,
      "isUserIdUpdated": isUserIdUpdated,
      "isPasswordUpdated": isPasswordUpdated,
      "isPhoneNo": isPhoneNo,
      "isDobUpdated": isDobUpdated,
      'isCompanyNameUpdated': isCompanyNameUpdated
    },
    "updatedFieldsData": {
      "userName": name,
      "gender": gender,
      "currUserId": oldId,
      "newUserId": newId,
      "currPassword": curpass,
      "newPassword": newpass,
      'companyName': companyName,
      "dob": dob
    }
  });
  print(dob);
  print(json.decode(response.body));
  return (response);
}

Future createAlbum_edit_info_password(
    String userId, String password, bool isPhoneNum) async {
  final response = await http.post(
    Uri.parse(
        'http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer-auth/verify-password'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'userId': userId,
      'password': password,
      'isPhoneNo': isPhoneNum
    }),
  );

  // the server response
  return response;
//  print(response.statusCode);
}

Future<Album_Warranty> createAlbum_Warranty(
    String contactType, String id, String dateTime) async {
  final response = await http.post(
    Uri.parse(
        'http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer/warrantyalert'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'contactType': contactType,
      contactType: id,
      'date': dateTime
    }),
  );

  print(json.decode(response.body));
  return Album_Warranty.fromJson(json.decode(response.body));
}

class Album_Warranty {
  final String message;
  final String type;
  final List data;
  Album_Warranty(
      {required this.message, required this.type, required this.data});

  factory Album_Warranty.fromJson(Map<String, dynamic> json) {
    return Album_Warranty(
      message: json['message'],
      type: json['type'],
      data: json['data'],
    );
  }
  List<String> convert(List data) {
    List<String> list = [];
    for (int i = 0; i < data.length; i++) {
      String s = data[i]['batchNo'];
      s = s + ' ' + data[i]['puchaseDate'];
      s = s + ' ' + data[i]['clientId'];
      s = s + ' ' + data[i]['Pimage'];
      s = s + ' ' + data[i]['warrantyPeriod'].toString();
      s = s + ' ' + data[i]['qrid'];
      print(s);
      list.insert(i, s);
    }
    return list;
  }
}
