import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'edit_tournament_match4th_widget.dart' show EditTournamentMatch4thWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditTournamentMatch4thModel
    extends FlutterFlowModel<EditTournamentMatch4thWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for lstEvents widget.
  int? lstEventsValue;
  FormFieldController<int>? lstEventsValueController;
  // State field(s) for txtMatchTime widget.
  FocusNode? txtMatchTimeFocusNode;
  TextEditingController? txtMatchTimeController;
  final txtMatchTimeMask = MaskTextInputFormatter(mask: '####-##-## ##:##');
  String? Function(BuildContext, String?)? txtMatchTimeControllerValidator;
  String? _txtMatchTimeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h89pbn8j' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for lstPlayer1 widget.
  int? lstPlayer1Value;
  FormFieldController<int>? lstPlayer1ValueController;
  // State field(s) for lstPlayer2 widget.
  int? lstPlayer2Value;
  FormFieldController<int>? lstPlayer2ValueController;
  // Stores action output result for [Backend Call - API (editPlanMatchAPI)] action in Button widget.
  ApiCallResponse? createMatchResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtMatchTimeControllerValidator = _txtMatchTimeControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    txtMatchTimeFocusNode?.dispose();
    txtMatchTimeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
