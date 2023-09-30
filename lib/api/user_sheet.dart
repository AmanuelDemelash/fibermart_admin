import 'dart:io';

import 'package:gsheets/gsheets.dart';
import '../models/bussiness_types.dart';
import '../models/flowerpotform.dart';
import '../models/flowerpots.dart';
import '../models/kiosk.dart';
import '../models/kioskForm.dart';
import '../models/sales.dart';


class UserSheet {
  static const _creedentials = r'''
{
  "type": "service_account",
  "project_id": "doctor-9b1dc",
  "private_key_id": "4f27da99528febafe265bb5e2d6ff3c740cc6848",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCMPS0EN/uw0HSH\n7byS6Rr3SYu9jsgh1oQfJuSqjuKpxR/eT54Ua9Fdu4Z+t21SwiXc3vz/Y0lGUiF5\ngUU3ePBE0eh32eFYRU7kOeMmKBxJTz8lfEZNDgRUapzby6eusG8MNNI/dPtLgzEW\nRXQExUAtCaqqXm4rDbp1X4r8kcHPQvoLXjAihGIeqOt6xJJc6HKYm9AvSocz4/Ay\nTxyRlgPSARpUQfteEwiknZyjzZwYY1xN07mIEZH7QXI3hoicYbmKbZthmHH/+Z+j\n+gI5lRyAD5MtoR7V6+/ic0y0+grhs5/VHEQCUNwHMmSUuQu1lS9G8BEbrTDi2Raq\nZi7NLOVxAgMBAAECggEABTVv0BnM4TmE3S2b1PBlM4J0TG3wCgMKijuqv5j/WziP\n9p+0v+PB9X4gazbLOoktLdchxNHpEqcR8441G2/Zq2def+EZqRUomSUl8Nte3Zbc\nwhArw53ofu2CIPnJ+HI41au6lBJ3aPZuTXpL6lzHMEUNJTciVrqzo7tmO/ulRq+T\nPpo2CpNTd3vo7tKsHfoA9enuFcUW6dFBVFR+ruBUWziLEPqTny/vAdpxvxlI2hJx\nBXea4j4ZgZsAq7o/JZCbngrhDXlLX5Bt1WfmTTMNp60NieYIkhKC6q1qS+9TbR+k\nNOy0pF+JTWpl2aO7omQS87K4CCoqjOucXTNCj2s7ZwKBgQDDhGmkgAJRTrf8n/Q/\nLByg9CdZFZ3hsy6GbyoDuf/5+YjDVXLk8jMownhA8mRcD3lJQSl/VsFZGeEN6RSE\nwInazxrdgKkPcbq96iKivMYojt6PMz0jNAKY+UL4UkVndy1ikZBym1eLKzrqJbCK\nsINFipuwn5r6VoG5MgWdaRCO+wKBgQC3nx0krcZwXHXku+aBJsrYDIOcGVKwlyUE\nfh6gsxdI6CsdgBmJd2/0Kx8AoRbNbsZye5r+UIzp8lfKnLM7vbhwtWqj5lUVGH6A\nowexr0CfEFW28lHqIM6uIQ0rs2SMgxMGx3SWBpo06CC2N/fgPNulA4vh1nqAQ004\nrkfyy1JBgwKBgD4AjLvk+Fcufnw3gW5TH9UO+Ddw+ntrpjJtqEY8QufT8UH4pBHk\nmMKxQQ9fjuH+6jiH2JAQRApsgYk2xBIBOPZRvTRHK9XA/DZjvI4dDT4paHzDA/1Y\n7gXy7gDvniDck2DxxnwBtTZmBC3iu+SPa2GvPgY55xzCOCsxqMQtYFnnAoGACf/n\nRWUVRm8ymGdHMUdcipF75VdXsng4strvbg7yuKy0FGIygdL4TNLAWHdtV3it4/Qp\nR6o5UlA5SbZo6Fr3nWOz0AMuJPz1fqniNGH34fGwyUq+/UIWH1N7dSLK2gAVXCwm\nhDkN0s3FYkb//70wtPbRelYEy9FedjS/hFBgRWMCgYB0uP1OzsZMGzu19omC/HGq\nbsGGYNyNFhP9JSQiXexy7l8dwygz24coind2kCupMfa6G6PjrX+lde52kTGq7C7m\nF/yl/AuOaF1f5VAN36UrYNcXKTPF70f1nsswn8HYuQSmgah1KquDfAiCMrrKN7QT\nA1uCZ4EbwnZ9VqrhU/o+aQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "fibermart@doctor-9b1dc.iam.gserviceaccount.com",
  "client_id": "118002388003123976099",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fibermart%40doctor-9b1dc.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';
  // api= "AIzaSyDALUAb4_X3UFbExXpiNtWLpVmo-KEwHkI";

  static const _spreadsheetID = "1NTDsdMFAEiBMi5VmMUVpSaRzJUnxT2ig_ur4-Qukhy4";
  static Worksheet? _flowerpotSheet;
  static Worksheet? _salesSheet;
  static Worksheet? _postFPOrders;
  static Worksheet? _customerTypes;
  static Worksheet? _kioskList;
  static Worksheet? _postKioskOrders;


  static final _gSheets = GSheets(_creedentials);

  static Future init() async {
    final spreadsheet = await _gSheets.spreadsheet(_spreadsheetID);
    _flowerpotSheet = await _getWorkSheet(spreadsheet, title: "Flowerpots");
    _salesSheet = await _getWorkSheet(spreadsheet, title: "Sales-Team");
    _postFPOrders = await _getWorkSheet(spreadsheet, title: "Flowerpots-Orders");
    _customerTypes = await _getWorkSheet(spreadsheet, title: "Customer-Types");
    _kioskList = await _getWorkSheet(spreadsheet, title: "Kiosk-List");
    _postKioskOrders = await _getWorkSheet(spreadsheet, title: "Kiosk-Orders");

  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
     return spreadsheet.worksheetByTitle(title)!;
    } catch (e) {
       return await spreadsheet.addWorksheet(title);
    }
  }

static Future<List<FlowerpotFormModel>?> getordersList() async {
  if (_postFPOrders == null) return null;

  final json = await _postFPOrders!.values.map.allRows();
  if (json == null) return null;

  List<FlowerpotFormModel> flowerpotList = json.map((item) => FlowerpotFormModel.fromJson(item)).toList();
  return flowerpotList;
}


static Future<List<Flowerpot>?> getFPList() async {
  if (_flowerpotSheet == null) return null;

  final json = await _flowerpotSheet!.values.map.allRows();
  if (json == null) return null;

  List<Flowerpot> flowerpotList = json.map((item) => Flowerpot.fromJson(item)).toList();
  return flowerpotList;
}

static Future<List<KioskModel>?> getKioskList() async {
  if (_kioskList == null) return null;

  final json = await _kioskList!.values.map.allRows();
  if (json == null) return null;

  List<KioskModel> kioskList = json.map((item) => KioskModel.fromJson(item)).toList();
  return kioskList;
}

static Future<List<SalesTeam>?> getSalesList() async {
  if (_salesSheet == null) return null;
  

  final json = await _salesSheet!.values.map.allRows();
  if (json == null) return null;

  List<SalesTeam> salesList = json.map((item) => SalesTeam.fromJson(item)).toList();
  return salesList;
}

static Future<List<CustomerTypes>?> getCustomerTypes() async {
  if (_customerTypes == null) return null;
  

  final json = await _customerTypes!.values.map.allRows();
  if (json == null) return null;

  List<CustomerTypes> customertypes = json.map((item) => CustomerTypes.fromJson(item)).toList();
  return customertypes;
}

static Future<int> getFPRowCount() async  {
  if (_postFPOrders == null) return 0;
   final lastRow = await _postFPOrders!.values.lastRow();
   return lastRow == null ? 0 : int.tryParse(lastRow.first)?? 0;
}

static Future<int> getKioskRowCount() async  {
  if (_postKioskOrders == null) return 0;
   final lastRow = await _postKioskOrders!.values.lastRow();
   return lastRow == null ? 0 : int.tryParse(lastRow.first)?? 0;
}                             
  

static Future<FlowerpotFormModel> postFPOrder(FlowerpotFormModel order) async {

  
  final rowValuess = {
    'id': order.id,
    'flowerpot': order.selectedFlowerpot,
    'color': order.selectedColor.value.toString(),
    'quantity': order.quantity,
    'logo': order.hasLogo,
    'logoFilePath': order.logoFilePath,
    'entityType': order.selectedEntityType,
    'orderName': order.orderName,
    'orderPhone': order.orderPhone,
    'orderAddress': order.orderAddress,
    'orderNote': order.orderNote,
    'UrgentDelivery': order.isUrgentDelivery,
    'sales': order.selectedSales,
    'discount': order.discount,
    'totalPrice': order.totalPrice,
    'createdAt': order.createdAt,
    'payments': order.payments,
    'production': order.production
  };

    try {
    await _postFPOrders!.values.map.appendRow(rowValuess);
    return order;
  } catch (e) {
    // Handle any exceptions that occurred during row insertion
    throw Exception('Failed to post the order: $e');
  }
}



static Future<KioskOrderModel> postKioskOrder(KioskOrderModel order) async {

  
final rowValues = {
  'id': order.id,
  'kiosk': order.selectedKiosk.toString(),
  'color': order.selectedColor.value,
  'quantity': order.quantity,
  'useCase': order.useCase,
  'requestingEntityType': order.requestingEntityType,
  'orderName': order.orderName,
  'orderPhone': order.orderPhone,
  'orderAddress': order.orderAddress,
  'orderNote': order.orderNote,
  'sales': order.selectedSales,
  'createdAt': order.createdAt,
  'payments': order.payments,
  'production': order.production,
};

    try {
    await _postKioskOrders!.values.map.appendRow(rowValues);
    return order;
  } catch (e) {
    // Handle any exceptions that occurred during row insertion
    throw Exception('Failed to post the order: $e');
  }
}



  // static Future<String?> uploadImage(File file) async {
  //   try {
  //     FirebaseStorage storage = FirebaseStorage.instance;
  //     Reference storageRef = storage.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');
  //
  //     // Upload the file to Firebase Cloud Storage
  //     UploadTask uploadTask = storageRef.putFile(file);
  //     TaskSnapshot snapshot = await uploadTask;
  //
  //     // Get the download URL of the uploaded image
  //     String downloadUrl = await snapshot.ref.getDownloadURL();
  //
  //     return downloadUrl;
  //   } catch (e) {
  //     // Handle any errors that occurred during image upload
  //     print('Failed to upload image: $e');
  //     return null;
  //   }
  // }



}
