import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'edit_tournament_match4th_model.dart';
export 'edit_tournament_match4th_model.dart';

class EditTournamentMatch4thWidget extends StatefulWidget {
  const EditTournamentMatch4thWidget({
    Key? key,
    required this.paramTournamentName,
    required this.paramTournamentPlanName,
    required this.paramTournamentPlanPhoto,
    required this.paramTournamentPlanId,
    required this.paramMatchUuid,
  }) : super(key: key);

  final String? paramTournamentName;
  final String? paramTournamentPlanName;
  final String? paramTournamentPlanPhoto;
  final int? paramTournamentPlanId;
  final String? paramMatchUuid;

  @override
  _EditTournamentMatch4thWidgetState createState() =>
      _EditTournamentMatch4thWidgetState();
}

class _EditTournamentMatch4thWidgetState
    extends State<EditTournamentMatch4thWidget> {
  late EditTournamentMatch4thModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTournamentMatch4thModel());

    _model.txtMatchTimeFocusNode ??= FocusNode();

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
      future: SquashManagementAPIGroupGroup.populatePlanMatchByUuidCall.call(
        uuid: 'eq.${widget.paramMatchUuid}',
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
        final editTournamentMatch4thPopulatePlanMatchByUuidResponse =
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
                          FFLocalizations.of(context).getText(
                            'der2wr6m' /* 4. Edit Tournament Match */,
                          ),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x1839D2C0),
                        borderRadius: BorderRadius.circular(0.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Image.asset(
                                    'assets/images/pngwing.com.png',
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  minWidth: 60.0,
                                  minHeight: 30.0,
                                  maxWidth: 90.0,
                                  maxHeight: 60.0,
                                ),
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          widget.paramTournamentName,
                                          'بطولة القاهرة للاسكواش للمحترفين',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Noto Kufi Arabic',
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 120.0,
                                      height: 4.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 44.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.keyboard_double_arrow_right_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 32.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Image.network(
                                    widget.paramTournamentPlanPhoto!,
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  minWidth: 60.0,
                                  minHeight: 30.0,
                                  maxWidth: 90.0,
                                  maxHeight: 60.0,
                                ),
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          widget.paramTournamentPlanName,
                                          'بطولة الأهلي 2024',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Noto Kufi Arabic',
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 8,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(24.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        3.0),
                                                            child: FutureBuilder<
                                                                ApiCallResponse>(
                                                              future: SquashManagementAPIGroupGroup
                                                                  .populatePlanEventsAPICall
                                                                  .call(
                                                                inputid: widget
                                                                    .paramTournamentPlanId,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final lstEventsPopulatePlanEventsAPIResponse =
                                                                    snapshot
                                                                        .data!;
                                                                return FlutterFlowDropDown<
                                                                    int>(
                                                                  controller: _model
                                                                          .lstEventsValueController ??=
                                                                      FormFieldController<
                                                                          int>(
                                                                    _model.lstEventsValue ??=
                                                                        SquashManagementAPIGroupGroup
                                                                            .populatePlanMatchByUuidCall
                                                                            .eventId(
                                                                      editTournamentMatch4thPopulatePlanMatchByUuidResponse
                                                                          .jsonBody,
                                                                    ),
                                                                  ),
                                                                  options: List<
                                                                      int>.from((SquashManagementAPIGroupGroup.populatePlanEventsAPICall
                                                                                      .idList(
                                                                                    lstEventsPopulatePlanEventsAPIResponse.jsonBody,
                                                                                  ) !=
                                                                                  null &&
                                                                              SquashManagementAPIGroupGroup
                                                                                  .populatePlanEventsAPICall
                                                                                  .idList(
                                                                                    lstEventsPopulatePlanEventsAPIResponse.jsonBody,
                                                                                  )!
                                                                                  .isNotEmpty) ==
                                                                          true
                                                                      ? SquashManagementAPIGroupGroup
                                                                          .populatePlanEventsAPICall
                                                                          .idList(
                                                                          lstEventsPopulatePlanEventsAPIResponse
                                                                              .jsonBody,
                                                                        )!
                                                                      : List.generate(
                                                                          random_data.randomInteger(
                                                                              0,
                                                                              0),
                                                                          (index) => random_data.randomInteger(
                                                                              0,
                                                                              0))),
                                                                  optionLabels: (SquashManagementAPIGroupGroup.populatePlanEventsAPICall.nameList(
                                                                                    lstEventsPopulatePlanEventsAPIResponse.jsonBody,
                                                                                  ) !=
                                                                                  null &&
                                                                              SquashManagementAPIGroupGroup.populatePlanEventsAPICall
                                                                                  .nameList(
                                                                                    lstEventsPopulatePlanEventsAPIResponse.jsonBody,
                                                                                  )!
                                                                                  .isNotEmpty) ==
                                                                          true
                                                                      ? (SquashManagementAPIGroupGroup.populatePlanEventsAPICall.nameList(
                                                                          lstEventsPopulatePlanEventsAPIResponse
                                                                              .jsonBody,
                                                                        ) as List)
                                                                          .map<String>((s) => s.toString())
                                                                          .toList()!
                                                                      : List.generate(
                                                                          random_data.randomInteger(0, 0),
                                                                          (index) => random_data.randomString(
                                                                                0,
                                                                                0,
                                                                                true,
                                                                                false,
                                                                                false,
                                                                              )),
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                          _model.lstEventsValue =
                                                                              val),
                                                                  width: double
                                                                      .infinity,
                                                                  height: 56.0,
                                                                  searchHintTextStyle:
                                                                      TextStyle(),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '7l04vibq' /* Tournament Event */,
                                                                  ),
                                                                  searchHintText:
                                                                      '',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .location_on_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 15.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  borderWidth:
                                                                      2.0,
                                                                  borderRadius:
                                                                      8.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          4.0,
                                                                          12.0,
                                                                          4.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isSearchable:
                                                                      true,
                                                                  isMultiSelect:
                                                                      false,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
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
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model.txtMatchTimeController ??=
                                                                              TextEditingController(
                                                                        text: SquashManagementAPIGroupGroup
                                                                            .populatePlanMatchByUuidCall
                                                                            .matchTime(
                                                                              editTournamentMatch4thPopulatePlanMatchByUuidResponse.jsonBody,
                                                                            )
                                                                            .toString(),
                                                                      ),
                                                                      focusNode:
                                                                          _model
                                                                              .txtMatchTimeFocusNode,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.txtMatchTimeController',
                                                                        Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () => setState(
                                                                            () {}),
                                                                      ),
                                                                      textCapitalization:
                                                                          TextCapitalization
                                                                              .none,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'zcirpfur' /* Match Time */,
                                                                        ),
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          '39j3lxbp' /* yyyy-MM-dd hh:mm */,
                                                                        ),
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            24.0,
                                                                            0.0,
                                                                            24.0),
                                                                        suffixIcon: _model.txtMatchTimeController!.text.isNotEmpty
                                                                            ? InkWell(
                                                                                onTap: () async {
                                                                                  _model.txtMatchTimeController?.clear();
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
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .datetime,
                                                                      validator: _model
                                                                          .txtMatchTimeControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                      inputFormatters: [
                                                                        _model
                                                                            .txtMatchTimeMask
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            15.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      borderRadius:
                                                                          20.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .accent1,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .timer_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        final _datePickedDate =
                                                                            await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              getCurrentTimestamp,
                                                                          firstDate:
                                                                              (getCurrentTimestamp ?? DateTime(1900)),
                                                                          lastDate:
                                                                              DateTime(2050),
                                                                          builder:
                                                                              (context, child) {
                                                                            return wrapInMaterialDatePickerTheme(
                                                                              context,
                                                                              child!,
                                                                              headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                              headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                              headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    fontSize: 32.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                              pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                              selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                              selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                              actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                              iconSize: 24.0,
                                                                            );
                                                                          },
                                                                        );

                                                                        TimeOfDay?
                                                                            _datePickedTime;
                                                                        if (_datePickedDate !=
                                                                            null) {
                                                                          _datePickedTime =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      fontSize: 32.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                        }

                                                                        if (_datePickedDate !=
                                                                                null &&
                                                                            _datePickedTime !=
                                                                                null) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.datePicked =
                                                                                DateTime(
                                                                              _datePickedDate.year,
                                                                              _datePickedDate.month,
                                                                              _datePickedDate.day,
                                                                              _datePickedTime!.hour,
                                                                              _datePickedTime.minute,
                                                                            );
                                                                          });
                                                                        }
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .txtMatchTimeController
                                                                              ?.text = dateTimeFormat(
                                                                            'yyyy-MM-dd hh:mm',
                                                                            _model.datePicked,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          );
                                                                        });
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            20.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .people_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          3.0),
                                                                      child: FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future: SquashManagementAPIGroupGroup
                                                                            .populatePlanPlayersAPICall
                                                                            .call(
                                                                          inputid:
                                                                              widget.paramTournamentPlanId,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          final lstPlayer1PopulatePlanPlayersAPIResponse =
                                                                              snapshot.data!;
                                                                          return FlutterFlowDropDown<
                                                                              int>(
                                                                            controller: _model.lstPlayer1ValueController ??=
                                                                                FormFieldController<int>(
                                                                              _model.lstPlayer1Value ??= SquashManagementAPIGroupGroup.populatePlanMatchByUuidCall.player1Id(
                                                                                editTournamentMatch4thPopulatePlanMatchByUuidResponse.jsonBody,
                                                                              ),
                                                                            ),
                                                                            options: List<int>.from((SquashManagementAPIGroupGroup.populatePlanPlayersAPICall.idList(
                                                                                              lstPlayer1PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                            ) !=
                                                                                            null &&
                                                                                        SquashManagementAPIGroupGroup.populatePlanPlayersAPICall
                                                                                            .idList(
                                                                                              lstPlayer1PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                            )!
                                                                                            .isNotEmpty) ==
                                                                                    true
                                                                                ? SquashManagementAPIGroupGroup.populatePlanPlayersAPICall.idList(
                                                                                    lstPlayer1PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                  )!
                                                                                : List.generate(random_data.randomInteger(0, 0), (index) => random_data.randomInteger(0, 0))),
                                                                            optionLabels: (SquashManagementAPIGroupGroup.populatePlanPlayersAPICall.nameList(
                                                                                              lstPlayer1PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                            ) !=
                                                                                            null &&
                                                                                        SquashManagementAPIGroupGroup.populatePlanPlayersAPICall
                                                                                            .nameList(
                                                                                              lstPlayer1PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                            )!
                                                                                            .isNotEmpty) ==
                                                                                    true
                                                                                ? (SquashManagementAPIGroupGroup.populatePlanPlayersAPICall.nameList(
                                                                                    lstPlayer1PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                  ) as List)
                                                                                    .map<String>((s) => s.toString())
                                                                                    .toList()!
                                                                                : List.generate(
                                                                                    random_data.randomInteger(0, 0),
                                                                                    (index) => random_data.randomString(
                                                                                          0,
                                                                                          0,
                                                                                          true,
                                                                                          false,
                                                                                          false,
                                                                                        )),
                                                                            onChanged: (val) =>
                                                                                setState(() => _model.lstPlayer1Value = val),
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                56.0,
                                                                            searchHintTextStyle:
                                                                                TextStyle(),
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'uvzvcklf' /* Player I */,
                                                                            ),
                                                                            searchHintText:
                                                                                '',
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                true,
                                                                            isMultiSelect:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          3.0),
                                                                      child: FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future: SquashManagementAPIGroupGroup
                                                                            .populatePlanPlayersAPICall
                                                                            .call(
                                                                          inputid:
                                                                              widget.paramTournamentPlanId,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          final lstPlayer2PopulatePlanPlayersAPIResponse =
                                                                              snapshot.data!;
                                                                          return FlutterFlowDropDown<
                                                                              int>(
                                                                            controller: _model.lstPlayer2ValueController ??=
                                                                                FormFieldController<int>(
                                                                              _model.lstPlayer2Value ??= SquashManagementAPIGroupGroup.populatePlanMatchByUuidCall.player2Id(
                                                                                editTournamentMatch4thPopulatePlanMatchByUuidResponse.jsonBody,
                                                                              ),
                                                                            ),
                                                                            options: List<int>.from((SquashManagementAPIGroupGroup.populatePlanPlayersAPICall.idList(
                                                                                              lstPlayer2PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                            ) !=
                                                                                            null &&
                                                                                        SquashManagementAPIGroupGroup.populatePlanPlayersAPICall
                                                                                            .idList(
                                                                                              lstPlayer2PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                            )!
                                                                                            .isNotEmpty) ==
                                                                                    true
                                                                                ? SquashManagementAPIGroupGroup.populatePlanPlayersAPICall.idList(
                                                                                    lstPlayer2PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                  )!
                                                                                : List.generate(random_data.randomInteger(0, 0), (index) => random_data.randomInteger(0, 0))),
                                                                            optionLabels: (SquashManagementAPIGroupGroup.populatePlanPlayersAPICall.nameList(
                                                                                              lstPlayer2PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                            ) !=
                                                                                            null &&
                                                                                        SquashManagementAPIGroupGroup.populatePlanPlayersAPICall
                                                                                            .nameList(
                                                                                              lstPlayer2PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                            )!
                                                                                            .isNotEmpty) ==
                                                                                    true
                                                                                ? (SquashManagementAPIGroupGroup.populatePlanPlayersAPICall.nameList(
                                                                                    lstPlayer2PopulatePlanPlayersAPIResponse.jsonBody,
                                                                                  ) as List)
                                                                                    .map<String>((s) => s.toString())
                                                                                    .toList()!
                                                                                : List.generate(
                                                                                    random_data.randomInteger(0, 0),
                                                                                    (index) => random_data.randomString(
                                                                                          0,
                                                                                          0,
                                                                                          true,
                                                                                          false,
                                                                                          false,
                                                                                        )),
                                                                            onChanged: (val) =>
                                                                                setState(() => _model.lstPlayer2Value = val),
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                56.0,
                                                                            searchHintTextStyle:
                                                                                TextStyle(),
                                                                            textStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'n6sk17uj' /* Player II */,
                                                                            ),
                                                                            searchHintText:
                                                                                '',
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                4.0,
                                                                                12.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isSearchable:
                                                                                true,
                                                                            isMultiSelect:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.05),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (_model.formKey
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .lstEventsValue ==
                                                          null) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Match event 1 is required. You must add event(s) to tournament plan',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                      if (_model
                                                              .lstPlayer1Value ==
                                                          null) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Player 1 is required. You must add player(s) to tournament plan',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    5000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            action:
                                                                SnackBarAction(
                                                              label:
                                                                  'Navigate back',
                                                              textColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              onPressed:
                                                                  () async {
                                                                context.pop();
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                      if (_model
                                                              .lstPlayer2Value ==
                                                          null) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Player 2 is required. You must add player(s) to tournament plan',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    5000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            action:
                                                                SnackBarAction(
                                                              label:
                                                                  'Navigate back',
                                                              textColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              onPressed:
                                                                  () async {
                                                                context.pop();
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                      _model.createMatchResponse =
                                                          await SquashManagementAPIGroupGroup
                                                              .editPlanMatchAPICall
                                                              .call(
                                                        eventId: _model
                                                            .lstEventsValue,
                                                        matchTime: _model
                                                            .txtMatchTimeController
                                                            .text,
                                                        player1Id: _model
                                                            .lstPlayer1Value,
                                                        player2Id: _model
                                                            .lstPlayer2Value,
                                                        uuid: widget
                                                            .paramMatchUuid,
                                                      );
                                                      if ((_model
                                                              .createMatchResponse
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Match has been updated successfully',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    3000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                        // resetText
                                                        setState(() {
                                                          _model.txtMatchTimeController
                                                                  ?.text =
                                                              SquashManagementAPIGroupGroup
                                                                  .populatePlanMatchByUuidCall
                                                                  .matchTime(
                                                                    editTournamentMatch4thPopulatePlanMatchByUuidResponse
                                                                        .jsonBody,
                                                                  )
                                                                  .toString()!;
                                                        });
                                                        Navigator.pop(context);
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Error while updating Match',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    3000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }

                                                      setState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      't0fg7ypl' /* Update */,
                                                    ),
                                                    icon: Icon(
                                                      Icons.save_as_rounded,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 270.0,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      hoverBorderSide:
                                                          BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
