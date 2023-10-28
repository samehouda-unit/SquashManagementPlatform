import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SquashManagementAPIGroup Group Code

class SquashManagementAPIGroupGroup {
  static String baseUrl = 'https://xhohsggtqcqazqvokuat.supabase.co';
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
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}/rest/v1/club',
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
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}/rest/v1/tournament',
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
  }) async {
    final ffApiRequestBody = '''
{
"name":"${playerName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createPlayerAPI',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}/rest/v1/player',
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
