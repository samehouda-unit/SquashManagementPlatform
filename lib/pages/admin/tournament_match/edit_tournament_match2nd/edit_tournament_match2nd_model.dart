import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_tournament_match2nd_widget.dart' show EditTournamentMatch2ndWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EditTournamentMatch2ndModel
    extends FlutterFlowModel<EditTournamentMatch2ndWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  int? selectedTournamentPlan;

  String? selectedTournamentPlanPhoto = 'false';

  String? selectedPlanUuid = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for txtTournamentName widget.
  FocusNode? txtTournamentNameFocusNode;
  TextEditingController? txtTournamentNameController;
  String? Function(BuildContext, String?)? txtTournamentNameControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    txtTournamentNameFocusNode?.dispose();
    txtTournamentNameController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
