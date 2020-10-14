import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_text/pdf_text.dart';

class PdfViewer extends StatefulWidget {
  // const PdfViewer({this.urrl});
  // final String urrl;
  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  String urlPDFPath;
  int _actualPageNumber = 1, _allPagesCount = 0;
  bool isSampleDoc = true;
  PdfController _pdfController;
  String Name() {
    var rng = new Random();
    String val = "";
    for (var i = 0; i < 5; i++) {
      val = val + rng.nextInt(100).toString();
      // print(rng.nextInt(100));
    }
    return val;
  }

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + Name() + ".pdf");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error loading url pdf");
    }
  }

  void main() {}
  @override
  void initState() {
    super.initState();
    String urrl = "";
    WidgetsBinding.instance.addPostFrameCallback((_) {
      urrl = ModalRoute.of(context).settings.arguments;
      print(urrl);
      getFileFromUrl(urrl.toString()).then((f) {
        setState(() {
          urlPDFPath = f.path;
          _pdfController = PdfController(
            document: PdfDocument.openFile(urlPDFPath),
          );
        });
      });
    });

    // createFile().then((f) {
    //   setState(() {
    //     urlPDFPath = f.path;
    //     print(urlPDFPath);
    //   });
    // });
    _pdfController = PdfController(
      document: PdfDocument.openFile(urlPDFPath),
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  PDFDoc _pdfDoc;
  Future<String> _pickPDFText() async {
    PDFDoc doc = await PDFDoc.fromPath(urlPDFPath);
    PDFPage page = doc.pageAt(_actualPageNumber);
    String pageText = await page.text;
    setState(() {
      i = pageText;
      return pageText;
    });
  }

  String _text = "";
  String i = "0";
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
          appBar: AppBar(
            title: Text('PdfView example'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.navigate_before),
                onPressed: () {
                  _pdfController.previousPage(
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 100),
                  );
                },
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '$_actualPageNumber/$_allPagesCount',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () {
                  _pdfController.nextPage(
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 100),
                  );
                },
              ),
              // IconButton(
              //   icon: Icon(Icons.audiotrack),
              //   onPressed: () {
              //     setState(() {
              //       int ii = _pdfController.page;
              //       _pickPDFText();
              //       print(_pickPDFText());
              //     });
              //   },
              // ),
              // Text(i),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  if (isSampleDoc) {
                    _pdfController
                        .loadDocument(PdfDocument.openFile(urlPDFPath));
                  } else {
                    _pdfController
                        .loadDocument(PdfDocument.openFile(urlPDFPath));
                  }
                  isSampleDoc = !isSampleDoc;
                },
              )
            ],
          ),
          body: urlPDFPath == null
              ? Center(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Container(
                          margin: EdgeInsets.only(left: 10), child: Text("")),
                    ],
                  ),
                )
              : PdfView(
                  documentLoader: Center(child: CircularProgressIndicator()),
                  pageLoader: Center(child: CircularProgressIndicator()),
                  controller: _pdfController,
                  onDocumentLoaded: (document) {
                    setState(() {
                      _actualPageNumber = 1;
                      _allPagesCount = document.pagesCount;
                    });
                  },
                  onPageChanged: (page) {
                    setState(() {
                      _actualPageNumber = page;
                    });
                  },
                ),
        ),
      );
}
