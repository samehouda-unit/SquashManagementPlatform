// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Add these imports for header and footer modifications
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'dart:convert';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

import '../../flutter_flow/upload_data.dart';

Future pdfDynamicInvoiceDownload(
  BuildContext context,
  List<dynamic> records,
) async {
  final pdf = pw.Document();
  final font = await PdfGoogleFonts.notoNaskhArabicRegular();

  // Get the current date/time
  final currentDateTime = DateTime.now();
  final formattedDateTime =
      DateFormat('yyyy-MM-dd HH:mm:ss').format(currentDateTime);

  // Load the image asynchronously
  final ByteData data = await rootBundle.load('assets/Thumbnail_v2.png');
  final Uint8List bytes = data.buffer.asUint8List();

  int recordsPerPage = 14;
  int totalPages = (records.length / recordsPerPage).ceil();
  for (var page = 0; page < totalPages; page++)
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header Section
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Image(pw.MemoryImage(bytes), width: 50, height: 50),
                      pw.SizedBox(height: 10),
                      pw.Text('Report Title',
                          style: pw.TextStyle(
                              font: font,
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold)),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Date/Time: $formattedDateTime',
                          style: pw.TextStyle(font: font, fontSize: 12)),
                      // Add any additional information or elements you want in the header
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Table Section
              pw.Container(
                child: pw.Table(
                  children: [
                    pw.TableRow(
                      children: [
                        // Add header columns as Bold text
                        _buildHeaderColumn('Player Name', font),
                        _buildHeaderColumn('Club Name', font),
                        _buildHeaderColumn('Player Rank', font),
                        _buildHeaderColumn('Player Stages', font),
                      ],
                    ),
                    // ... (existing code for table rows)
                  ],
                ),
              ),
              pw.SizedBox(height: 20),

              // Footer Section
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Page ${page + 1} of $totalPages',
                      style: pw.TextStyle(font: font, fontSize: 12)),
                  // Add any additional information or elements you want in the footer
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

// Helper function to build header columns with bold text style
pw.Column _buildHeaderColumn(String text, pw.Font font) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    mainAxisAlignment: pw.MainAxisAlignment.center,
    children: [
      pw.Text(text,
          textDirection: pw.TextDirection.ltr,
          style: pw.TextStyle(
              font: font, fontSize: 12, fontWeight: pw.FontWeight.bold)),
      pw.Divider(thickness: 1),
    ],
  );
}
