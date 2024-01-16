import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';
import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : Auth3LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : Auth3LoginWidget(),
        ),
        FFRoute(
          name: 'Main_Notifications',
          path: '/mainNotifications',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Main_Notifications')
              : MainNotificationsWidget(),
        ),
        FFRoute(
          name: 'Main_Users',
          path: '/mainUsers',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Main_Users')
              : MainUsersWidget(),
        ),
        FFRoute(
          name: 'Main_Recent',
          path: '/mainRecent',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Main_Recent')
              : MainRecentWidget(),
        ),
        FFRoute(
          name: 'Main_Profile',
          path: '/mainProfile',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Main_Profile')
              : MainProfileWidget(),
        ),
        FFRoute(
          name: 'Main_Dashboard',
          path: '/mainDashboard',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Main_Dashboard')
              : MainDashboardWidget(),
        ),
        FFRoute(
          name: 'TransactionHistory',
          path: '/transactionHistory',
          builder: (context, params) => TransactionHistoryWidget(),
        ),
        FFRoute(
          name: 'responsive_profile',
          path: '/responsiveProfile',
          builder: (context, params) => ResponsiveProfileWidget(),
        ),
        FFRoute(
          name: 'responsive_Test',
          path: '/responsiveTest',
          builder: (context, params) => ResponsiveTestWidget(),
        ),
        FFRoute(
          name: 'Main_Admin',
          path: '/mainAdmin',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Main_Admin')
              : MainAdminWidget(),
        ),
        FFRoute(
          name: 'CreatePlayerPage',
          path: '/createPlayer',
          builder: (context, params) => CreatePlayerPageWidget(),
        ),
        FFRoute(
          name: 'CreateTournamentPage',
          path: '/createTournament',
          builder: (context, params) => CreateTournamentPageWidget(),
        ),
        FFRoute(
          name: 'LinkPlayersToTournament3rd',
          path: '/LinkPlayersToTournament3rd',
          builder: (context, params) => LinkPlayersToTournament3rdWidget(
            paramTournamentPlanUuid:
                params.getParam('paramTournamentPlanUuid', ParamType.String),
            paramTournamentName:
                params.getParam('paramTournamentName', ParamType.String),
            paramTournamentPlanName:
                params.getParam('paramTournamentPlanName', ParamType.String),
            paramTournamentPlanPhoto:
                params.getParam('paramTournamentPlanPhoto', ParamType.String),
            paramTournamentPlanStage:
                params.getParam('paramTournamentPlanStage', ParamType.int),
            paramTournamentPlanGender:
                params.getParam('paramTournamentPlanGender', ParamType.String),
            paramTournamentPlanId:
                params.getParam('paramTournamentPlanId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'CreateClubPage',
          path: '/createClub',
          builder: (context, params) => CreateClubPageWidget(),
        ),
        FFRoute(
          name: 'ListClubsPage',
          path: '/listClubs',
          builder: (context, params) => ListClubsPageWidget(),
        ),
        FFRoute(
          name: 'ListPlayersPage',
          path: '/listPlayers',
          builder: (context, params) => ListPlayersPageWidget(),
        ),
        FFRoute(
          name: 'EditTournamentPage',
          path: '/editTournament',
          builder: (context, params) => EditTournamentPageWidget(
            tournamentUuid: params.getParam('tournamentUuid', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ListTournamentsPage',
          path: '/listTournaments',
          builder: (context, params) => ListTournamentsPageWidget(),
        ),
        FFRoute(
          name: 'EditClubPage',
          path: '/editClub',
          builder: (context, params) => EditClubPageWidget(
            clubUuid: params.getParam('clubUuid', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'EditPlayerPage',
          path: '/editPlayer',
          builder: (context, params) => EditPlayerPageWidget(
            playerUuid: params.getParam('playerUuid', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'LinkPlayersToTournament1st',
          path: '/linkPlayerToTournament1st',
          builder: (context, params) => LinkPlayersToTournament1stWidget(),
        ),
        FFRoute(
          name: 'LinkPlayersToTournament2nd',
          path: '/LinkPlayersToTournament2nd',
          builder: (context, params) => LinkPlayersToTournament2ndWidget(
            tournamentUuid: params.getParam('tournamentUuid', ParamType.String),
            tournamentName: params.getParam('tournamentName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'LinkPlayersToTournament4th',
          path: '/LinkPlayersToTournament4th',
          builder: (context, params) => LinkPlayersToTournament4thWidget(
            paramTournamentPlanName:
                params.getParam('paramTournamentPlanName', ParamType.String),
            paramTournamentPlanPhoto:
                params.getParam('paramTournamentPlanPhoto', ParamType.String),
            paramTournamentPlanId:
                params.getParam('paramTournamentPlanId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'CreateTournamentEvent1st',
          path: '/CreateTournamentEvent1st',
          builder: (context, params) => CreateTournamentEvent1stWidget(),
        ),
        FFRoute(
          name: 'CreateTournamentEvent2nd',
          path: '/CreateTournamentEvent2nd',
          builder: (context, params) => CreateTournamentEvent2ndWidget(
            tournamentUuid: params.getParam('tournamentUuid', ParamType.String),
            tournamentName: params.getParam('tournamentName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'CreateTournamentEvent3rd',
          path: '/CreateTournamentEvent3rd',
          builder: (context, params) => CreateTournamentEvent3rdWidget(
            paramTournamentName:
                params.getParam('paramTournamentName', ParamType.String),
            paramTournamentPlanName:
                params.getParam('paramTournamentPlanName', ParamType.String),
            paramTournamentPlanPhoto:
                params.getParam('paramTournamentPlanPhoto', ParamType.String),
            paramTournamentPlanId:
                params.getParam('paramTournamentPlanId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'EditTournamentEvent1st',
          path: '/EditTournamentEvent1st',
          builder: (context, params) => EditTournamentEvent1stWidget(),
        ),
        FFRoute(
          name: 'EditTournamentEvent2nd',
          path: '/EditTournamentEvent2nd',
          builder: (context, params) => EditTournamentEvent2ndWidget(
            tournamentUuid: params.getParam('tournamentUuid', ParamType.String),
            tournamentName: params.getParam('tournamentName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'EditTournamentEvent3rd',
          path: '/EditTournamentEvent3rd',
          builder: (context, params) => EditTournamentEvent3rdWidget(
            paramTournamentName:
                params.getParam('paramTournamentName', ParamType.String),
            paramTournamentPlanName:
                params.getParam('paramTournamentPlanName', ParamType.String),
            paramTournamentPlanPhoto:
                params.getParam('paramTournamentPlanPhoto', ParamType.String),
            paramTournamentPlanId:
                params.getParam('paramTournamentPlanId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'EditTournamentEvent4th',
          path: '/EditTournamentEvent4th',
          builder: (context, params) => EditTournamentEvent4thWidget(
            paramTournamentName:
                params.getParam('paramTournamentName', ParamType.String),
            paramTournamentPlanName:
                params.getParam('paramTournamentPlanName', ParamType.String),
            paramTournamentPlanPhoto:
                params.getParam('paramTournamentPlanPhoto', ParamType.String),
            paramTournamentPlanId:
                params.getParam('paramTournamentPlanId', ParamType.int),
            paramEventUuid: params.getParam('paramEventUuid', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'CreateTournamentMatch1st',
          path: '/CreateTournamentMatch1st',
          builder: (context, params) => CreateTournamentMatch1stWidget(),
        ),
        FFRoute(
          name: 'CreateTournamentMatch2nd',
          path: '/CreateTournamentMatch2nd',
          builder: (context, params) => CreateTournamentMatch2ndWidget(
            tournamentUuid: params.getParam('tournamentUuid', ParamType.String),
            tournamentName: params.getParam('tournamentName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'CreateTournamentMatch3rd',
          path: '/CreateTournamentMatch3rd',
          builder: (context, params) => CreateTournamentMatch3rdWidget(
            paramTournamentName:
                params.getParam('paramTournamentName', ParamType.String),
            paramTournamentPlanName:
                params.getParam('paramTournamentPlanName', ParamType.String),
            paramTournamentPlanPhoto:
                params.getParam('paramTournamentPlanPhoto', ParamType.String),
            paramTournamentPlanId:
                params.getParam('paramTournamentPlanId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'EditTournamentMatch1st',
          path: '/EditTournamentMatch1st',
          builder: (context, params) => EditTournamentMatch1stWidget(),
        ),
        FFRoute(
          name: 'EditTournamentMatch2nd',
          path: '/EditTournamentMatch2nd',
          builder: (context, params) => EditTournamentMatch2ndWidget(
            tournamentUuid: params.getParam('tournamentUuid', ParamType.String),
            tournamentName: params.getParam('tournamentName', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'EditTournamentMatch3rd',
          path: '/EditTournamentMatch3rd',
          builder: (context, params) => EditTournamentMatch3rdWidget(
            paramTournamentName:
                params.getParam('paramTournamentName', ParamType.String),
            paramTournamentPlanName:
                params.getParam('paramTournamentPlanName', ParamType.String),
            paramTournamentPlanPhoto:
                params.getParam('paramTournamentPlanPhoto', ParamType.String),
            paramTournamentPlanId:
                params.getParam('paramTournamentPlanId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'EditTournamentMatch4th',
          path: '/EditTournamentMatch4th',
          builder: (context, params) => EditTournamentMatch4thWidget(
            paramTournamentName:
                params.getParam('paramTournamentName', ParamType.String),
            paramTournamentPlanName:
                params.getParam('paramTournamentPlanName', ParamType.String),
            paramTournamentPlanPhoto:
                params.getParam('paramTournamentPlanPhoto', ParamType.String),
            paramTournamentPlanId:
                params.getParam('paramTournamentPlanId', ParamType.int),
            paramMatchUuid: params.getParam('paramMatchUuid', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'auth_3_Create',
          path: '/auth3Create',
          builder: (context, params) => Auth3CreateWidget(),
        ),
        FFRoute(
          name: 'auth_3_Login',
          path: '/auth3Login',
          builder: (context, params) => Auth3LoginWidget(),
        ),
        FFRoute(
          name: 'auth_3_phone',
          path: '/auth3Phone',
          builder: (context, params) => Auth3PhoneWidget(),
        ),
        FFRoute(
          name: 'auth_3_verifyPhone',
          path: '/auth3VerifyPhone',
          builder: (context, params) => Auth3VerifyPhoneWidget(
            phoneNumber: params.getParam('phoneNumber', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'auth_3_ForgotPassword',
          path: '/auth3ForgotPassword',
          builder: (context, params) => Auth3ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'PDFViewer',
          path: '/pDFViewer',
          builder: (context, params) => PDFViewerWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/auth3Login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Thumbnail_v2.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
