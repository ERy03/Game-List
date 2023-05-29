# Game_list

Flutter project that utilizes:
- RAWG
- Bloc

## Getting Started
1. Clone the repo
2. Create a `secret.dart` file inside lib folder like this:
```dart
const apiKey = 'YOUR_API_KEY';
```
You can get your api key from [RAWG](https://rawg.io/apidocs)

3. Run `flutter pub get`
4. Run `flutter run`

## Contributing
Pull requests are welcome. Please create a new branch and submit a pull request for review.
## TODO
- [ ] Localize the app (Use something like easy_localization)
- [ ] Add login functionality (firebase auth)
- [ ] Add favorites functionality
- [ ] Add search functionality
- [ ] Add game details page
- [ ] Add SNS sharing functionality
- [ ] Add pagination for the all games list

## Learning points

### How does Bloc work?
Blocs relies on events and states. Events are the triggers that will change the state of the bloc. States are the result of the event.

ex.
1. User taps on a button to get a list of games
2. Event is triggered
3. Bloc requests the data and emits a state
4. View is listening to the state and updates the UI

 ### Bloc components
- Bloc
- Event
- State

### Bloc Widgets

#### BlocProvider / MultiBlocProvider
It is a widget that provides a bloc to its children. It is used at the top of the widget tree.
Use MultiBlocProvider if you have multiple blocs.

#### RepositoryProvider / MultiRepositoryProvider
It is a widget that provides a repository to its children. Normally, you will use this to create an instance of the repository and provide it to the BlocProvider.

#### BlocListener
It is a widget that listens to changes in the bloc. It is normally used to perform side effects such as navigation, showing a dialog, etc. This widget does not rebuild the UI when a state changes.

#### BlocBuilder
It is a widget that rebuilds the UI based on the state changes.

#### BlocConsumer
It is a widget that combines BlocListener and BlocBuilder. It is used when you need to perform side effects and rebuild the UI based on the state changes.

#### BlocSelector
A widget that filters updates by selecting a new value based on the current bloc state.
