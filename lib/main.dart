import 'package:flutter/material.dart';
import 'pages/registro.dart';
import 'pages/pagina_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/registro': (context) => const RegistroPage(),
        '/inicio': (context) => const PantallaInicial(),
      },

      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 🟦 Botón SALTAR en la parte superior derecha
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registro');
                    },
                    child: const Text(
                      "Saltar",
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            // 🟡 Páginas del onboarding
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                children: [_pagina1(), _pagina2(), _pagina3()],
              ),
            ),

            // 🔵 Indicador de páginas
            _indicadorPaginas(),

            // 🟣 Botón comenzar
            _botonComenzar(),
          ],
        ),
      ),
    );
  }

  // ----------------------- PÁGINA 1 -----------------------
  Widget _pagina1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ICONO SUPERIOR
          const Icon(Icons.directions_car, size: 80, color: Colors.black),

          const SizedBox(height: 20),

          // IMAGEN DE PRESENTACIÓN
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/imagenes/auto.png",
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "Bienvenidos a neumaTik",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          const Text(
            "Tu próximo coche, a un toque de distancia.\n"
            "Encuentra, compra o vende coches usando fácilmente en nuestra plataforma",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),

          const SizedBox(height: 15),

          const Text(
            "Con la innovación del uso del OBD2",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // ----------------------- PÁGINA 2 -----------------------
  Widget _pagina2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.thumb_up, size: 90, color: Colors.black87),
          SizedBox(height: 20),
          Text(
            "¿Qué te ofrecemos en neumaTik?",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ----------------------- PÁGINA 3 -----------------------
  Widget _pagina3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.directions_car_filled, size: 90, color: Colors.black87),
          SizedBox(height: 20),
          Text(
            "¿Cómo funciona el OBD2?",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ----------------------- INDICADOR -----------------------
  Widget _indicadorPaginas() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: currentPage == index ? 20 : 8,
          decoration: BoxDecoration(
            color: currentPage == index
                ? Colors.lightBlueAccent
                : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  // ----------------------- BOTÓN COMENZAR -----------------------
  Widget _botonComenzar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/registro');
        },
        child: const Text(
          "Comenzar",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
