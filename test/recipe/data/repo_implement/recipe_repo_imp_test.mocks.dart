// Mocks generated by Mockito 5.4.4 from annotations
// in recipes/test/recipe/data/repo_implement/recipe_repo_imp_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dio/dio.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:recipes/core/network/network_connection.dart' as _i7;
import 'package:recipes/recipe/data/data_source/remote_get_recipe_data_source.dart'
    as _i5;
import 'package:recipes/recipe/data/model/recipe_model.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRecipesResponseModel_1 extends _i1.SmartFake
    implements _i3.RecipesResponseModel {
  _FakeRecipesResponseModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInternetConnectionChecker_2 extends _i1.SmartFake
    implements _i4.InternetConnectionChecker {
  _FakeInternetConnectionChecker_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RemoteGetRecipeDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteGetRecipeDataSource extends _i1.Mock
    implements _i5.RemoteGetRecipeDataSource {
  MockRemoteGetRecipeDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);

  @override
  _i6.Future<_i3.RecipesResponseModel> getRecipes() => (super.noSuchMethod(
        Invocation.method(
          #getRecipes,
          [],
        ),
        returnValue: _i6.Future<_i3.RecipesResponseModel>.value(
            _FakeRecipesResponseModel_1(
          this,
          Invocation.method(
            #getRecipes,
            [],
          ),
        )),
      ) as _i6.Future<_i3.RecipesResponseModel>);
}

/// A class which mocks [NetworkConnection].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkConnection extends _i1.Mock implements _i7.NetworkConnection {
  MockNetworkConnection() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.InternetConnectionChecker get internetConnectionChecker =>
      (super.noSuchMethod(
        Invocation.getter(#internetConnectionChecker),
        returnValue: _FakeInternetConnectionChecker_2(
          this,
          Invocation.getter(#internetConnectionChecker),
        ),
      ) as _i4.InternetConnectionChecker);

  @override
  _i6.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}