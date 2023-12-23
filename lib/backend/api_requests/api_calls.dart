import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

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
  static EditClubAPICall editClubAPICall = EditClubAPICall();
  static EditTournamentAPICall editTournamentAPICall = EditTournamentAPICall();
  static EditTournamentPlanAPICall editTournamentPlanAPICall =
      EditTournamentPlanAPICall();
  static CreateTournamentAPICall createTournamentAPICall =
      CreateTournamentAPICall();
  static CreateTournamentPlayerAPICall createTournamentPlayerAPICall =
      CreateTournamentPlayerAPICall();
  static CreatePlayerAPICall createPlayerAPICall = CreatePlayerAPICall();
  static EditPlayerAPICall editPlayerAPICall = EditPlayerAPICall();
  static CreateTournamentPlanAPICall createTournamentPlanAPICall =
      CreateTournamentPlanAPICall();
  static PopulatePlanPlayersAPICall populatePlanPlayersAPICall =
      PopulatePlanPlayersAPICall();
  static DeletePlanPlayerAPICall deletePlanPlayerAPICall =
      DeletePlanPlayerAPICall();
  static PopulatePlayerStagesCall populatePlayerStagesCall =
      PopulatePlayerStagesCall();
  static PopulateClubAsLocationsCall populateClubAsLocationsCall =
      PopulateClubAsLocationsCall();
  static PopulatePlayerRanksCall populatePlayerRanksCall =
      PopulatePlayerRanksCall();
  static PopulateClubsCall populateClubsCall = PopulateClubsCall();
  static PopulateClubByUuidCall populateClubByUuidCall =
      PopulateClubByUuidCall();
  static PopulateTournamentByUuidCall populateTournamentByUuidCall =
      PopulateTournamentByUuidCall();
  static PopulateTournamentPlanByUuidCall populateTournamentPlanByUuidCall =
      PopulateTournamentPlanByUuidCall();
  static PopulatePlayerByStageAndGenderCall populatePlayerByStageAndGenderCall =
      PopulatePlayerByStageAndGenderCall();
  static PopulatePlayerByUuidCall populatePlayerByUuidCall =
      PopulatePlayerByUuidCall();
  static PopulateTournamentsCall populateTournamentsCall =
      PopulateTournamentsCall();
  static PopulatePlayersCall populatePlayersCall = PopulatePlayersCall();
  static PlayerPdfApiCall playerPdfApiCall = PlayerPdfApiCall();
  static PopulatePlayersByStageCall populatePlayersByStageCall =
      PopulatePlayersByStageCall();
  static PopulateTournamentPlansCall populateTournamentPlansCall =
      PopulateTournamentPlansCall();
}

class CreateClubAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? location = '',
    String? contactPerson = '',
    String? contactEmail = '',
    String? photoUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "location": "${location}",
  "contact_person": "${contactPerson}",
  "contact_email": "${contactEmail}",
  "photo_url": "${photoUrl}"
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
}

class EditClubAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? location = '',
    String? contactPerson = '',
    String? contactEmail = '',
    String? photoUrl = '',
    String? uuid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "location": "${location}",
  "contact_person": "${contactPerson}",
  "contact_email": "${contactEmail}",
  "photo_url": "${photoUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editClubAPI',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}club?uuid=eq.${uuid}',
      callType: ApiCallType.PATCH,
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
}

class EditTournamentAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? uuid = '',
    String? year = '',
    String? sponsors = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "sponsors": "${sponsors}",
  "year": "${year}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editTournamentAPI',
      apiUrl:
          '${SquashManagementAPIGroupGroup.baseUrl}tournament?uuid=eq.${uuid}',
      callType: ApiCallType.PATCH,
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
}

class EditTournamentPlanAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
    int? location,
    String? dateFrom = '',
    String? dateTo = '',
    String? gender = '',
    int? stage,
    String? photoUrl = '',
    String? uuid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tournament_plan_name": "${name}",
  "club_id": ${location},
  "date_from": "${dateFrom} 00:00:00.00000+00",
  "date_to": "${dateTo} 00:00:00.00000+00",
  "gender": "${gender}",
  "plan_stage": ${stage},
  "photo_url": "${photoUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editTournamentPlanAPI',
      apiUrl:
          '${SquashManagementAPIGroupGroup.baseUrl}tournament_plan?uuid=eq.${uuid}',
      callType: ApiCallType.PATCH,
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
}

class CreateTournamentAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? sponsors = '',
    String? year = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${name}",
  "sponsors": "${sponsors}",
  "year": "${year}"
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
}

class CreateTournamentPlayerAPICall {
  Future<ApiCallResponse> call({
    int? tournamentPlanId,
    int? playerId,
  }) async {
    final ffApiRequestBody = '''
{
  "tournament_plan_id": ${tournamentPlanId},
  "player_id": ${playerId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createTournamentPlayerAPI',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}tournament_player',
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
}

class CreatePlayerAPICall {
  Future<ApiCallResponse> call({
    String? playerName = '',
    String? dateOfBirth = '',
    int? rank,
    int? stage,
    String? gender = '',
    String? playerBio = '',
    String? photoUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${playerName}",
  "date_of_birth": "${dateOfBirth} 00:00:00.00000+00",
  "rank": ${rank},
  "stage": ${stage},
  "gender": "${gender}",
  "player_bio": "${playerBio}",
  "photo_url": "${photoUrl}"
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
}

class EditPlayerAPICall {
  Future<ApiCallResponse> call({
    String? playerName = '',
    String? dateOfBirth = '',
    int? rank,
    int? stage,
    String? gender = '',
    String? playerBio = '',
    String? photoUrl = '',
    String? uuid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${playerName}",
  "date_of_birth": "${dateOfBirth} 00:00:00.00000+00",
  "rank": ${rank},
  "stage": ${stage},
  "gender": "${gender}",
  "player_bio": "${playerBio}",
  "photo_url": "${photoUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editPlayerAPI',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}player?uuid=eq.${uuid}',
      callType: ApiCallType.PATCH,
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
}

class CreateTournamentPlanAPICall {
  Future<ApiCallResponse> call({
    int? tournamentId,
    String? tournamentPlanName = '',
    String? dateFrom = '',
    String? dateTo = '',
    int? clubId,
    String? photoUrl = '',
    int? planStage,
    String? gender = '',
  }) async {
    final ffApiRequestBody = '''
{
  "tournament_id": ${tournamentId},
  "tournament_plan_name": "${tournamentPlanName}",
  "date_from": "${dateFrom} 00:00:00.00000+00",
  "date_to": "${dateTo} 00:00:00.00000+00",
  "club_id": ${clubId},
  "photo_url": "${photoUrl}",
  "plan_stage": ${planStage},
  "gender": "${gender}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createTournamentPlanAPI',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}tournament_plan',
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
}

class PopulatePlanPlayersAPICall {
  Future<ApiCallResponse> call({
    int? inputid,
  }) async {
    final ffApiRequestBody = '''
{
  "inputid": ${inputid}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'populatePlanPlayersAPI',
      apiUrl:
          '${SquashManagementAPIGroupGroup.baseUrl}rpc/populatetournamentplayers',
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
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
  List? planPlayers(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class DeletePlanPlayerAPICall {
  Future<ApiCallResponse> call({
    String? tournamentPlanId = '',
    String? playerId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deletePlanPlayerAPI',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}tournament_player',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Prefer': 'return=representation',
      },
      params: {
        'tournament_plan_id': tournamentPlanId,
        'player_id': playerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[0].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[0].name''',
      ));
  List? planPlayers(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
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
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PopulateClubAsLocationsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'populateClubAsLocations',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}club?select=*',
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
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      alwaysAllowBody: false,
    );
  }

  List? id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
  List? name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?;
}

class PopulateClubsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'populateClubs',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}club?select=*',
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
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? clubs(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class PopulateClubByUuidCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'populateClubByUuid',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}club?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
      },
      params: {
        'uuid': uuid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].name''',
      ));
  dynamic? location(dynamic response) => getJsonField(
        response,
        r'''$[:].location''',
      );
  dynamic? contact(dynamic response) => getJsonField(
        response,
        r'''$[:].contact_person''',
      );
  dynamic? email(dynamic response) => getJsonField(
        response,
        r'''$[:].contact_email''',
      );
  dynamic? photo(dynamic response) => getJsonField(
        response,
        r'''$[:].photo_url''',
      );
}

class PopulateTournamentByUuidCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'populateTournamentByUuid',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}tournament?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
      },
      params: {
        'uuid': uuid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].name''',
      ));
  int? tournamentId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? year(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].year''',
      ));
  String? sponsors(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].sponsors''',
      ));
}

class PopulateTournamentPlanByUuidCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'populateTournamentPlanByUuid',
      apiUrl:
          '${SquashManagementAPIGroupGroup.baseUrl}tournament_plan?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? tournamentPlanId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  String? tournamentPlanName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].tournament_plan_name''',
      ));
  int? tournamentPlanLocation(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].club_id''',
      ));
  String? tournamentPlanPhoto(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].photo_url''',
      ));
  String? tournamentPlanFrom(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].date_from''',
      ));
  String? tournamentPlanTo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].date_to''',
      ));
  int? tournamentPlanStage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].plan_stage''',
      ));
  String? tournamentPlanGender(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].gender''',
      ));
  String? selectedPlanUuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].uuid''',
      ));
}

class PopulatePlayerByStageAndGenderCall {
  Future<ApiCallResponse> call({
    String? stage = '',
    String? gender = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'populatePlayerByStageAndGender',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}player?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
      },
      params: {
        'stage': stage,
        'gender': gender,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? players(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PopulatePlayerByUuidCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'populatePlayerByUuid',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}player?select=*',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
      },
      params: {
        'uuid': uuid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].name''',
      ));
  String? birthDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].date_of_birth''',
      ));
  int? rank(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].rank''',
      ));
  int? stage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].stage''',
      ));
  String? bio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].player_bio''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].gender''',
      ));
  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].photo_url''',
      ));
}

class PopulateTournamentsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'populateTournaments',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}tournament?select=*',
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
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? tournaments(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class PopulatePlayersCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'populatePlayers',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}player?select=*',
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
      alwaysAllowBody: false,
    );
  }

  List? players(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PlayerPdfApiCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'playerPdfApi',
      apiUrl: '${SquashManagementAPIGroupGroup.baseUrl}pdf_report?select=*',
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
      alwaysAllowBody: false,
    );
  }

  List? records(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List<String>? playerName(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? clubName(dynamic response) => (getJsonField(
        response,
        r'''$[:].club_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? playerRank(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_rank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? playerStage(dynamic response) => (getJsonField(
        response,
        r'''$[:].player_stage''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? tournamentPlanName(dynamic response) => (getJsonField(
        response,
        r'''$[:].tournament_plan_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? tournamentName(dynamic response) => (getJsonField(
        response,
        r'''$[:].tournament_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PopulatePlayersByStageCall {
  Future<ApiCallResponse> call({
    int? stage,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'populatePlayersByStage',
      apiUrl:
          '${SquashManagementAPIGroupGroup.baseUrl}player?select=*&stage=eq.${stage}',
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
      alwaysAllowBody: false,
    );
  }

  List? players(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class PopulateTournamentPlansCall {
  Future<ApiCallResponse> call({
    String? tournamentId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'populateTournamentPlans',
      apiUrl:
          '${SquashManagementAPIGroupGroup.baseUrl}tournament_plan?select=*,tournament(*)',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhob2hzZ2d0cWNxYXpxdm9rdWF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTEzODIyMTcsImV4cCI6MjAwNjk1ODIxN30.sD6yRxkNRB9-lRw3s5KzY8zKe6GbqiTH77Dr4xCEh9I',
      },
      params: {
        'tournament_id': tournamentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? tournamentPlans(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
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
