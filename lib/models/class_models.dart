import 'dart:core';


class InvalidResponse {
  String message = "";
}

class ClaimProd {
  String message = "";
  int i = 0;
  var details = new Map();
}

class GenuinePreSale {
  String message = "";
  var details = new Map();

}

class Fake {
  String message = "";
  String name = "";
  String image = "";
  String batchNo = "";
  String reason = "";
  String preSaleCode = "";
}

class Expired {
  String message = "";
  String prodName = "";
  String imageProd = "";
}

class ScanPreFirst {
  String message = "";
  var details = new Map();
}

class GenuinePostSale {
  String message = "";
  var details = new Map();
  String bill= "";
  String purchaseDate = "";
}

class ProductsDisplay {
  String serialNo = "";
  String brand = "";
  String Purchase_date = "";
  int price = 0;
  int duration = 0;
  String name = "";
  String imageProd = "";
}

class InfoQR{
  String message = "";
  var details = new Map();
}

class Details{
  var details = new Map();
  String bill ="";
}



class PurchaseHistoryDetails{

  var details=new Map();
}