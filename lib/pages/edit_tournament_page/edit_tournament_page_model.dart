import '/backend/api_requests/api_calls.dart';
import '/components/edit_tournament_plan/edit_tournament_plan_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_tournament_page_widget.dart' show EditTournamentPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EditTournamentPageModel
    extends FlutterFlowModel<EditTournamentPageWidget> {
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
  // State field(s) for txtYear widget.
  FocusNode? txtYearFocusNode;
  TextEditingController? txtYearController;
  String? Function(BuildContext, String?)? txtYearControllerValidator;
  DateTime? datePicked;
  // State field(s) for txtSponsors widget.
  FocusNode? txtSponsorsFocusNode;
  TextEditingController? txtSponsorsController;
  String? Function(BuildContext, String?)? txtSponsorsControllerValidator;
  // Stores action output result for [Backend Call - API (editTournamentAPI)] action in Button widget.
  ApiCallResponse? apiResultp5y;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Backend Call - API (populateTournamentPlanByUuid)] action in IconButton widget.
  ApiCallResponse? tournamentPlanByUUID;
  // Model for EditTournamentPlan component.
  late EditTournamentPlanModel editTournamentPlanModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    editTournamentPlanModel =
        createModel(context, () => EditTournamentPlanModel());
  }

  void dispose() {
    unfocusNode.dispose();
    txtTournamentNameFocusNode?.dispose();
    txtTournamentNameController?.dispose();

    txtYearFocusNode?.dispose();
    txtYearController?.dispose();

    txtSponsorsFocusNode?.dispose();
    txtSponsorsController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();

    editTournamentPlanModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
