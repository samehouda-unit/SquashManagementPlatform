import '/components/list_players/list_players_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'players_plan_page_widget.dart' show PlayersPlanPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayersPlanPageModel extends FlutterFlowModel<PlayersPlanPageWidget> {
  ///  Local state fields for this page.

  int selectedPage = 2;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ListPlayers component.
  late ListPlayersModel listPlayersModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listPlayersModel = createModel(context, () => ListPlayersModel());
  }

  void dispose() {
    unfocusNode.dispose();
    listPlayersModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
