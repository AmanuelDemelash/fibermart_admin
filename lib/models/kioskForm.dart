import 'dart:convert';

import 'package:flutter/material.dart';

class KioskOrderModel {
  final dynamic id;
  final String selectedKiosk;
  final Color? selectedColor;
  final int quantity;
  final String? useCase;
  final String requestingEntityType;
  final String orderName;
  final String orderPhone;
  final String orderAddress;
  final String? orderNote;
  final String selectedSales;
  final DateTime createdAt;
  final String payments;
  final bool production;

  KioskOrderModel({
    required this.id,
    required this.selectedKiosk,
    required this.selectedColor,
    required this.quantity,
    this.useCase,
    required this.requestingEntityType,
    required this.orderName,
    required this.orderPhone,
    required this.orderAddress,
    this.orderNote,
    required this.selectedSales,
    required this.createdAt,
    required this.payments,
    required this.production,
  });

  factory KioskOrderModel.fromJson(Map<String, dynamic> json) {
    return KioskOrderModel(
      id: json['id'],
      selectedKiosk: json['selectedkiosk'] as String,
      selectedColor: json['color'] != null ? Color(json['color'] as int) : null,
      quantity: int.parse(json['quantity']),
      useCase: json['useCase'] as String?,
      requestingEntityType: json['requestingEntityType'] as String,
      orderName: json['orderName'] as String,
      orderPhone: json['orderPhone'] as String,
      orderAddress: json['orderAddress'] as String,
      orderNote: json['orderNote'] as String?,
      selectedSales: json['selectedSales'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      payments: json['payments'] as String,
      production: bool.parse(json['production']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'selectedkiosk': selectedKiosk,
      'selectedColor': selectedColor != null ? selectedColor!.value : null,
      'quantity': quantity,
      'useCase': useCase,
      'requestingEntityType': requestingEntityType,
      'orderName': orderName,
      'orderPhone': orderPhone,
      'orderAddress': orderAddress,
      'orderNote': orderNote,
      'selectedSales': selectedSales,
      'createdAt': createdAt.toIso8601String(),
      'payments': payments,
      'production': production,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
