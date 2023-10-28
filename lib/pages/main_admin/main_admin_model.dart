import '/components/actions_clubs_widget.dart';
import '/components/actions_player_widget.dart';
import '/components/actions_tournaments_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'main_admin_widget.dart' show MainAdminWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MainAdminModel extends FlutterFlowModel<MainAdminWidget> {
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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    actionsPlayerModel = createModel(context, () => ActionsPlayerModel());
    actionsClubsModel = createModel(context, () => ActionsClubsModel());
    actionsTournamentsModel =
        createModel(context, () => ActionsTournamentsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    actionsPlayerModel.dispose();
    actionsClubsModel.dispose();
    actionsTournamentsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
