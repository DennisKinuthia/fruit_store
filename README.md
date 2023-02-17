# Fruit Store

Three screens for a sample fruit ecommerce store built using flutter for educational purposes onyl.

## How Test Manually

### Prerequisite
1. Flutter SDK
2. Text Editor or IDE
3. Virtual or physical devices

### Packages
1. GoRouter
2. Flutter Riverpod
3. RxDart

### Steps
1. Clone this repository
2. Run flutter pub get to install dependencies
3. Connect a physical or virtual device 
4. If running on IOS device open a terminal and navigate to the ios folder then run `pod install`
5. Press f5 to run the app on the connected device



## Awesome Feature


### 1. Flutter Widget Binding
`WidgetsFlutterBinding` is a singleton( a class that cannot be instantiated. This is achieved by defining a class with a private constructor) class in Flutter framework which binds the framework to the underlying platform and provides an interface to the platform services. It acts as the glue between the Flutter framework and the Flutter engine, allowing the framework to interact with the underlying platform's services such as the scheduler, painting, gestures, etc.

### 2. Custom Error Handling
The Flutter framework catches errors that occur during callbacks triggered by the framework itself, including errors encountered during the build, layout, and paint phases. Errors that don’t occur within Flutter’s callbacks can’t be caught by the framework, but you can handle them by setting up an error handler on the PlatformDispatcher. All errors caught by Flutter are routed to the FlutterError.onError handler. By default, this calls FlutterError.presentError, which dumps the error to the device logs. When running from an IDE, the inspector overrides this behavior so that errors can also be routed to the IDE’s console, allowing you to inspect the objects mentioned in the message.

### 3. Material App restorationScopeId
 The MaterialApp widget in Flutter can be used to define the top-level widget of an application that uses Material Design. The MaterialApp widget includes a property called restorationScopeId, which can be used to specify a unique identifier for the application's restoration scope. Restoration refers to the process of preserving the state of an application across multiple sessions. In Flutter, the restorationScopeId property allows the framework to keep track of the state of the application and to restore that state if necessary. By specifying a unique restorationScopeId, you can ensure that the state of your application is not mixed up with other applications or with other instances of your application that are running at the same time. It is recommended to set the restorationScopeId property for applications that support restoration. This helps ensure that the state of the application is properly restored in the event of a system interruption, such as a device restart or an application crash. The value of restorationScopeId should be unique for each application and should be set consistently across all instances of the application. This can be achieved by using a constant string or by generating a unique identifier based on the application's package name and other metadata.

### 4. Material App onGenerateTitle
If non-null this callback function is called to produce the app's title string, otherwise `title` is used. The `onGenerateTitle` context parameter includes the `WidgetsApp`'s `Localizations` widget so that this callback can be used to produce a localized title. This callback function must not return null. The `onGenerateTitle` callback is called each time the `WidgetsApp` rebuilds. This value is passed unmodified to `WidgetsApp.onGenerateTitle`.

### 5. Project Structure
This app uses feature first app structuring where each feature is contained within its own folder. Every feature has a `domain` folder which contains the data models, an `application` folder which contains services, a `data` folder that contains repositories( fake repositories mimic real server requests) and a `presentation` folder that contains UI components. This arrangement allows from proper separation of concern preventing UI code from directly communicating with the data code.

### 6. Riverpod for state management
Riverpod is a powerful tool for state management. It is built to improve on the provider package. It uses providers, declared globally to allow access from anywhere in the app, that create accessibility to state data.


## Screenshots
<img width="330" alt="Screen Shot 2023-02-17 at 17 52 30" src="https://user-images.githubusercontent.com/98651593/219674101-9a7a7e6d-faf3-4432-85bc-6a55c51e4e13.png">
<img width="330" alt="Screen Shot 2023-02-17 at 17 52 41" src="https://user-images.githubusercontent.com/98651593/219674159-237abb62-2f25-4d5c-96ef-d28efb532850.png">

