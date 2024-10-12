import 'package:dio/dio.dart';
import 'package:recipes/core/error/exeptions.dart';
import 'package:recipes/core/resources/urls.dart';
import 'package:recipes/recipe/data/model/recipe_model.dart';

class RemoteGetRecipeDataSource {
  final Dio dio;
  RemoteGetRecipeDataSource({
    required this.dio,
  });

  Future<RecipesResponseModel> getRecipes() async {
    try {
      Response response = await dio.get(AppUrls.getRecipesUrl,
          options: Options().copyWith(
            validateStatus: (int? status) {
              return status != null && status < 500;
            },
          ));
      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        RecipesResponseModel recipesResponseModel =
            RecipesResponseModel.fromJson(response.data);
        return recipesResponseModel;
      } else {
        throw ServerExeption();
      }
    } catch (e) {
      print(e);
      throw ServerExeption();
    }
  }
}
