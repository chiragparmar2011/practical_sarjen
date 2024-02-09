import 'package:flutter/material.dart';
import 'package:practical_demo/model/data_model.dart';
import 'package:practical_demo/screens/pdf_viewr_screen.dart';
import 'package:practical_demo/services/api_service.dart';
import 'package:practical_demo/utilities/app_colors.dart';
import 'package:practical_demo/utilities/app_styles.dart';
import 'package:practical_demo/utilities/constant.dart';
import 'package:practical_demo/widgets/common_button.dart';
import 'package:practical_demo/widgets/common_data.dart';
import 'package:practical_demo/widgets/common_option.dart';
import 'package:practical_demo/widgets/custom_dialog.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  List<DataModel> dataModelList = [];
  List<DataModel> selectedVendors = [];
  bool isLoading = false;

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true;
    });
    List<DataModel> pendingList = await fetchData();
    setState(() {
      dataModelList = pendingList;
      isLoading = false;
    });
  }

  // Method for update selected vendors
  void _updateSelectedVendors(DataModel vendor, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedVendors.add(vendor);
      } else {
        selectedVendors.remove(vendor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appBarColor,
        title: const Text("Invoice Verification PDF"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_today)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      bottomNavigationBar: _buildBottomNavAction(),
      body: isLoading ? _buildLoader() : _buildMain(),
    );
  }

  Widget _buildLoader() {
    return Center(
      child: CircularProgressIndicator(color: AppColors.appBarColor),
    );
  }

  Widget _buildMain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: selectedVendors.length == dataModelList.length,
                onChanged: (val) {
                  setState(() {
                    selectedVendors.clear();
                    if (val!) {
                      selectedVendors.addAll(dataModelList);
                    }
                  });
                },
                activeColor: AppColors.appBarColor,
                side: BorderSide(width: 2, color: AppColors.appBarColor),
              ),
              Text(
                "Select All",
                style: TextStyles().textStyle16Black,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dataModelList.length,
              itemBuilder: (context, index) {
                final data = dataModelList[index];
                return Row(
                  children: [
                    _buildVendorView(data),
                    Constants.sizedBoxW4,
                    _buildOptions(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Method for vendor details view
  Widget _buildVendorView(DataModel data) {
    bool isChecked = selectedVendors.contains(data);
    return Expanded(
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: AppColors.appBarColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDealerName(data, isChecked),
              Text("Vendor", style: TextStyles().textStyle16Grey),
              Constants.sizedBoxH6,
              Text(data.vender, style: TextStyles().textStyle18Red),
              Constants.sizedBoxH6,
              _buildDetailWidgetOne(data),
              Constants.divider,
              _buildDetailWidgetTwo(data),
              Constants.divider,
              _buildDetailWidgetThree(data),
              Constants.divider,
              _buildDetailWidgetFour(data),
              Constants.sizedBoxH6,
              _buildDataTable(data),
              Constants.sizedBoxH6,
              Text("Last Approved", style: TextStyles().textStyle16DarkGrey),
              Constants.sizedBoxH6,
              Text(data.lastApproveby, style: TextStyles().textStyle16Black),
              Constants.sizedBoxH6,
              Text("Remark", style: TextStyles().textStyle16DarkGrey),
              Constants.sizedBoxH6,
              Text(data.remark, style: TextStyles().textStyle16Black),
              Constants.sizedBoxH6,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDealerName(DataModel data, bool isChecked) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            data.dealerName,
            style: TextStyles().textStyle22Red,
          ),
        ),
        Checkbox(
          value: isChecked,
          onChanged: (val) {
            _updateSelectedVendors(data, val ?? false);
          },
          activeColor: AppColors.appBarColor,
          side: BorderSide(width: 2, color: AppColors.appBarColor),
        ),
      ],
    );
  }

  Widget _buildDetailWidgetOne(DataModel data) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: CommonData(
              title: "Po Number",
              desc: data.poNumber.toString(),
            ),
          ),
          Constants.verticalDivider,
          Expanded(
            child: CommonData(
              title: "PO Date",
              desc: data.poDate.toString(),
            ),
          ),
          Constants.verticalDivider,
          Expanded(
            child: CommonData(
              title: "PO Receive Date",
              desc: data.poRecDate.toString(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailWidgetTwo(DataModel data) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: CommonData(title: "Invoice Number", desc: data.invoiceNo.toString())),
          Constants.verticalDivider,
          Expanded(child: CommonData(title: "Invoice Date", desc: data.invoiceDate.toString())),
        ],
      ),
    );
  }

  Widget _buildDetailWidgetThree(DataModel data) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: CommonData(
                title: "Dealer Creation Date",
                desc: data.survCreatedDate.toString()),
          ),
          Constants.verticalDivider,
          Expanded(
            child: CommonData(
                title: "PO Complaint Date", desc: data.workComplet.toString()),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailWidgetFour(DataModel data) {
    return const IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: CommonData(title: "Total Budget (₹)", desc: " 00.00")),
          Constants.verticalDivider,
          Expanded(child: CommonData(title: "Consumed Budget (₹)", desc: "0.00")),
        ],
      ),
    );
  }

  // Method for Vendor Table view
  Widget _buildDataTable(DataModel data) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowHeight: 28,
        border: TableBorder.all(),
        headingRowColor:
            MaterialStateColor.resolveWith((states) => AppColors.headerColor),
        columns: [
          DataColumn(
            label: Text('Type', style: TextStyles().textStyle16Black),
          ),
          DataColumn(
            label: Text('Line Item No', style: TextStyles().textStyle16Black),
          ),
          DataColumn(
            label: Text('H x W', style: TextStyles().textStyle16Black),
          ),
          DataColumn(
            label: Text('Sqft', style: TextStyles().textStyle16Black),
          ),
          DataColumn(
            label: Text('Amount(₹)', style: TextStyles().textStyle16Black),
          ),
          DataColumn(
            label: Text('Vendor Sqft', style: TextStyles().textStyle16Black),
          ),
          DataColumn(
            label: Text('Vendor Amt(₹)', style: TextStyles().textStyle16Black),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(
                Text(data.materialName,
                    style: TextStyles().textStyle16DarkGrey),
              ),
              DataCell(
                Text(data.poLineItem, style: TextStyles().textStyle16DarkGrey),
              ),
              DataCell(
                Text(data.size, style: TextStyles().textStyle16DarkGrey),
              ),
              DataCell(
                Text("${data.squareFeet}",
                    style: TextStyles().textStyle16DarkGrey),
              ),
              DataCell(
                Text("${data.amount.toDouble()}",
                    style: TextStyles().textStyle16DarkGrey),
              ),
              DataCell(
                Text("${data.vendorSquareFeet.toDouble()}",
                    style: TextStyles().textStyle16DarkGrey),
              ),
              DataCell(
                Text("${data.vendorAmount.toDouble()}",
                    style: TextStyles().textStyle16DarkGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Other options for open pdf file
  Widget _buildOptions() {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shadowColor: AppColors.colorGrey,
      child: Column(
        children: [
          CommonOption(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PDFViewerScreen()),
              );
            },
            icon: const Icon(Icons.dialpad_sharp),
          ),
          Constants.sizedBoxH10,
          CommonOption(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PDFViewerScreen()),
                );
              },
              icon: const Icon(Icons.image)),
          Constants.sizedBoxH10,
          CommonOption(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PDFViewerScreen()),
                );
              },
              icon: const Icon(Icons.file_present)),
          Constants.sizedBoxH10,
          CommonOption(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PDFViewerScreen()),
                );
              },
              icon: const Icon(Icons.view_sidebar)),
        ],
      ),
    );
  }

  Widget _buildBottomNavAction() {
    return Container(
      color: AppColors.appBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonButton(
            onPressed: () {
              CustomDialog.vendorStatusDialog(
                context: context,
                title: "Rejected Vendors",
                vendors: selectedVendors,
              );
            },
            title: "Reject",
          ),
          Constants.sizedBoxW10,
          CommonButton(
            onPressed: () {
              CustomDialog.vendorStatusDialog(
                context: context,
                title: "Selected Vendors",
                vendors: selectedVendors,
              );
            },
            title: "Approve",
          ),
        ],
      ),
    );
  }
}
