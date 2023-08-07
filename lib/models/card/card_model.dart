import 'package:homeworks/models/color/color_model.dart';

class BankModel {
  final int id;
  final String cardType;
  final String cardNumber;
  final String bankName;
  final double moneyAmount;
  final String cardCurrency;
  final String expiredDate;
  final String iconImage;
  final ColorsModel colors;

  BankModel({
    required this.id,
    required this.cardType,
    required this.cardNumber,
    required this.bankName,
    required this.moneyAmount,
    required this.cardCurrency,
    required this.expiredDate,
    required this.iconImage,
    required this.colors,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      id: json["id"] as int? ?? 0,
      cardType:  json["card_type"] as String? ?? "",
      cardNumber: json["card_number"] as String? ?? "",
      bankName: json["bank_name"] as String? ?? "",
      moneyAmount: json["money_amount"] as double? ?? 0,
      cardCurrency: json["card_currency"] as String? ?? "",
      expiredDate: json["expire_date"] as String? ?? "",
      iconImage: json["icon_image"] as String? ?? "",
      colors: ColorsModel.fromJson(json["colors"]),
    );
  }
}


// {
//  "id":1,
//  "card_type":"VISA",
// "card_number":"1234 5678 9101 3456",
//  "bank_name":"Hamkorbank",
// "money_amount":1200000.0,
// "card_currency":"SO'M",
// "expire_date":"2024-08-28 12:18:33.933384",
//  "icon_image":"https://assets.stickpng.com/images/58482363cef1014c0b5e49c1.png",
//  "colors":{
//  "color_a":"#3DD14A",
//  "color_b":"#ECD416"
// }
// },
