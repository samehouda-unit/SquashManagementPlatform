// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:ui' as ui;
import 'package:flutter/material.dart' as material;
import 'dart:convert';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import '../../flutter_flow/upload_data.dart';

Future pdfMatches(
  BuildContext context,
  List<dynamic> records,
  String paramTournamentName,
  String paramTournamentPlanName,
) async {
  final pdf = pw.Document();
  final font = await PdfGoogleFonts.notoNaskhArabicRegular();

  // Get the current date/time
  final currentDateTime = DateTime.now();
  final formattedDateTime =
      DateFormat('yyyy-MM-dd HH:mm').format(currentDateTime);

  final logoNetworkImage = await networkImage(
      'https://xhohsggtqcqazqvokuat.supabase.co/storage/v1/object/public/SquashManagementPlatformBucket/PlayerPhoto/Squash.png');
  //print('Image loaded successfully! -- H: ${logoNetworkImage.height} , W: ${logoNetworkImage.width}');

  // Additional Logo Image (Nice , but costs more time to generate PDF)
  //final logoAppNetworkImage = await networkImage('https://xhohsggtqcqazqvokuat.supabase.co/storage/v1/object/public/SquashManagementPlatformBucket/PlayerPhoto/SquashPrintLogo-min.png');

  // Configurable variables
  final int recordsPerPage = 14;
  final int totalPages = (records.length / recordsPerPage).ceil();
  final int numberOfColumns = 4; // Set the number of columns
  final String tournamentName = paramTournamentName;
  final String tournamentPlanName = paramTournamentPlanName;
  final String titleText = ' كشـف مباريات بطولة ' +
      tournamentName +
      ' ' +
      ' لمرحلـة ' +
      tournamentPlanName; // Set the title text

  final List<List<String>> tableColumns = [
    ['Match Location', 'club_name'],
    ['Time', 'match_time'],
    ['Player I', 'player1_name'],
    ['Player II', 'player2_name'],
  ]; // Set the header titles and corresponding table column names

  for (var page = 0; page < totalPages; page++) {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header Section
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Image(logoNetworkImage, height: 100, width: 100),
                    ],
                  ),
                  /*
                  //Additional Logo Image
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Image(logoAppNetworkImage, height: 110, width: 110),
                    ],
                  ),
                  */
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Center(
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Text(
                              titleText,
                              textDirection: pw.TextDirection.rtl,
                              style: pw.TextStyle(
                                font: font,
                                fontSize: 18,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                      children: tableColumns
                          .map((column) => _buildHeaderColumn(column[0], font))
                          .toList(),
                    ),
                    for (var i = page * recordsPerPage;
                        i < ((page * recordsPerPage) + recordsPerPage) &&
                            i < records.length;
                        i++)
                      pw.TableRow(
                        children: List.generate(
                          numberOfColumns,
                          (index) => pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(
                                _formatValue(
                                    records[i][tableColumns[index][1]]),
                                textDirection: pw.TextDirection.rtl,
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 9,
                                ),
                              ),
                              pw.Divider(thickness: 1),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),

              // Footer Section
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text('Page ${page + 1} of $totalPages',
                        style: pw.TextStyle(font: font, fontSize: 9)),
                  ),
                  pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text(' | created on: $formattedDateTime',
                            style: pw.TextStyle(font: font, fontSize: 9)),
                      ],
                    ),
                  ),
                  // Add any additional information or elements you want in the footer
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  final pdfSaved = await pdf.save();

  // PRINT IT
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfSaved);
}

//######################### HELPER FUNCTIONS START ############################
// SAM Helper function to build header columns with bold text style
pw.Column _buildHeaderColumn(String text, pw.Font font) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.center,
    mainAxisAlignment: pw.MainAxisAlignment.center,
    children: [
      pw.Text(text,
          textDirection: pw.TextDirection.ltr,
          style: pw.TextStyle(
              font: font, fontSize: 12, fontWeight: pw.FontWeight.bold)),
      pw.Divider(thickness: 2),
    ],
  );
}

// SAM Helper function to format values showing in PDF
String _formatValue(dynamic value) {
  if (value is String && _isDateString(value)) {
    return _formatDateString(value);
  } else {
    return value.toString();
  }
}

String _formatDateString(String originalDate) {
  // Parse the original date string
  DateTime dateTime = DateTime.parse(originalDate);

  // Format the date string in the desired format
  String formattedDate =
      "${dateTime.year}-${_twoDigits(dateTime.month)}-${_twoDigits(dateTime.day)} ${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)}";

  return formattedDate;
}

bool _isDateString(String value) {
  try {
    // Try parsing the value as a date
    DateTime.parse(value);
    return true;
  } catch (e) {
    // Parsing failed, not a valid date
    return false;
  }
}

String _twoDigits(int n) {
  if (n >= 10) {
    return "$n";
  } else {
    return "0$n";
  }
}
//######################### HELPER FUNCTIONS END ############################
