// Mocks generated by Mockito 5.2.0 from annotations
// in dig_in/test/domain/restaurants/get_most_popular_restaurants_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dig_in/base/base_result_repository.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'get_most_popular_restaurants_use_case_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeBaseResultRepository_0 extends _i1.Fake
    implements _i2.BaseResultRepository {}

/// A class which mocks [RestaurantsRepositoryTest].
///
/// See the documentation for Mockito's code generation for more information.
class MockRestaurantsRepositoryTest extends _i1.Mock
    implements _i3.RestaurantsRepositoryTest {
  MockRestaurantsRepositoryTest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.BaseResultRepository> getRestaurants() =>
      (super.noSuchMethod(Invocation.method(#getRestaurants, []),
              returnValue: Future<_i2.BaseResultRepository>.value(
                  _FakeBaseResultRepository_0()))
          as _i4.Future<_i2.BaseResultRepository>);
}
