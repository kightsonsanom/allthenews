import 'package:allthenews/src/domain/common/usecase/get_page_use_case.dart';
import 'package:allthenews/src/domain/communication/api_exception.dart';
import 'package:allthenews/src/domain/model/article.dart';
import 'package:allthenews/src/domain/settings/popular_news_criterion.dart';
import 'package:allthenews/src/domain/settings/settings_repository.dart';
import 'package:allthenews/src/ui/pages/dashboard/news/articles_mapper.dart';
import 'package:allthenews/src/ui/pages/dashboard/news/most_popular/most_popular_news_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../common/change_notifier_test_util.dart';
import '../fake_popular_news_criterion_message_mapper.dart';
import 'most_popular_news_notifier_test.mocks.dart';

@GenerateMocks([GetPageUseCase, SettingsRepository])
void main() {
  late MostPopularNewsNotifier mostPopularNewsNotifier;
  late MockGetPageUseCase<Article> mockGetPageUseCase;
  late MockSettingsRepository mockSettingsRepository;
  FakePopularNewsCriterionMessageMapper fakePopularNewsCriterionMessageMapper;

  setUp(() {
    mockSettingsRepository = MockSettingsRepository();
    mockGetPageUseCase = MockGetPageUseCase();
    fakePopularNewsCriterionMessageMapper = FakePopularNewsCriterionMessageMapper();
    mostPopularNewsNotifier = MostPopularNewsNotifier(
      mockGetPageUseCase,
      SecondaryNewsViewEntityMapper(),
      mockSettingsRepository,
      fakePopularNewsCriterionMessageMapper,
    );
  });

  group('notifier tests', () {
    test(
      'should emit loaded first page of most popular articles',
      () async {
        when(mockSettingsRepository.getPopularNewsCriterion())
            .thenAnswer((_) async => PopularNewsCriterion.emailed);
        when(mockGetPageUseCase(any)).thenAnswer((_) async => []);

        mostPopularNewsNotifier.verifyStateInOrder(
          testFunction: mostPopularNewsNotifier.loadFirstPage,
          matchersMethods: [
            () {
              expect(mostPopularNewsNotifier.state.isLoading, true);
              expect(mostPopularNewsNotifier.state.paginatedItems, isNull);
              expect(mostPopularNewsNotifier.state.error, isNull);
              expect(
                  mostPopularNewsNotifier.mostPopularViewState.mostPopularNewsPageTitle, isEmpty);
            },
            () {
              expect(mostPopularNewsNotifier.state.isLoading, true);
              expect(mostPopularNewsNotifier.state.paginatedItems, isNull);
              expect(mostPopularNewsNotifier.state.error, isNull);
              expect(mostPopularNewsNotifier.mostPopularViewState.mostPopularNewsPageTitle,
                  isNotEmpty);
            },
            () {
              expect(mostPopularNewsNotifier.state.isLoading, false);
              expect(mostPopularNewsNotifier.state.paginatedItems, isNotNull);
              expect(mostPopularNewsNotifier.state.error, isNull);
              expect(mostPopularNewsNotifier.mostPopularViewState.mostPopularNewsPageTitle,
                  isNotEmpty);
            },
          ],
        );
      },
    );

    test(
      'should emit error state when fetching news failed',
      () async {
        when(mockSettingsRepository.getPopularNewsCriterion())
            .thenAnswer((_) async => PopularNewsCriterion.emailed);
        when(mockGetPageUseCase(any)).thenAnswer((_) async => Future.error(UnknownException()));

        mostPopularNewsNotifier.verifyStateInOrder(
          testFunction: mostPopularNewsNotifier.loadFirstPage,
          matchersMethods: [
            () {
              expect(mostPopularNewsNotifier.state.isLoading, true);
              expect(mostPopularNewsNotifier.state.paginatedItems, isNull);
              expect(mostPopularNewsNotifier.state.error, isNull);
              expect(
                  mostPopularNewsNotifier.mostPopularViewState.mostPopularNewsPageTitle, isEmpty);
            },
            () {
              expect(mostPopularNewsNotifier.state.isLoading, true);
              expect(mostPopularNewsNotifier.state.paginatedItems, isNull);
              expect(mostPopularNewsNotifier.state.error, isNull);
              expect(mostPopularNewsNotifier.mostPopularViewState.mostPopularNewsPageTitle,
                  isNotEmpty);
            },
            () {
              expect(mostPopularNewsNotifier.state.isLoading, false);
              expect(mostPopularNewsNotifier.state.paginatedItems, isNull);
              expect(mostPopularNewsNotifier.state.error, isA<UnknownException>());
              expect(mostPopularNewsNotifier.mostPopularViewState.mostPopularNewsPageTitle,
                  isNotEmpty);
            },
          ],
        );
      },
    );
  });
}
