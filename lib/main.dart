import 'package:flutter/material.dart';
import 'pages/registro.dart';
import 'pages/pagina_inicial.dart';
import 'pages/login.dart';

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
        '/login': (context) => const LoginPage(),
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
        child: Stack(
          children: [
            // PageView de pantalla completa
            Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => currentPage = index);
                    },
                    children: [
                      _pagina1(),
                      _pagina2(),
                      _pagina3(),
                    ],
                  ),
                ),
                _indicadorPaginas(),
                Padding(
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
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      "Comenzar",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
            // Botón Saltar siempre visible arriba a la derecha
            Positioned(
              top: 16,
              right: 16,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  "Saltar",
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------- PÁGINA 1 -----------------------
  Widget _pagina1() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.directions_car, size: 80, color: Colors.black),
              const SizedBox(height: 20),
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
                "Tu próximo coche, a un toque de distancia.\nEncuentra, compra o vende coches usando fácilmente en nuestra plataforma",
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
        ),
      ),
    );
  }

  // ----------------------- PÁGINA 2 -----------------------
  Widget _pagina2() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.thumb_up, size: 90, color: Colors.black87),
              const SizedBox(height: 20),
              const Text(
                "¿Qué te ofrecemos en neumaTik?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Aquí puedes agregar los textos y bullets de tu Figma
              _bullet("Eficiencia y transparencia en cada compra-venta vehicular."),
              _bullet("Recomienda y categoriza la mejor opción de compra."),
              _bullet("Datos reales de vehículos que veas."),
              _bullet("Evita estafas."),
              const SizedBox(height: 20),
              const Text(
                "Y muchas opciones más",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ----------------------- PÁGINA 3 -----------------------
  Widget _pagina3() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.directions_car_filled, size: 90, color: Colors.black87),
              const SizedBox(height: 20),
              const Text(
                "¿Cómo funciona el OBD2?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _bullet("On Board Diagnostic, es una herramienta que se utiliza para recopilar información verídica del automóvil y tiene un costo mínimo."),
              _bullet("Necesario para los vendedores."),
              _bullet("Tener conector wifi o bluetooth de OBD2 para la información relevante."),
              _bullet("Imágenes actuales del vehículo."),
              const SizedBox(height: 20),
              const Text(
                "¡EMPIEZA AHORA!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para bullets
  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
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

}
