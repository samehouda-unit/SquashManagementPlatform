import '/components/actions_clubs/actions_clubs_widget.dart';
import '/components/actions_events/actions_events_widget.dart';
import '/components/actions_matches/actions_matches_widget.dart';
import '/components/actions_others/actions_others_widget.dart';
import '/components/actions_player/actions_player_widget.dart';
import '/components/actions_tournaments/actions_tournaments_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/template_components/side_nav/side_nav_widget.dart';
import 'main_admin_widget.dart' show MainAdminWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MainAdminModel extends FlutterFlowModel<MainAdminWidget> {
  ///  Local state fields for this page.

  int actionsPlayerHeight = 80;

  int actionsClubHeight = 80;

  int actionsTournamentHeight = 80;

  int? actionsEventsHeight = 80;

  int? actionsMatchesHeight = 80;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // Model for ActionsPlayer component.
  late ActionsPlayerModel actionsPlayerModel;
  // Model for ActionsClubs component.
  late ActionsClubsModel actionsClubsModel;
  // Model for ActionsTournaments component.
  late ActionsTournamentsModel actionsTournamentsModel;
  // Model for ActionsEvents component.
  late ActionsEventsModel actionsEventsModel;
  // Model for ActionsMatches component.
  late ActionsMatchesModel actionsMatchesModel;
  // Model for ActionsOthers component.
  late ActionsOthersModel actionsOthersModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    actionsPlayerModel = createModel(context, () => ActionsPlayerModel());
    actionsClubsModel = createModel(context, () => ActionsClubsModel());
    actionsTournamentsModel =
        createModel(context, () => ActionsTournamentsModel());
    actionsEventsModel = createModel(context, () => ActionsEventsModel());
    actionsMatchesModel = createModel(context, () => ActionsMatchesModel());
    actionsOthersModel = createModel(context, () => ActionsOthersModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    actionsPlayerModel.dispose();
    actionsClubsModel.dispose();
    actionsTournamentsModel.dispose();
    actionsEventsModel.dispose();
    actionsMatchesModel.dispose();
    actionsOthersModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
