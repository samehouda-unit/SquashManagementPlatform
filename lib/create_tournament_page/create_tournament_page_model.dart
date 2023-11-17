import '/backend/api_requests/api_calls.dart';
import '/components/create_tournament_plan_widget.dart';
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
  ///  Local state fields for this page.

  bool? tournamentCreated = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for txtTournamentName widget.
  FocusNode? txtTournamentNameFocusNode;
  TextEditingController? txtTournamentNameController;
  String? Function(BuildContext, String?)? txtTournamentNameControllerValidator;
  // Stores action output result for [Backend Call - API (createTournamentAPI)] action in Button widget.
  ApiCallResponse? apiResultp5y;
  // Model for CreateTournamentPlan component.
  late CreateTournamentPlanModel createTournamentPlanModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    createTournamentPlanModel =
        createModel(context, () => CreateTournamentPlanModel());
  }

  void dispose() {
    txtTournamentNameFocusNode?.dispose();
    txtTournamentNameController?.dispose();

    createTournamentPlanModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
