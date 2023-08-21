import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.splashController});
  final SplashController splashController;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: Text(
                    'Bíblia\nAve Maria',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 64),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<String>(
                      stream: widget.splashController.initBooks(),
                      builder: (context, snapshot) {
                        if (snapshot.data == 'Tudo pronto') {
                          Future.delayed(const Duration(milliseconds: 1000)).whenComplete(() {
                            Modular.to.pushReplacementNamed('/books');
                          });
                        }
                        return Text(snapshot.data ?? '');
                      },
                    ),
                  ),
                  LinearProgressIndicator(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'https://www.bibliacatolica.com.br/biblia-ave-maria',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
