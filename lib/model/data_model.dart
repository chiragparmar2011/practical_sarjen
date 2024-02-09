class DataModel {
  final int positionNo;
  final String submitBy;
  final String lastApproveby;
  final int rid;
  final int poNumber;
  final String pono;
  final String poDate;
  final String sdCode;
  final String salesDesc;
  final String dealerCode;
  final String dealerName;
  final String deliveryAt;
  final String district;
  final String state;
  final String stateDesc;
  final String contactNo;
  final String delryDateive;
  final String vendorCode;
  final int cordinateNo;
  final String process;
  final String poLineItem;
  final String size;
  final String materialName;
  final double iRate;
  final String description;
  final String vender;
  final String poFile;
  final String invoiceNo;
  final String invoiceDate;
  final int iLevelId;
  final int approvalPositionNo;
  final int supPositionNo;
  final int designationNo;
  final String pOreceivedate;
  final String remark;
  final String invoicePath;
  final String workComplet;
  final int vendorAmount;
  final int vendorSquareFeet;
  final String poRecDate;
  final int amount;
  final int squareFeet;
  final String survCreatedDate;
  final dynamic approvalFlagnPositionNo;
  final String approvalFlag;

  DataModel({
    required this.positionNo,
    required this.submitBy,
    required this.lastApproveby,
    required this.rid,
    required this.poNumber,
    required this.pono,
    required this.poDate,
    required this.sdCode,
    required this.salesDesc,
    required this.dealerCode,
    required this.dealerName,
    required this.deliveryAt,
    required this.district,
    required this.state,
    required this.stateDesc,
    required this.contactNo,
    required this.delryDateive,
    required this.vendorCode,
    required this.cordinateNo,
    required this.process,
    required this.poLineItem,
    required this.size,
    required this.materialName,
    required this.iRate,
    required this.description,
    required this.vender,
    required this.poFile,
    required this.invoiceNo,
    required this.invoiceDate,
    required this.iLevelId,
    required this.approvalPositionNo,
    required this.supPositionNo,
    required this.designationNo,
    required this.pOreceivedate,
    required this.remark,
    required this.invoicePath,
    required this.workComplet,
    required this.vendorAmount,
    required this.vendorSquareFeet,
    required this.poRecDate,
    required this.amount,
    required this.squareFeet,
    required this.survCreatedDate,
    required this.approvalFlagnPositionNo,
    required this.approvalFlag,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      positionNo: json['positionNo'],
      submitBy: json['submitBy'],
      lastApproveby: json['lastApproveby'],
      rid: json['rid'],
      poNumber: json['poNumber'],
      pono: json['pono'],
      poDate: json['poDate'],
      sdCode: json['sdCode'],
      salesDesc: json['sales_Desc'],
      dealerCode: json['dealerCode'],
      dealerName: json['dealerName'],
      deliveryAt: json['deliveryAt'],
      district: json['district'],
      state: json['state'],
      stateDesc: json['state_Desc'],
      contactNo: json['contactNo'],
      delryDateive: json['delryDateive'],
      vendorCode: json['vendorCode'],
      cordinateNo: json['cordinateNo'],
      process: json['process'],
      poLineItem: json['poLineItem'],
      size: json['size'],
      materialName: json['materialName'],
      iRate: json['iRate'] is int
          ? (json['iRate'] as int).toDouble()
          : json['iRate'],
      description: json['description'],
      vender: json['vender'],
      poFile: json['poFile'],
      invoiceNo: json['invoiceNo'],
      invoiceDate: json['invoiceDate'],
      iLevelId: json['iLevelId'],
      approvalPositionNo: json['approvalPositionNo'],
      supPositionNo: json['supPositionNo'],
      designationNo: json['designationNo'],
      pOreceivedate: json['pOreceivedate'],
      remark: json['remark'],
      invoicePath: json['invoicePath'],
      workComplet: json['workComplet'],
      vendorAmount: json['vendorAmount'],
      vendorSquareFeet: json['vendorSquareFeet'],
      poRecDate: json['poRecDate'],
      amount: json['amount'],
      squareFeet: json['squareFeet'],
      survCreatedDate: json['survCreatedDate'],
      approvalFlagnPositionNo: json['approvalFlagnPositionNo'],
      approvalFlag: json['approvalFlag'],
    );
  }
}
