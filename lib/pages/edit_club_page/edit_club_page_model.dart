import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_club_page_widget.dart' show EditClubPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditClubPageModel extends FlutterFlowModel<EditClubPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtClubName widget.
  FocusNode? txtClubNameFocusNode;
  TextEditingController? txtClubNameController;
  String? Function(BuildContext, String?)? txtClubNameControllerValidator;
  // State field(s) for txtClubLocation widget.
  FocusNode? txtClubLocationFocusNode;
  TextEditingController? txtClubLocationController;
  String? Function(BuildContext, String?)? txtClubLocationControllerValidator;
  // State field(s) for txtClubContactPerson widget.
  FocusNode? txtClubContactPersonFocusNode;
  TextEditingController? txtClubContactPersonController;
  String? Function(BuildContext, String?)?
      txtClubContactPersonControllerValidator;
  // State field(s) for txtClubContactEmail widget.
  FocusNode? txtClubContactEmailFocusNode;
  TextEditingController? txtClubContactEmailController;
  String? Function(BuildContext, String?)?
      txtClubContactEmailControllerValidator;
  // Stores action output result for [Backend Call - API (editClubAPI)] action in Button widget.
  ApiCallResponse? apiResultp5y;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtClubNameFocusNode?.dispose();
    txtClubNameController?.dispose();

    txtClubLocationFocusNode?.dispose();
    txtClubLocationController?.dispose();

    txtClubContactPersonFocusNode?.dispose();
    txtClubContactPersonController?.dispose();

    txtClubContactEmailFocusNode?.dispose();
    txtClubContactEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
