import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'edit_player_page_model.dart';
export 'edit_player_page_model.dart';

class EditPlayerPageWidget extends StatefulWidget {
  const EditPlayerPageWidget({
    Key? key,
    required this.playerUuid,
  }) : super(key: key);

  final String? playerUuid;

  @override
  _EditPlayerPageWidgetState createState() => _EditPlayerPageWidgetState();
}

class _EditPlayerPageWidgetState extends State<EditPlayerPageWidget>
    with TickerProviderStateMixin {
  late EditPlayerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'circleImageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 10.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPlayerPageModel());

    _model.txtPlayerNameFocusNode ??= FocusNode();

    _model.txtDateOfBirthFocusNode ??= FocusNode();

    _model.txtPlayerBioFocusNode ??= FocusNode();

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
      future: SquashManagementAPIGroupGroup.populatePlayerByUuidCall.call(
        uuid: 'eq.${widget.playerUuid}',
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
        final editPlayerPagePopulatePlayerByUuidResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                          'l2nf3yu4' /* Edit Player Profile */,
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
              ),
              elevation: 0.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  storageFolderPath: 'PlayerPhoto',
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();

                                    downloadUrls =
                                        await uploadSupabaseStorageFiles(
                                      bucketName:
                                          'SquashManagementPlatformBucket',
                                      selectedFiles: selectedMedia,
                                    );
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                    });
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload data');
                                    return;
                                  }
                                }
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 350),
                                curve: Curves.bounceOut,
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Container(
                                    width: 90.0,
                                    height: 90.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      () {
                                        if (_model.uploadedFileUrl != null &&
                                            _model.uploadedFileUrl != '') {
                                          return _model.uploadedFileUrl;
                                        } else if (SquashManagementAPIGroupGroup
                                                    .populatePlayerByUuidCall
                                                    .photo(
                                                  editPlayerPagePopulatePlayerByUuidResponse
                                                      .jsonBody,
                                                ) !=
                                                null &&
                                            SquashManagementAPIGroupGroup
                                                    .populatePlayerByUuidCall
                                                    .photo(
                                                  editPlayerPagePopulatePlayerByUuidResponse
                                                      .jsonBody,
                                                ) !=
                                                '') {
                                          return SquashManagementAPIGroupGroup
                                              .populatePlayerByUuidCall
                                              .photo(
                                            editPlayerPagePopulatePlayerByUuidResponse
                                                .jsonBody,
                                          )!;
                                        } else {
                                          return valueOrDefault<String>(
                                            FFAppConstants
                                                .PlayerPhotoPlaceholder,
                                            'https://xhohsggtqcqazqvokuat.supabase.co/storage/v1/object/public/SquashManagementPlatformBucket/PlayerPhoto/Default-Master.jpeg',
                                          );
                                        }
                                      }(),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'circleImageOnPageLoadAnimation']!),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Container(
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 15.0),
                                child: TextFormField(
                                  controller: _model.txtPlayerNameController ??=
                                      TextEditingController(
                                    text: SquashManagementAPIGroupGroup
                                        .populatePlayerByUuidCall
                                        .name(
                                      editPlayerPagePopulatePlayerByUuidResponse
                                          .jsonBody,
                                    ),
                                  ),
                                  focusNode: _model.txtPlayerNameFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.txtPlayerNameController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  textCapitalization: TextCapitalization.words,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'z2e54z8c' /* Player Name */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                    suffixIcon: _model.txtPlayerNameController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.txtPlayerNameController
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
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .txtPlayerNameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 10.0),
                                      child: TextFormField(
                                        controller:
                                            _model.txtDateOfBirthController ??=
                                                TextEditingController(
                                          text: SquashManagementAPIGroupGroup
                                              .populatePlayerByUuidCall
                                              .birthDate(
                                            editPlayerPagePopulatePlayerByUuidResponse
                                                .jsonBody,
                                          ),
                                        ),
                                        focusNode:
                                            _model.txtDateOfBirthFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.txtDateOfBirthController',
                                          Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        textCapitalization:
                                            TextCapitalization.none,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'c6q0i1py' /* Date of birth */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'i8rtpql0' /* yyyy-MM-dd */,
                                          ),
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
                                                  20.0, 24.0, 0.0, 24.0),
                                          suffixIcon: _model
                                                  .txtDateOfBirthController!
                                                  .text
                                                  .isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model
                                                        .txtDateOfBirthController
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
                                        keyboardType: TextInputType.datetime,
                                        validator: _model
                                            .txtDateOfBirthControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          _model.txtDateOfBirthMask
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 25.0, 10.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        icon: Icon(
                                          Icons.date_range_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          final _datePickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: getCurrentTimestamp,
                                            firstDate: DateTime(1900),
                                            lastDate: getCurrentTimestamp,
                                            builder: (context, child) {
                                              return wrapInMaterialDatePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 32.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );

                                          if (_datePickedDate != null) {
                                            safeSetState(() {
                                              _model.datePicked = DateTime(
                                                _datePickedDate.year,
                                                _datePickedDate.month,
                                                _datePickedDate.day,
                                              );
                                            });
                                          }
                                          setState(() {
                                            _model.txtDateOfBirthController
                                                ?.text = dateTimeFormat(
                                              'yyyy-MM-dd',
                                              _model.datePicked,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            );
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 5.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: SquashManagementAPIGroupGroup
                                      .populateClubAsLocationsCall
                                      .call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final lstClubsPopulateClubAsLocationsResponse =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<int>(
                                      controller:
                                          _model.lstClubsValueController ??=
                                              FormFieldController<int>(
                                        _model.lstClubsValue ??=
                                            SquashManagementAPIGroupGroup
                                                .populatePlayerByUuidCall
                                                .club(
                                          editPlayerPagePopulatePlayerByUuidResponse
                                              .jsonBody,
                                        ),
                                      ),
                                      options: List<int>.from(
                                          SquashManagementAPIGroupGroup
                                              .populateClubAsLocationsCall
                                              .id(
                                        lstClubsPopulateClubAsLocationsResponse
                                            .jsonBody,
                                      )!),
                                      optionLabels:
                                          SquashManagementAPIGroupGroup
                                              .populateClubAsLocationsCall
                                              .name(
                                        lstClubsPopulateClubAsLocationsResponse
                                            .jsonBody,
                                      )!,
                                      onChanged: (val) => setState(
                                          () => _model.lstClubsValue = val),
                                      width: double.infinity,
                                      height: 56.0,
                                      searchHintTextStyle: TextStyle(),
                                      searchTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'mb9fnizf' /* Club/Academy */,
                                      ),
                                      searchHintText: '',
                                      icon: Icon(
                                        Icons.sports_tennis_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 15.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: true,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 5.0),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.lsGenderValueController ??=
                                      FormFieldController<String>(
                                    _model.lsGenderValue ??=
                                        SquashManagementAPIGroupGroup
                                            .populatePlayerByUuidCall
                                            .gender(
                                      editPlayerPagePopulatePlayerByUuidResponse
                                          .jsonBody,
                                    ),
                                  ),
                                  options:
                                      List<String>.from(['Male', 'Female']),
                                  optionLabels: [
                                    FFLocalizations.of(context).getText(
                                      'ayudxgd7' /* Male */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'o5n9g0iv' /* Female */,
                                    )
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.lsGenderValue = val),
                                  width: double.infinity,
                                  height: 56.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: FFLocalizations.of(context).getText(
                                    '9o1i58pp' /*       Gender */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 15.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 4.0, 12.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 5.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: SquashManagementAPIGroupGroup
                                      .populatePlayerStagesCall
                                      .call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final lstStagesPopulatePlayerStagesResponse =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<int>(
                                      controller:
                                          _model.lstStagesValueController ??=
                                              FormFieldController<int>(
                                        _model.lstStagesValue ??=
                                            SquashManagementAPIGroupGroup
                                                .populatePlayerByUuidCall
                                                .stage(
                                          editPlayerPagePopulatePlayerByUuidResponse
                                              .jsonBody,
                                        ),
                                      ),
                                      options: List<int>.from(
                                          SquashManagementAPIGroupGroup
                                              .populatePlayerStagesCall
                                              .id(
                                        lstStagesPopulatePlayerStagesResponse
                                            .jsonBody,
                                      )!),
                                      optionLabels:
                                          SquashManagementAPIGroupGroup
                                              .populatePlayerStagesCall
                                              .name(
                                        lstStagesPopulatePlayerStagesResponse
                                            .jsonBody,
                                      )!,
                                      onChanged: (val) => setState(
                                          () => _model.lstStagesValue = val),
                                      width: double.infinity,
                                      height: 56.0,
                                      searchHintTextStyle: TextStyle(),
                                      searchTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'yjk21bfw' /* Player Stage */,
                                      ),
                                      searchHintText:
                                          FFLocalizations.of(context).getText(
                                        '8s545lga' /* Select player stage */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 15.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: true,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 5.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: SquashManagementAPIGroupGroup
                                      .populatePlayerRanksCall
                                      .call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final lstRanksPopulatePlayerRanksResponse =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<int>(
                                      controller:
                                          _model.lstRanksValueController ??=
                                              FormFieldController<int>(
                                        _model.lstRanksValue ??=
                                            SquashManagementAPIGroupGroup
                                                .populatePlayerByUuidCall
                                                .rank(
                                          editPlayerPagePopulatePlayerByUuidResponse
                                              .jsonBody,
                                        ),
                                      ),
                                      options: List<int>.from(
                                          SquashManagementAPIGroupGroup
                                              .populatePlayerRanksCall
                                              .id(
                                                lstRanksPopulatePlayerRanksResponse
                                                    .jsonBody,
                                              )!
                                              .cast<int>()),
                                      optionLabels:
                                          SquashManagementAPIGroupGroup
                                              .populatePlayerRanksCall
                                              .name(
                                                lstRanksPopulatePlayerRanksResponse
                                                    .jsonBody,
                                              )!
                                              .map((e) => e.toString())
                                              .toList(),
                                      onChanged: (val) => setState(
                                          () => _model.lstRanksValue = val),
                                      width: double.infinity,
                                      height: 56.0,
                                      searchHintTextStyle: TextStyle(),
                                      searchTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '3a1u01eu' /* Player Rank */,
                                      ),
                                      searchHintText:
                                          FFLocalizations.of(context).getText(
                                        '1d38b92b' /* Select player rank */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 15.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: true,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 5.0),
                                child: TextFormField(
                                  controller: _model.txtPlayerBioController ??=
                                      TextEditingController(
                                    text: SquashManagementAPIGroupGroup
                                        .populatePlayerByUuidCall
                                        .bio(
                                      editPlayerPagePopulatePlayerByUuidResponse
                                          .jsonBody,
                                    ),
                                  ),
                                  focusNode: _model.txtPlayerBioFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.txtPlayerBioController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'pskkrfhx' /* Player bio */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                    suffixIcon: _model.txtPlayerBioController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.txtPlayerBioController
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
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  validator: _model
                                      .txtPlayerBioControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.05),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.lsGenderValue == null) {
                                        return;
                                      }
                                      if (_model.lstStagesValue == null) {
                                        return;
                                      }
                                      if (_model.lstRanksValue == null) {
                                        return;
                                      }
                                      _model.apiResultp5y =
                                          await SquashManagementAPIGroupGroup
                                              .editPlayerAPICall
                                              .call(
                                        playerName:
                                            _model.txtPlayerNameController.text,
                                        dateOfBirth: _model
                                            .txtDateOfBirthController.text,
                                        rank: _model.lstRanksValue,
                                        stage: _model.lstStagesValue,
                                        gender: _model.lsGenderValue,
                                        playerBio:
                                            _model.txtPlayerBioController.text,
                                        uuid: widget.playerUuid,
                                        photoUrl:
                                            _model.uploadedFileUrl != null &&
                                                    _model.uploadedFileUrl != ''
                                                ? _model.uploadedFileUrl
                                                : SquashManagementAPIGroupGroup
                                                    .populatePlayerByUuidCall
                                                    .photo(
                                                    editPlayerPagePopulatePlayerByUuidResponse
                                                        .jsonBody,
                                                  ),
                                        clubId: _model.lstClubsValue,
                                      );
                                      if ((_model.apiResultp5y?.succeeded ??
                                          true)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Player has been updated successfully',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        // resetText
                                        setState(() {
                                          _model.txtPlayerNameController?.text =
                                              SquashManagementAPIGroupGroup
                                                  .populatePlayerByUuidCall
                                                  .name(
                                            editPlayerPagePopulatePlayerByUuidResponse
                                                .jsonBody,
                                          )!;
                                          _model.txtDateOfBirthController
                                                  ?.text =
                                              SquashManagementAPIGroupGroup
                                                  .populatePlayerByUuidCall
                                                  .birthDate(
                                            editPlayerPagePopulatePlayerByUuidResponse
                                                .jsonBody,
                                          )!;
                                          _model.txtPlayerBioController?.text =
                                              SquashManagementAPIGroupGroup
                                                  .populatePlayerByUuidCall
                                                  .bio(
                                            editPlayerPagePopulatePlayerByUuidResponse
                                                .jsonBody,
                                          )!;
                                        });
                                        // resetDropdowns
                                        setState(() {
                                          _model.lsGenderValueController
                                              ?.reset();
                                          _model.lstStagesValueController
                                              ?.reset();
                                          _model.lstRanksValueController
                                              ?.reset();
                                        });
                                        context.safePop();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Error while updating Player',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }

                                      setState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'whypbf6r' /* Update */,
                                    ),
                                    icon: Icon(
                                      Icons.add_moderator,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 270.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.white,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                      hoverColor: FlutterFlowTheme.of(context)
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
