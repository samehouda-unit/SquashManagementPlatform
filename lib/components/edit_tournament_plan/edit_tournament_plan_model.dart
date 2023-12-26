import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'edit_tournament_plan_widget.dart' show EditTournamentPlanWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditTournamentPlanModel
    extends FlutterFlowModel<EditTournamentPlanWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for txtTournamentPlanName widget.
  FocusNode? txtTournamentPlanNameFocusNode;
  TextEditingController? txtTournamentPlanNameController;
  String? Function(BuildContext, String?)?
      txtTournamentPlanNameControllerValidator;
  String? _txtTournamentPlanNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rf6sh44d' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lsClubsLocation widget.
  int? lsClubsLocationValue;
  FormFieldController<int>? lsClubsLocationValueController;
  // State field(s) for txtFromDate widget.
  FocusNode? txtFromDateFocusNode;
  TextEditingController? txtFromDateController;
  final txtFromDateMask = MaskTextInputFormatter(mask: '####-##-##');
  String? Function(BuildContext, String?)? txtFromDateControllerValidator;
  String? _txtFromDateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '67qr6o81' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for txtToDate widget.
  FocusNode? txtToDateFocusNode;
  TextEditingController? txtToDateController;
  final txtToDateMask = MaskTextInputFormatter(mask: '####-##-##');
  String? Function(BuildContext, String?)? txtToDateControllerValidator;
  String? _txtToDateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'si9w9y8c' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for lsGender widget.
  String? lsGenderValue;
  FormFieldController<String>? lsGenderValueController;
  // State field(s) for lstStages widget.
  int? lstStagesValue;
  FormFieldController<int>? lstStagesValueController;
  // Stores action output result for [Backend Call - API (editTournamentPlanAPI)] action in Button widget.
  ApiCallResponse? updateTPlanQuery;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtTournamentPlanNameControllerValidator =
        _txtTournamentPlanNameControllerValidator;
    txtFromDateControllerValidator = _txtFromDateControllerValidator;
    txtToDateControllerValidator = _txtToDateControllerValidator;
  }

  void dispose() {
    txtTournamentPlanNameFocusNode?.dispose();
    txtTournamentPlanNameController?.dispose();

    txtFromDateFocusNode?.dispose();
    txtFromDateController?.dispose();

    txtToDateFocusNode?.dispose();
    txtToDateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
