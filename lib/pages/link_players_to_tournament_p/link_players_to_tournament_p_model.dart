import '/components/list_players/list_players_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'link_players_to_tournament_p_widget.dart'
    show LinkPlayersToTournamentPWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LinkPlayersToTournamentPModel
    extends FlutterFlowModel<LinkPlayersToTournamentPWidget> {
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
