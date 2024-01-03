// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'dart:convert';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../flutter_flow/upload_data.dart';

Future pdfDynamicInvoiceDownload(
  BuildContext context,
  List<dynamic> records,
) async {
  final pdf = pw.Document();
  final font = await PdfGoogleFonts.iBMPlexSansArabicRegular();
  //final font2 = await PdfGoogleFonts.notoNaskhArabicRegular();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(height: 20),
            pw.Text('Date: 05-12-2023'),
            pw.SizedBox(height: 20),
            pw.SizedBox(height: 20),
            pw.Container(
              child: pw.Table(
                children: [
                  pw.TableRow(
                    children: [
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text('Player Name',
                                textDirection: pw.TextDirection.ltr,
                                style: pw.TextStyle(font: font, fontSize: 12)),
                            pw.Divider(thickness: 1)
                          ]),
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text('Club Name',
                                textDirection: pw.TextDirection.rtl,
                                style: pw.TextStyle(font: font, fontSize: 12)),
                            pw.Divider(thickness: 1)
                          ]),
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text('Player Rank',
                                textDirection: pw.TextDirection.rtl,
                                style: pw.TextStyle(font: font, fontSize: 12)),
                            pw.Divider(thickness: 1)
                          ]),
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text('Player Stage',
                                textDirection: pw.TextDirection.rtl,
                                style: pw.TextStyle(font: font, fontSize: 12)),
                            pw.Divider(thickness: 1)
                          ]),
                    ],
                  ),
                  for (var record in records)
                    pw.TableRow(
                      children: [
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(record['player_name'],
                                  textDirection: pw.TextDirection.rtl,
                                  style:
                                      pw.TextStyle(font: font, fontSize: 12)),
                              pw.Divider(thickness: 1)
                            ]),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(record['club_name'],
                                  textDirection: pw.TextDirection.rtl,
                                  style:
                                      pw.TextStyle(font: font, fontSize: 12)),
                              pw.Divider(thickness: 1)
                            ]),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(record['player_rank'],
                                  textDirection: pw.TextDirection.rtl,
                                  style:
                                      pw.TextStyle(font: font, fontSize: 12)),
                              pw.Divider(thickness: 1)
                            ]),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(record['player_stage'],
                                  textDirection: pw.TextDirection.rtl,
                                  style:
                                      pw.TextStyle(font: font, fontSize: 12)),
                              pw.Divider(thickness: 1)
                            ]),
                      ],
                    ),
                ],
              ),
            ),
            pw.SizedBox(height: 20),
          ],
        );
      },
    ),
  );

  final pdfSaved = await pdf.save();

  // PRINT IT
  //await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfSaved);
  //await Printing.sharePdf(bytes: await pdfSaved, filename: 'test-document.pdf');
  PdfPreview(
    build: (format) => pdf.save(),
    allowSharing: true,
    allowPrinting: true,
  );
}
