import 'package:bson/bson.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class Albumotpsend {
final String type;



Albumotpsend({required this.type,});

factory Albumotpsend.fromJson(Map<String, dynamic> json) {
	return Albumotpsend(
	type: json['type'],

	);
}
}
class Albumotpverify {
final String type;


Albumotpverify({required this.type});

factory Albumotpverify.fromJson(Map<String, dynamic> json) {
	return Albumotpverify(
	type: json['type'],
	);
}
}
class Albumotpsendforgotpwd {
final String type;


Albumotpsendforgotpwd({required this.type});

factory Albumotpsendforgotpwd.fromJAson(Map<String, dynamic> json) {
	return Albumotpsendforgotpwd(
	type: json['type'],
	);
}
}
class Albumotpverifyforgotpwd {
final String type;


Albumotpverifyforgotpwd({required this.type});

factory Albumotpverifyforgotpwd.fromJson(Map<String, dynamic> json) {
	return Albumotpverifyforgotpwd(
	type: json['type'],
	);
}
}


class AlbumotpsendforgotpwdEmail {
final String type;


AlbumotpsendforgotpwdEmail({required this.type});

factory AlbumotpsendforgotpwdEmail.fromJAson(Map<String, dynamic> json) {
	return AlbumotpsendforgotpwdEmail(
	type: json['type'],
	);
}
}

class AlbumotpverifyforgotpwdEmail {
final String type;


AlbumotpverifyforgotpwdEmail({required this.type});

factory AlbumotpverifyforgotpwdEmail.fromJson(Map<String, dynamic> json) {
	return AlbumotpverifyforgotpwdEmail(
	type: json['type'],
	);
}
}


class AlbumPhoneRegister{
final int status;
final String? custId_coupon;


  AlbumPhoneRegister({ required this.status ,required this.custId_coupon});

factory AlbumPhoneRegister.fromJson(Map<String, dynamic> json) {
	return AlbumPhoneRegister(
	status: json['status'],
  custId_coupon:json['UserInfo']?['customerUdid']

	);
}
}


class AlbumPurchaseHistory{
final String type;


AlbumPurchaseHistory({ required this.type});

factory AlbumPurchaseHistory.fromJson(Map<String, dynamic> json) {
	return AlbumPurchaseHistory(
	type: json['type'],
	);
}
}

Future<Albumotpsend> createAlbum10(String mobile) async {
final response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/otp/send'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, String>{
	'mobile': mobile,
  "type":"mobile"

  
	}),
);

// Dispatch action depending upon
// the server response

	return Albumotpsend.fromJson(json.decode(response.body));

}
Future<Albumotpsend> createAlbum101(String email) async {
final response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/otp/send'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, String>{
	'email': email,
  "type":"email"

  
	}),
);

// Dispatch action depending upon
// the server response

	return Albumotpsend.fromJson(json.decode(response.body));

}


Future<Albumotpverify> createAlbum3(String mobile,String otp) async {
final http.Response response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/otp/verify'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, String>{
	'mobile': mobile,
  'otp':otp,
  'type':"mobile"
  
	}),
);

// Dispatch action depending upon
// the server response
  print("before htting");
  print(json.decode(response.body));
  print("After htting");

	return Albumotpverify.fromJson(json.decode(response.body));

}
Future<Albumotpverify> createAlbum301(String email,String otp) async {
final http.Response response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/otp/verify'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, String>{
	'email': email,
  'otp':otp,
  'type':"email"
  
	}),
);

// Dispatch action depending upon
// the server response

	return Albumotpverify.fromJson(json.decode(response.body));

}

Future<Albumotpsendforgotpwd> createAlbum_otpSendforgotPWd(String mobile) async {
final response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/otp/send'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, String>{
	'mobile': mobile,
  "type":"mobile"
  
	}),
);

// Dispatch action depending upon
// the server response
 print(response.body);
	return Albumotpsendforgotpwd.fromJAson(json.decode(response.body));

}
Future<AlbumotpsendforgotpwdEmail> createAlbum_otpSendforgotPWdemdail(String mobile) async {
final response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/otp/send'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, String>{
	'email': mobile,
  "type":"email"
  
	}),
);

// Dispatch action depending upon
// the server response
 print(response.body);
	return AlbumotpsendforgotpwdEmail.fromJAson(json.decode(response.body));

}

Future<Albumotpverifyforgotpwd> createAlbum_otpverifyforgotpwd(String mobile,String otp) async {
final http.Response response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/otp/verify'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, String>{
	'mobile': mobile,
  'otp':otp,
  'type':"mobile"
  
	}),
);

// Dispatch action depending upon
// the server response

	return Albumotpverifyforgotpwd.fromJson(json.decode(response.body));

}



Future<AlbumotpverifyforgotpwdEmail> createAlbum_otpverifyforgotpwdEmail(String email,String otp) async {
final http.Response response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/otp/verify'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, String>{
	'email': email,
  'otp':otp,
  'type':"email"
  
	}),
);

// Dispatch action depending upon
// the server response

	return AlbumotpverifyforgotpwdEmail.fromJson(json.decode(response.body));

}


Future<AlbumPhoneRegister> createAlbum4(String Username,String CompanyName,String password,String gender,bool isPhone,String Phone,String uid,String dob )async {
final response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/api/auth/customer/register'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, dynamic>{
	'userName': Username,
  'password':password,
  'gender':gender,
  'isPhoneNo':isPhone,
  'phoneNum':Phone,
  'companyName':CompanyName,
  'customerUdid':uid,
  "country":"India",
  "dob":dob
  
  
	}),
);


// Dispatch action depending upon
// the server response
  print("before htting");
  try{
 var jsonobj = jsonDecode(response.body.toString());
}catch(e){
  print(e);
}
  print(json.decode(response.body.toString()));
  print("After htting");
  
	return AlbumPhoneRegister.fromJson(json.decode(response.body.toString()));
 
}
Future<AlbumPhoneRegister> createAlbum4_2(String Username,String password,String gender,bool isPhone,String Phone,String uid,String dob )async {
final response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/api/auth/customer/register'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, dynamic>{
	'userName': Username,
  'password':password,
  'gender':gender,
  'isPhoneNo':isPhone,
  'phoneNum':Phone,
  // 'companyName':CompanyName,
  'customerUdid':uid,
  "country":"India",
  "dob":dob
  
  
	}),
);


// Dispatch action depending upon
// the server response
  print("before htting");
  try{
 var jsonobj = jsonDecode(response.body.toString());
}catch(e){
  print(e);
}
  print(json.decode(response.body.toString()));
  print("After htting");
  
	return AlbumPhoneRegister.fromJson(json.decode(response.body.toString()));
 
}






Future<AlbumPhoneRegister> createAlbum401(String Username,String CompanyName,String password,String gender,bool isPhone,String Email,String uid ,String Country,String dob)async {
final response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/api/auth/customer/register'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, dynamic>{
	'userName': Username,
  'password':password,
  'gender':gender,
  'isPhoneNo':isPhone,
  'email':Email,
  'companyName':CompanyName,
  'customerUdid':uid,
  "country":Country,
  "dob":dob
  
  
	}),
);

// Dispatch action depending upon
// the server response
  print(json.decode(response.body));
  
	return AlbumPhoneRegister.fromJson(json.decode(response.body));
 
}
Future<AlbumPhoneRegister> createAlbum401_2(String Username,String password,String gender,bool isPhone,String Email,String uid ,String Country,String dob)async {
final response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/api/auth/customer/register'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, dynamic>{
	'userName': Username,
  'password':password,
  'gender':gender,
  'email':Email,
  'customerUdid':uid,
  "country":Country,
  'isPhoneNo':isPhone,
  
  // 'companyName':CompanyName,
  
  
  "dob":dob
  
  
	}),
);

// Dispatch action depending upon
// the server response
  print(json.decode(response.body));
  
	return AlbumPhoneRegister.fromJson(json.decode(response.body));
 
}
// Future<Album2> createAlbum5(String Username,String password,String gender,bool isPhone,String email )async {
// final response = await http.post(  
//   Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer-auth/register/'),
// 	headers: <String, String>{
// 	'Content-Type': 'application/json; charset=UTF-8',
// 	},
// 	body: jsonEncode(<String, dynamic>{
// 	'userName': Username,
//   'password':password,
//   'gender':gender,
//   'isPhoneNo':isPhone,
//   'email':email
  
// 	}),
// );

// // Dispatch action depending upon
// // the server response
//   print(json.decode(response.body));
// 	return Album2.fromJson(json.decode(response.body));
 
// }


Future createAlbumPurchaseHistoryDetailsMobile(String id,String ID)async {
final response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer/purchases'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, dynamic>{
	 "contactType":"mobile",
   "mobile":ID
  
	}),
);

// Dispatch action depending upon
// the server response
  // print(json.decode(response.body));
  
	return response;
 
}

Future createAlbumPurchaseHistoryDetailsEmail(String id,String ID)async {
final response = await http.post(  
  Uri.parse('http://ec2-13-235-124-84.ap-south-1.compute.amazonaws.com:3000/customer/purchases'),
	headers: <String, String>{
	'Content-Type': 'application/json; charset=UTF-8',
	},
	body: jsonEncode(<String, dynamic>{
	 "contactType":"email",
   "email":ID
  
	}),
);

// Dispatch action depending upon
// the server response
  // print(json.decode(response.body));
  
	return response;
 
}