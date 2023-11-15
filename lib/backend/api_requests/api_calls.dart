import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SquashManagementAPIGroup Group Code

class SquashManagementAPIGroupGroup {
  static String baseUrl = 'https://xhohsggtqcqazqvokuat.supabase.co/rest/v1/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
  };
  static CreateClubAPICall createClubAPICall = CreateClubAPICall();
  static CreateTournamentAPICall createTournamentAPICall =
      CreateTournamentAPICall();
  static CreatePlayerAPICall createPlayerAPICall = CreatePlayerAPICall();
  static PopulatePlayerStagesCall populatePlayerStagesCall =
      PopulatePlayerStagesCall();
  static PopulatePlayerRanksCall populatePlayerRanksCall =
      PopulatePlayerRanksCall();
}

class CreateClubAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createClubAPI',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}club',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Prefer': 'return=representation',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[0].id''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[0].name''',
      );
}

class CreateTournamentAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createTournamentAPI',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}tournament',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Prefer': 'return=representation',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[0].id''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[0].name''',
      );
}

class CreatePlayerAPICall {
  Future<ApiCallResponse> call({
    String? playerName = '',
    String? dateOfBirth = '',
    int? rank,
    int? stage,
    String? gender = '',
    String? playerBio = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${playerName}",
  "date_of_birth": "${dateOfBirth} 00:00:00.00000+00",
  "rank": ${rank},
  "stage": ${stage},
  "gender" :"${gender}",
"player_bio" : "${playerBio}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createPlayerAPI',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}player',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Prefer': 'return=representation',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[0].id''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[0].name''',
      );
}

class PopulatePlayerStagesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'populatePlayerStages',
      apiUrl:
          '${SquashManagementAPIGroupGroup.baseUrl}player_stage_lkp?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
}

class PopulatePlayerRanksCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'populatePlayerRanks',
      apiUrl:
          '${SquashManagementAPIGroupGroup.baseUrl}player_rank_lkp?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
}

/// End SquashManagementAPIGroup Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
