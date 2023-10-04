# quiz_app

The application consists of a list of topics, with a number of questions belonging to each topic. The list of topics is visible at `/`, and questions can be found at `/question/:topicId`, where `topicId` is the id of the topic the question belongs to. The topics and questions are fetched from `https://dad-quiz-api.deno.dev/topics/4/questions`. The correct number of answers are persisted using SharedPreferences, and the number of correct answers can be found at `/stats`

## Dependencies

The project has the following dependencies (include these in `pubspec.yaml`)

```
dependencies:
  flutter:
    sdk: flutter

  go_router: ^11.1.2
  flutter_riverpod: ^2.4.1
  http: ^1.1.0
  shared_preferences: ^2.2.1
```
