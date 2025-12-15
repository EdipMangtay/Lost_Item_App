import 'package:flutter/material.dart';
import 'package:campus_lost_found/app/router.dart';
import 'package:campus_lost_found/app/theme/app_theme.dart';

class App extends StatelessWidget {
  final bool firebaseInitialized;
  final String? firebaseError;

  const App({
    super.key,
    required this.firebaseInitialized,
    this.firebaseError,
  });

  @override
  Widget build(BuildContext context) {
    // Show error screen if Firebase initialization failed
    if (!firebaseInitialized) {
      return MaterialApp(
        title: 'Campus Lost & Found',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: _FirebaseErrorScreen(error: firebaseError),
      );
    }

    return MaterialApp.router(
      title: 'Campus Lost & Found',
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class _FirebaseErrorScreen extends StatelessWidget {
  final String? error;

  const _FirebaseErrorScreen({this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 24),
              Text(
                'Firebase Başlatma Hatası',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Uygulama Firebase\'i başlatamadı. Lütfen internet bağlantınızı kontrol edin ve uygulamayı yeniden başlatın.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              if (error != null) ...[
                const SizedBox(height: 24),
                Card(
                  color: Colors.red.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hata Detayı:',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          error!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () {
                  // Restart the app
                  // Note: In production, you might want to use a package like restart_app
                  // For now, we'll just show a message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Lütfen uygulamayı kapatıp yeniden açın'),
                    ),
                  );
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Yeniden Dene'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

