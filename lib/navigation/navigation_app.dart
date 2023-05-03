import 'package:flutter/material.dart';
import 'package:flutter_testing/navigation/screen_a.dart';
import 'package:flutter_testing/navigation/screen_b.dart';
import 'package:flutter_testing/navigation/screen_c.dart';

void main() {
  runApp(const NavigationApp());
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const NavigationHome(),
        ScreenB.routeName: (context) => const ScreenB(),
      },
      onGenerateRoute: (settings) {
        // Fonction exécutée lorsque une page demandée n'existe pas (404 sur le web)

        switch (settings.name) {
          case ScreenC.routeName:
            final args = settings.arguments;

            if (args is int) {
              return MaterialPageRoute(
                builder: (context) => ScreenC(id: args),
              );
            }

            break;
        }

        return MaterialPageRoute(
          builder: (context) => Container(
            color: Colors.blueAccent,
          ),
        );
      },
    );
  }
}

class NavigationHome extends StatelessWidget {
  const NavigationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Go to Screen A"),
              onPressed: () => _goToScreenA(context),
            ),
            ElevatedButton(
              child: Text("Go to Screen B"),
              onPressed: () => _goToScreenB(context),
            ),
            ElevatedButton(
              child: Text("Go to Screen C"),
              onPressed: () => _goToScreenC(context),
            ),
          ],
        ),
      ),
    );
  }

  /*
  Il existe plusieurs manières de gérer la navigation:
  Voir également d'autres packages disponibles sur pub.dev
  */

  // Méthode 1
  void _goToScreenA(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const ScreenA();
        },
      ),
    );
  }

  // Méthode 2
  void _goToScreenB(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenB.routeName);
  }

  // Méthode 3 (la meilleure permet l'envoi de données)
  void _goToScreenC(BuildContext context) {
    // Le début de la logique se situe dans le onGeneratedRoute du widget MaterialApp
    ScreenC.navigateTo(context, 123);
  }
}
