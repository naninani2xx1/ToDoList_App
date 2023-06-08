import 'package:to_do_list/export.dart';

abstract class AppNavigator {
  /// Pushes the [RecipesListPage] to the navigation stack
  // void pushRecipeDetails(RecipeDetailsArgs args);
}

class AppNavigatorImpl implements AppNavigator {
  AppNavigatorImpl(this.context);

  final BuildContext context;
}
