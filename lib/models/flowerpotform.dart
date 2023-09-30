import 'dart:ui';

import 'flowerpots.dart';

class FlowerpotFormModel {
  final int id;
  final String selectedFlowerpot;
  final Color selectedColor;
  final int quantity;
  final bool hasLogo;
  final String? logoFilePath;
  final String? selectedEntityType;
  final String orderName;
  final String orderPhone;
  final String orderAddress;
  final String? orderNote;
  final bool? isUrgentDelivery;
  final String selectedSales;
  final String? discount;
  final int totalPrice;
  final String? createdAt;
  final String payments;
  final bool production;

  FlowerpotFormModel({
    required this.id,
    required this.selectedFlowerpot,
    required this.selectedColor,
    required this.quantity,
    required this.hasLogo,
    this.logoFilePath,
    this.selectedEntityType,
    required this.orderName,
    required this.orderPhone,
    required this.orderAddress,
    this.orderNote,
    this.isUrgentDelivery,
    required this.selectedSales,
    this.discount,
    required this.totalPrice,
     this.createdAt,
    required this.payments,
    required this.production,
  });

  factory FlowerpotFormModel.fromJson(Map<String, dynamic> json) {

   return FlowerpotFormModel(
      
      id: int.tryParse(json['id'] as String) ?? 0,
      selectedFlowerpot: json['flowerpot'] as String,
      selectedColor: Color(int.parse(json['color'] as String)),
      quantity: int.parse(json['quantity'] as String),
      hasLogo: json['logo'] == 'true',
      logoFilePath: json['logoFilePath'] as String?,
      selectedEntityType: json['entityType'] as String?,
      orderName: json['orderName'] as String,
      orderPhone: json['orderPhone'] as String,
      orderAddress: json['orderAddress'] as String,
      orderNote: json['orderNote'] as String?,
      isUrgentDelivery: json['UrgentDelivery'] == 'true',
      selectedSales: json['sales'] as String,
      discount: json['discount'] as String?,
      totalPrice: int.parse(json['totalPrice'] as String),
      createdAt: json['createdAt'],
      payments: json['payments'],
      production: json['production'] == 'true',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'flowerpot': selectedFlowerpot,
      'color': selectedColor.value,
      'quantity': quantity,
      'logo': hasLogo,
      'logoFilePath': logoFilePath,
      'entityType': selectedEntityType,
      'orderName': orderName,
      'orderPhone': orderPhone,
      'orderAddress': orderAddress,
      'orderNote': orderNote,
      'UrgentDelivery': isUrgentDelivery,
      'sales': selectedSales,
      'discount': discount,
      'totalPrice': totalPrice,
      'createdAt': createdAt,
      'payments': payments,
      'production': production,
    };
  }


}











