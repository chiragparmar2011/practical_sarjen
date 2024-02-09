import 'package:flutter/material.dart';
import 'package:practical_demo/utilities/app_colors.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerScreen extends StatefulWidget {
  const PDFViewerScreen({super.key});

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          'PDF View',
        ),
      ),
      body: Center(
        child: SfPdfViewer.asset(
          'assets/pdf/sample.pdf',
          canShowPaginationDialog: true,
          pageSpacing: 2.0,
        ),
      ),
    );
  }
}
