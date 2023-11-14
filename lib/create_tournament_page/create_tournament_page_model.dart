import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_tournament_page_widget.dart' show CreateTournamentPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTournamentPageModel
    extends FlutterFlowModel<CreateTournamentPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtPlayerName widget.
  FocusNode? txtPlayerNameFocusNode;
  TextEditingController? txtPlayerNameController;
  String? Function(BuildContext, String?)? txtPlayerNameControllerValidator;
  // Stores action output result for [Backend Call - API (createTournamentAPI)] action in Button widget.
  ApiCallResponse? apiResultp5y;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtPlayerNameFocusNode?.dispose();
    txtPlayerNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
