// ignore_for_file: inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_codecheck/data/network/dio_client.dart';

import 'dio_client_test.mocks.dart';

// モック生成用のアノテーション
@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late DioClient dioClient;

  setUp(() {
    mockDio = MockDio();
    dioClient = DioClient(dio: mockDio);
  });

  group('DioClient Test', () {
    test(
      'http call successfully',
      () async {
        final response = Response(
          requestOptions: RequestOptions(path: 'search/repositories'),
          data: {
            'items': [
              {'name': 'repo1'},
              {'name': 'repo2'}
            ]
          },
          statusCode: 200,
        );

        when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
            .thenAnswer((_) async => response);

        final result =
            await dioClient.fetch('search/repositories', {'q': 'flutter'});

        expect(result.data['items'], isNotNull);
        expect(result.data['items'].length, 2);
      },
    );

    test(
      'http call exception badResponse',
      () async {
        when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
            .thenThrow(DioException(
          requestOptions: RequestOptions(path: 'search/repositories'),
          response: Response(
            requestOptions: RequestOptions(path: 'search/repositories'),
            statusCode: 400,
          ),
          type: DioExceptionType.badResponse,
        ));

        expect(
          dioClient.fetch('search/repositories', {'q': 'flutter'}),
          throwsA(isInstanceOf<DioException>()),
        );
      },
    );

    void testException(DioExceptionType type) {
      test(
        'http call exception ${type.toString()}',
        () async {
          when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
              .thenThrow(DioException(
            requestOptions: RequestOptions(path: 'search/repositories'),
            type: type,
          ));

          expect(
            dioClient.fetch('search/repositories', {'q': 'flutter'}),
            throwsA(isInstanceOf<DioException>()),
          );
        },
      );
    }

    testException(DioExceptionType.connectionError);
    testException(DioExceptionType.connectionTimeout);
    testException(DioExceptionType.sendTimeout);
    testException(DioExceptionType.receiveTimeout);
    testException(DioExceptionType.cancel);
    testException(DioExceptionType.badCertificate);
    testException(DioExceptionType.unknown);
  });
}
