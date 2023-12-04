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
  List<String> names,
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
            pw.Text('The Unit Invoice', style: pw.TextStyle(fontSize: 24)),
            pw.Text('Test List ' + names[0],
                textDirection: pw.TextDirection.rtl,
                style: pw.TextStyle(font: font, fontSize: 12)),
            pw.SizedBox(height: 20),
            pw.Text('Invoice No.: 00123'),
            pw.Text('Date: 2023-03-14'),
            pw.SizedBox(height: 20),
            pw.Text('Bill To Bahaa & Sameh:',
                style: pw.TextStyle(fontSize: 18)),
            pw.Text('John Doe'),
            pw.Text('123 Main Street'),
            pw.Text('City, State 12345'),
            pw.SizedBox(height: 20),
            pw.Text('Items:', style: pw.TextStyle(fontSize: 18)),
            pw.Container(
              child: pw.Table(
                children: [
                  for (var i = 0; i < names.length; i++)
                    pw.TableRow(
                      children: [
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(names[i],
                                  textDirection: pw.TextDirection.rtl,
                                  style:
                                      pw.TextStyle(font: font, fontSize: 12)),
                              pw.Divider(thickness: 1)
                            ]),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text('تجربة الخط',
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
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Subtotal:'),
                pw.Text('120'),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Tax (5%):'),
                pw.Text('6'),
              ],
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text('Total:'),
                pw.Text('126'),
              ],
            ),
          ],
        );
      },
    ),
  );

  final pdfSaved = await pdf.save();

  // PRINT IT
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfSaved);
}
