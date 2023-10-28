import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'create_player_page_widget.dart' show CreatePlayerPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CreatePlayerPageModel extends FlutterFlowModel<CreatePlayerPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for txtPlayerName widget.
  FocusNode? txtPlayerNameFocusNode;
  TextEditingController? txtPlayerNameController;
  String? Function(BuildContext, String?)? txtPlayerNameControllerValidator;
  String? _txtPlayerNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtRank widget.
  FocusNode? txtRankFocusNode;
  TextEditingController? txtRankController;
  String? Function(BuildContext, String?)? txtRankControllerValidator;
  String? _txtRankControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for lstStages widget.
  String? lstStagesValue;
  FormFieldController<String>? lstStagesValueController;
  // State field(s) for txtDateOfBirth widget.
  FocusNode? txtDateOfBirthFocusNode;
  TextEditingController? txtDateOfBirthController;
  final txtDateOfBirthMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? txtDateOfBirthControllerValidator;
  String? _txtDateOfBirthControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for txtPlayerBio widget.
  FocusNode? txtPlayerBioFocusNode;
  TextEditingController? txtPlayerBioController;
  String? Function(BuildContext, String?)? txtPlayerBioControllerValidator;
  // Stores action output result for [Backend Call - API (createPlayerAPI)] action in Button widget.
  ApiCallResponse? apiResultp5y;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtPlayerNameControllerValidator = _txtPlayerNameControllerValidator;
    txtRankControllerValidator = _txtRankControllerValidator;
    txtDateOfBirthControllerValidator = _txtDateOfBirthControllerValidator;
  }

  void dispose() {
    txtPlayerNameFocusNode?.dispose();
    txtPlayerNameController?.dispose();

    txtRankFocusNode?.dispose();
    txtRankController?.dispose();

    txtDateOfBirthFocusNode?.dispose();
    txtDateOfBirthController?.dispose();

    txtPlayerBioFocusNode?.dispose();
    txtPlayerBioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
