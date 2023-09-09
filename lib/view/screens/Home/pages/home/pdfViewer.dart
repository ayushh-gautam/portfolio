// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfViewerPage extends StatefulWidget {
  PdfViewerPage({
    Key? key,
    required this.pdf_Url,
  }) : super(key: key);
  final String pdf_Url;

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  @override
  Widget build(BuildContext context) {
    PDFDocument? document;
    void initdoc() async {
      document = await PDFDocument.fromURL(widget.pdf_Url);
    }

    @override
    void initState() {
      super.initState();
      initdoc();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: (document != null)
          ? PDFViewer(document: document!)
          : Center(child: CircularProgressIndicator()),
    );
  }
}
