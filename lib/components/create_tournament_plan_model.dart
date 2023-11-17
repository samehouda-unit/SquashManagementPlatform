import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'create_tournament_plan_widget.dart' show CreateTournamentPlanWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class CreateTournamentPlanModel
    extends FlutterFlowModel<CreateTournamentPlanWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtTournamentPlanName widget.
  FocusNode? txtTournamentPlanNameFocusNode;
  TextEditingController? txtTournamentPlanNameController;
  String? Function(BuildContext, String?)?
      txtTournamentPlanNameControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtLocation widget.
  FocusNode? txtLocationFocusNode;
  TextEditingController? txtLocationController;
  String? Function(BuildContext, String?)? txtLocationControllerValidator;
  // State field(s) for txtSponsors widget.
  FocusNode? txtSponsorsFocusNode;
  TextEditingController? txtSponsorsController;
  String? Function(BuildContext, String?)? txtSponsorsControllerValidator;
  // State field(s) for txtFromDate widget.
  FocusNode? txtFromDateFocusNode;
  TextEditingController? txtFromDateController;
  final txtFromDateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? txtFromDateControllerValidator;
  DateTime? datePicked1;
  // State field(s) for txtToDate widget.
  FocusNode? txtToDateFocusNode;
  TextEditingController? txtToDateController;
  final txtToDateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? txtToDateControllerValidator;
  DateTime? datePicked2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtTournamentPlanNameFocusNode?.dispose();
    txtTournamentPlanNameController?.dispose();

    txtLocationFocusNode?.dispose();
    txtLocationController?.dispose();

    txtSponsorsFocusNode?.dispose();
    txtSponsorsController?.dispose();

    txtFromDateFocusNode?.dispose();
    txtFromDateController?.dispose();

    txtToDateFocusNode?.dispose();
    txtToDateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
