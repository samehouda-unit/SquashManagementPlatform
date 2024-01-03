import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_tournament_event3rd_widget.dart'
    show CreateTournamentEvent3rdWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CreateTournamentEvent3rdModel
    extends FlutterFlowModel<CreateTournamentEvent3rdWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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
        '5i4kzmgg' /* Field is required */,
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
        'zdyvjavw' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked2;
  // Stores action output result for [Backend Call - API (createTournamentPlanEventAPI)] action in Button widget.
  ApiCallResponse? createEventResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtFromDateControllerValidator = _txtFromDateControllerValidator;
    txtToDateControllerValidator = _txtToDateControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    txtFromDateFocusNode?.dispose();
    txtFromDateController?.dispose();

    txtToDateFocusNode?.dispose();
    txtToDateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
