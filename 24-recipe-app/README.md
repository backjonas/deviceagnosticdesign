# recipe-app

## Application description

The application consists of recipes, with each recipe belonging to some category. The homepage shows some featured categories and a featured recipe at `/`. A list of all categories can be found at `category`, with a list of all recipes for a specific category at `/category/:categoryId`. Specific recipes are found at `/recipe/:recipeId` The recipes and categories are fetched from a firebase backend. Recipes can be searched by visiting `/search/:query`, or simply by using the search bar at the top of the application.

## Database structure

The database has the following structure

```
category {
  name: String
  picture: String
}

recipe {
  category_id: String
  name: String
  picture: String
  ingredients: String
  steps: String
}
```

## Dependencies

The project has the following dependencies (include these in `pubspec.yaml`)

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  go_router: ^12.0.1
  firebase_core: ^2.20.0
  cloud_firestore: ^4.12.1
```
