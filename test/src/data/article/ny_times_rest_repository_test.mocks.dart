// Mocks generated by Mockito 5.0.9 from annotations
// in allthenews/test/src/data/article/ny_times_rest_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:allthenews/src/data/communication/api/http_client.dart' as _i2;
import 'package:allthenews/src/data/communication/api/request.dart' as _i4;
import 'package:allthenews/src/domain/settings/app_theme.dart' as _i7;
import 'package:allthenews/src/domain/settings/popular_news_criterion.dart'
    as _i6;
import 'package:allthenews/src/domain/settings/settings_repository.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [HttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i2.HttpClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> get(_i4.Request? request) =>
      (super.noSuchMethod(Invocation.method(#get, [request]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
}

/// A class which mocks [SettingsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingsRepository extends _i1.Mock
    implements _i5.SettingsRepository {
  MockSettingsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> savePopularNewsCriterion(
          _i6.PopularNewsCriterion? popularNewsCriterion) =>
      (super.noSuchMethod(
          Invocation.method(#savePopularNewsCriterion, [popularNewsCriterion]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
  @override
  _i3.Future<_i6.PopularNewsCriterion> getPopularNewsCriterion() =>
      (super.noSuchMethod(Invocation.method(#getPopularNewsCriterion, []),
              returnValue: Future<_i6.PopularNewsCriterion>.value(
                  _i6.PopularNewsCriterion.viewed))
          as _i3.Future<_i6.PopularNewsCriterion>);
  @override
  _i3.Stream<_i6.PopularNewsCriterion> getPopularNewsCriterionStream() =>
      (super.noSuchMethod(Invocation.method(#getPopularNewsCriterionStream, []),
              returnValue: Stream<_i6.PopularNewsCriterion>.empty())
          as _i3.Stream<_i6.PopularNewsCriterion>);
  @override
  _i3.Future<void> saveTheme(_i7.AppTheme? theme) =>
      (super.noSuchMethod(Invocation.method(#saveTheme, [theme]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
  @override
  _i3.Future<_i7.AppTheme> getTheme() =>
      (super.noSuchMethod(Invocation.method(#getTheme, []),
              returnValue: Future<_i7.AppTheme>.value(_i7.AppTheme.light))
          as _i3.Future<_i7.AppTheme>);
}