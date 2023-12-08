import '/backend/api_requests/api_calls.dart';
import '/components/edit_tournament_plan/edit_tournament_plan_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'edit_tournament_page_model.dart';
export 'edit_tournament_page_model.dart';

class EditTournamentPageWidget extends StatefulWidget {
  const EditTournamentPageWidget({
    Key? key,
    required this.tournamentUuid,
  }) : super(key: key);

  final String? tournamentUuid;

  @override
  _EditTournamentPageWidgetState createState() =>
      _EditTournamentPageWidgetState();
}

class _EditTournamentPageWidgetState extends State<EditTournamentPageWidget> {
  late EditTournamentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTournamentPageModel());

    _model.txtTournamentNameFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: SquashManagementAPIGroupGroup.populateTournamentByUuidCall.call(
        uuid: 'eq.${widget.tournamentUuid}',
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final editTournamentPagePopulateTournamentByUuidResponse =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                context.pop();
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Edit tournament',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                  titlePadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                ),
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: _model.selectedTournamentPlan == null,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 30.0, 20.0, 15.0),
                                      child: TextFormField(
                                        controller: _model
                                                .txtTournamentNameController ??=
                                            TextEditingController(
                                          text: SquashManagementAPIGroupGroup
                                              .populateTournamentByUuidCall
                                              .name(
                                                editTournamentPagePopulateTournamentByUuidResponse
                                                    .jsonBody,
                                              )
                                              .toString(),
                                        ),
                                        focusNode:
                                            _model.txtTournamentNameFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.txtTournamentNameController',
                                          Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        textCapitalization:
                                            TextCapitalization.words,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Tournament Name',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 24.0),
                                          suffixIcon: _model
                                                  .txtTournamentNameController!
                                                  .text
                                                  .isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model
                                                        .txtTournamentNameController
                                                        ?.clear();
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: Color(0xFF757575),
                                                    size: 22.0,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .txtTournamentNameControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.05),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          _model.apiResultp5y =
                                              await SquashManagementAPIGroupGroup
                                                  .editTournamentAPICall
                                                  .call(
                                            name: _model
                                                .txtTournamentNameController
                                                .text,
                                            uuid: widget.tournamentUuid,
                                          );
                                          if ((_model.apiResultp5y?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'Tournament has been updated successfully'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'Error while editing Tournament'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          setState(() {});
                                        },
                                        text: 'Update',
                                        icon: Icon(
                                          Icons.add_moderator,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 270.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          hoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          hoverBorderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, -1.00),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 1370.0,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                              ))
                                                Container(
                                                  width: double.infinity,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              if (_model
                                                      .selectedTournamentPlan ==
                                                  null)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 16.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Tournament plans',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium,
                                                  ),
                                                ),
                                              if (_model
                                                      .selectedTournamentPlan ==
                                                  null)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 8.0, 16.0,
                                                          10.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController2,
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .words,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Search all tournament plans...',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      suffixIcon: Icon(
                                                        Icons.search_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    validator: _model
                                                        .textController2Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              if (_model
                                                      .selectedTournamentPlan ==
                                                  null)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.00, 0.00),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                        ))
                                                          Container(
                                                            width: 40.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                        Expanded(
                                                          flex: 4,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00, 0.00),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Name',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                        ))
                                                          Expanded(
                                                            flex: 2,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                              child: Text(
                                                                'Last Active',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              ),
                                                            ),
                                                          ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                        ))
                                                          Expanded(
                                                            flex: 3,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      0.00),
                                                              child: Text(
                                                                'Title',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall,
                                                              ),
                                                            ),
                                                          ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        50.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child: Text(
                                                                    'Edit',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.00,
                                                                          0.00),
                                                                  child: Text(
                                                                    'Delete',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: SquashManagementAPIGroupGroup
                                                          .populateTournamentPlansCall
                                                          .call(
                                                        tournamentId:
                                                            'eq.${SquashManagementAPIGroupGroup.populateTournamentByUuidCall.tournamentId(
                                                                  editTournamentPagePopulateTournamentByUuidResponse
                                                                      .jsonBody,
                                                                ).toString()}',
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final clubsListViewPopulateTournamentPlansResponse =
                                                            snapshot.data!;
                                                        return Builder(
                                                          builder: (context) {
                                                            final tournamentPlans = SquashManagementAPIGroupGroup
                                                                    .populateTournamentPlansCall
                                                                    .tournamentPlans(
                                                                      clubsListViewPopulateTournamentPlansResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.map((e) =>
                                                                        e)
                                                                    .toList()
                                                                    ?.toList() ??
                                                                [];
                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                0,
                                                                0,
                                                                44.0,
                                                              ),
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  tournamentPlans
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          1.0),
                                                              itemBuilder: (context,
                                                                  tournamentPlansIndex) {
                                                                final tournamentPlansItem =
                                                                    tournamentPlans[
                                                                        tournamentPlansIndex];
                                                                return Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            0.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            12.0,
                                                                            16.0,
                                                                            12.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              44.0,
                                                                          height:
                                                                              44.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                2.0,
                                                                                2.0,
                                                                                2.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  PageTransition(
                                                                                    type: PageTransitionType.fade,
                                                                                    child: FlutterFlowExpandedImageView(
                                                                                      image: Image.network(
                                                                                        getJsonField(
                                                                                                  tournamentPlansItem,
                                                                                                  r'''$.photo_url''',
                                                                                                ) !=
                                                                                                null
                                                                                            ? getJsonField(
                                                                                                tournamentPlansItem,
                                                                                                r'''$.photo_url''',
                                                                                              )
                                                                                            : FFAppConstants.PlayerPhotoPlaceholder,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                      allowRotation: false,
                                                                                      tag: getJsonField(
                                                                                                tournamentPlansItem,
                                                                                                r'''$.photo_url''',
                                                                                              ) !=
                                                                                              null
                                                                                          ? getJsonField(
                                                                                              tournamentPlansItem,
                                                                                              r'''$.photo_url''',
                                                                                            )
                                                                                          : FFAppConstants.PlayerPhotoPlaceholder,
                                                                                      useHeroAnimation: true,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Hero(
                                                                                tag: getJsonField(
                                                                                          tournamentPlansItem,
                                                                                          r'''$.photo_url''',
                                                                                        ) !=
                                                                                        null
                                                                                    ? getJsonField(
                                                                                        tournamentPlansItem,
                                                                                        r'''$.photo_url''',
                                                                                      )
                                                                                    : FFAppConstants.PlayerPhotoPlaceholder,
                                                                                transitionOnUserGestures: true,
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Image.network(
                                                                                    getJsonField(
                                                                                              tournamentPlansItem,
                                                                                              r'''$.photo_url''',
                                                                                            ) !=
                                                                                            null
                                                                                        ? getJsonField(
                                                                                            tournamentPlansItem,
                                                                                            r'''$.photo_url''',
                                                                                          )
                                                                                        : FFAppConstants.PlayerPhotoPlaceholder,
                                                                                    width: 120.0,
                                                                                    height: 120.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              4,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  getJsonField(
                                                                                    tournamentPlansItem,
                                                                                    r'''$.tournament_plan_name''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      tournamentPlansItem,
                                                                                      r'''$.tournament.name''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: 'Plus Jakarta Sans',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                        ))
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                '5 mins ago',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                        ))
                                                                          Expanded(
                                                                            flex:
                                                                                3,
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1.00, 0.00),
                                                                              child: Text(
                                                                                'Head of Design',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 10.0, 0.0),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: FlutterFlowTheme.of(context).primary,
                                                                                  borderRadius: 20.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: FlutterFlowTheme.of(context).accent1,
                                                                                  icon: Icon(
                                                                                    Icons.edit,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    setState(() {
                                                                                      _model.selectedTournamentPlan = getJsonField(
                                                                                        tournamentPlansItem,
                                                                                        r'''$.id''',
                                                                                      );
                                                                                    });
                                                                                    _model.tournamentPlanByUUID = await SquashManagementAPIGroupGroup.populateTournamentPlanByUuidCall.call(
                                                                                      id: 'eq.${_model.selectedTournamentPlan?.toString()}',
                                                                                    );
                                                                                    if ((_model.tournamentPlanByUUID?.succeeded ?? true)) {
                                                                                      // setPlanName
                                                                                      setState(() {
                                                                                        _model.editTournamentPlanModel.txtTournamentPlanNameController?.text = SquashManagementAPIGroupGroup.populateTournamentPlanByUuidCall
                                                                                            .tournamentPlanName(
                                                                                              (_model.tournamentPlanByUUID?.jsonBody ?? ''),
                                                                                            )
                                                                                            .toString();
                                                                                      });
                                                                                      // setPlanLocation
                                                                                      setState(() {
                                                                                        _model.editTournamentPlanModel.lsClubsLocationValueController?.value = SquashManagementAPIGroupGroup.populateTournamentPlanByUuidCall.tournamentPlanLocation(
                                                                                          (_model.tournamentPlanByUUID?.jsonBody ?? ''),
                                                                                        );
                                                                                      });
                                                                                      // setPlanFrom
                                                                                      setState(() {
                                                                                        _model.editTournamentPlanModel.txtFromDateController?.text = SquashManagementAPIGroupGroup.populateTournamentPlanByUuidCall
                                                                                            .tournamentPlanFrom(
                                                                                              (_model.tournamentPlanByUUID?.jsonBody ?? ''),
                                                                                            )
                                                                                            .toString();
                                                                                      });
                                                                                      // setPlanTo
                                                                                      setState(() {
                                                                                        _model.editTournamentPlanModel.txtToDateController?.text = SquashManagementAPIGroupGroup.populateTournamentPlanByUuidCall
                                                                                            .tournamentPlanTo(
                                                                                              (_model.tournamentPlanByUUID?.jsonBody ?? ''),
                                                                                            )
                                                                                            .toString();
                                                                                      });
                                                                                      // setPlanStage
                                                                                      setState(() {
                                                                                        _model.editTournamentPlanModel.lstStagesValueController?.value = SquashManagementAPIGroupGroup.populateTournamentPlanByUuidCall.tournamentPlanStage(
                                                                                          (_model.tournamentPlanByUUID?.jsonBody ?? ''),
                                                                                        );
                                                                                      });
                                                                                      // setPlaGender
                                                                                      setState(() {
                                                                                        _model.editTournamentPlanModel.lsGenderValueController?.value = SquashManagementAPIGroupGroup.populateTournamentPlanByUuidCall
                                                                                            .tournamentPlanGender(
                                                                                              (_model.tournamentPlanByUUID?.jsonBody ?? ''),
                                                                                            )
                                                                                            .toString();
                                                                                      });
                                                                                      // setPlanPhoto
                                                                                      setState(() {
                                                                                        _model.selectedTournamentPlanPhoto = SquashManagementAPIGroupGroup.populateTournamentPlanByUuidCall.tournamentPlanPhoto(
                                                                                          (_model.tournamentPlanByUUID?.jsonBody ?? ''),
                                                                                        );
                                                                                      });
                                                                                      // setSelectedPlanUuid
                                                                                      setState(() {
                                                                                        _model.selectedPlanUuid = getJsonField(
                                                                                          tournamentPlansItem,
                                                                                          r'''$.uuid''',
                                                                                        ).toString();
                                                                                      });
                                                                                    }

                                                                                    setState(() {});
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 10.0, 0.0),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: FlutterFlowTheme.of(context).primary,
                                                                                  borderRadius: 20.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: FlutterFlowTheme.of(context).accent1,
                                                                                  icon: Icon(
                                                                                    Icons.remove_circle_outline_sharp,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    print('IconButton pressed ...');
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_model.selectedTournamentPlan != null)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 700.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: wrapWithModel(
                                    model: _model.editTournamentPlanModel,
                                    updateCallback: () => setState(() {}),
                                    child: EditTournamentPlanWidget(
                                      paramTournamentId: getJsonField(
                                        editTournamentPagePopulateTournamentByUuidResponse
                                            .jsonBody,
                                        r'''$.tournament_id''',
                                      ),
                                      paramPlanUuid: _model.selectedPlanUuid!,
                                      paramPlanPhoto:
                                          _model.selectedTournamentPlanPhoto!,
                                      paramPlanLocation:
                                          SquashManagementAPIGroupGroup
                                              .populateTournamentPlanByUuidCall
                                              .tournamentPlanLocation(
                                        (_model.tournamentPlanByUUID
                                                ?.jsonBody ??
                                            ''),
                                      ),
                                      paramPlanGender:
                                          SquashManagementAPIGroupGroup
                                              .populateTournamentPlanByUuidCall
                                              .tournamentPlanGender(
                                                (_model.tournamentPlanByUUID
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString(),
                                      paramPlanStage:
                                          SquashManagementAPIGroupGroup
                                              .populateTournamentPlanByUuidCall
                                              .tournamentPlanStage(
                                        (_model.tournamentPlanByUUID
                                                ?.jsonBody ??
                                            ''),
                                      ),
                                      paramPlanPhotoString:
                                          SquashManagementAPIGroupGroup
                                              .populateTournamentPlanByUuidCall
                                              .tournamentPlanPhoto(
                                                (_model.tournamentPlanByUUID
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
