import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_players_with_stage_model.dart';
export 'list_players_with_stage_model.dart';

class ListPlayersWithStageWidget extends StatefulWidget {
  const ListPlayersWithStageWidget({super.key});

  @override
  State<ListPlayersWithStageWidget> createState() =>
      _ListPlayersWithStageWidgetState();
}

class _ListPlayersWithStageWidgetState
    extends State<ListPlayersWithStageWidget> {
  late ListPlayersWithStageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListPlayersWithStageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'q8sjphgb' /* Players */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'gs2xhhr3' /* Select players to join selecte... */,
            ),
            style: FlutterFlowTheme.of(context).labelSmall,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
          child: TextFormField(
            controller: _model.textController,
            focusNode: _model.textFieldFocusNode,
            textCapitalization: TextCapitalization.words,
            obscureText: false,
            decoration: InputDecoration(
              labelText: FFLocalizations.of(context).getText(
                '08c04gve' /* Search all players... */,
              ),
              labelStyle: FlutterFlowTheme.of(context).labelMedium,
              hintStyle: FlutterFlowTheme.of(context).labelMedium,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              suffixIcon: Icon(
                Icons.search_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
            cursorColor: FlutterFlowTheme.of(context).primary,
            validator: _model.textControllerValidator.asValidator(context),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: SquashManagementAPIGroupGroup.populatePlayerStagesCall
                      .call(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final choiceChipsPopulatePlayerStagesResponse =
                        snapshot.data!;
                    return FlutterFlowChoiceChips(
                      options: [
                        ChipData(FFLocalizations.of(context).getText(
                          'spzwdo7d' /* All */,
                        )),
                        ChipData(FFLocalizations.of(context).getText(
                          'nkb6xbe3' /* Under 10 */,
                        )),
                        ChipData(FFLocalizations.of(context).getText(
                          'breq2sue' /* Under 12 */,
                        )),
                        ChipData(FFLocalizations.of(context).getText(
                          'yk9aaku2' /* Under 14 */,
                        )),
                        ChipData(FFLocalizations.of(context).getText(
                          'lzqabli4' /* Under 16 */,
                        )),
                        ChipData(FFLocalizations.of(context).getText(
                          '4k8enayf' /* Under 18 */,
                        ))
                      ],
                      onChanged: (val) =>
                          setState(() => _model.choiceChipsValues = val),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                        iconColor: FlutterFlowTheme.of(context).info,
                        iconSize: 18.0,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).accent1,
                        borderWidth: 1.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        iconSize: 18.0,
                        elevation: 0.0,
                        borderColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        borderWidth: 1.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      chipSpacing: 8.0,
                      rowSpacing: 12.0,
                      multiselect: true,
                      initialized: _model.choiceChipsValues != null,
                      alignment: WrapAlignment.start,
                      controller: _model.choiceChipsValueController ??=
                          FormFieldController<List<String>>(
                        [
                          FFLocalizations.of(context).getText(
                            '0vlzbiz7' /* All */,
                          )
                        ],
                      ),
                      wrapped: true,
                    );
                  },
                ),
              ),
            ].addToStart(SizedBox(width: 16.0)).addToEnd(SizedBox(width: 16.0)),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '6vxbfnt5' /* Name */,
                                ),
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '4k4kwhpj' /* Status */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView(
                padding: EdgeInsets.fromLTRB(
                  0,
                  0,
                  0,
                  44.0,
                ),
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.0,
                          color: FlutterFlowTheme.of(context).alternate,
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Container(
                                            width: 44.0,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDZ8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
                                                  width: 120.0,
                                                  height: 120.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'cqucac5y' /* Randy Rodriguez */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'jwoqu34g' /* randy@domainname.com */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      icon: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
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
                ].divide(SizedBox(height: 1.0)),
              ),
            ],
          ),
        ),
      ].addToEnd(SizedBox(height: 64.0)),
    );
  }
}
