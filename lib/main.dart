import 'package:firebase_auth/firebase_auth.dart';
import 'file:///C:/Users/Chris/AndroidStudioProjects/nexus_health/lib/auth/authService.dart';
import 'file:///C:/Users/Chris/AndroidStudioProjects/nexus_health/lib/screens/home.dart';
import 'file:///C:/Users/Chris/AndroidStudioProjects/nexus_health/lib/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return new SplashScreen(
//       title: new Text(
//         'Welcome In SplashScreen',
//         style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//       ),
//       seconds: 8,
//       navigateAfterSeconds: AfterSplash(),
//       image: new Image.asset(
//           'assets/gifs/loading.gif'),
//       backgroundColor: Colors.black,
//       styleTextUnderTheLoader: new TextStyle(),
//       photoSize: 150.0,
//       onClick: () => print("Flutter Egypt"),
//       loaderColor: Colors.white,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return LoginPage();
  }
}
