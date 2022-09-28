# flutter_skeleton

A basic flutter project with drift database, retrofit/dio rest api and bloc state management.

## Getting Started

The Skeleton contains the minimal implementation required to create a new project. The repository
code is preloaded with some basic components like basic app architecture, app theme and required
dependencies to create a new project. By using this code as standard initializer, we can have same
patterns in all the projects that will inherit it. This will also help in reducing setup &
development time by allowing you to use same code pattern and avoid re-writing from scratch.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/paricleu/flutter_skeleton.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

This project uses several packages that work with code generation, execute the following command to
generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

**Step 4:**

This project also utilizes git hooks which validate your git commit/push commands. Execute the
following command to activate the git hooks on your local machine:

```
git config core.hooksPath .githooks/
```

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Database](https://github.com/simolus3/drift)
* [Bloc (flutter_bloc)](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc) (State
  Management)
* //[Logging] (TODO)
* [Json Serialization](https://github.com/dart-lang/json_serializable)

### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- data/
|- feature/
|- util/
|- app.dart
main.dart
main_dev.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
2- data - Contains the data layer of your project, includes directories for local, network and shared pref/cache.
4- feature Contains all the ui of your project, contains sub directory for each screen.
5- util Contains the utilities/common functions of your application.
8- app.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```
