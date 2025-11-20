import 'package:esodecarros/pages/chat.dart';
import 'package:flutter/material.dart';
import 'package:esodecarros/pages/perfil_vendedor.dart';


class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Mi Perfil",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // FOTO DEL USUARIO
            Stack(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage("assets/imagenes/perfil.jpg"),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // NOMBRE
            const Text(
              "Luis Urquiaga",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // CORREO
            const Text(
              "luis.urquiaga@gmail.com",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            // OPCIONES DEL PERFIL
            _opcion(
              icono: Icons.store,
              texto: "Mi Perfil de Vendedor",
              color: Colors.blue.shade200,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PerfilVendedor()),
                );
              },
            ),
            _opcion(
              icono: Icons.directions_car,
              texto: "Mis Vehículos en Ventas",
              color: Colors.blue.shade200,
              onTap: () {},
            ),
            _opcion(
              icono: Icons.favorite,
              texto: "Mis Favoritos",
              color: const Color.fromARGB(255, 60, 135, 196),
              onTap: () {},
            ),
            _opcion(
              icono: Icons.chat,
              texto: "Chats",
              color: Colors.blue.shade200,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PantallaChats()),
                );
              },
            ),
            _opcion(
              icono: Icons.analytics,
              texto: "Diagnóstico OBD2",
              color: Colors.amber.shade200,
              onTap: () {},
            ),
            _opcion(
              icono: Icons.settings,
              texto: "Configuración de la Cuenta",
              color: Colors.blue.shade200,
              onTap: () {},
            ),

            const SizedBox(height: 30),

            // BOTÓN CERRAR SESIÓN
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade200,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text(
                "Cerrar Sesión",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  // WIDGET REUTILIZABLE PARA LOS BOTONES
  Widget _opcion({
    required IconData icono,
    required String texto,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              children: [
                Icon(icono, color: Colors.black, size: 28),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    texto,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
