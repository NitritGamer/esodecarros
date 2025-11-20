import 'package:flutter/material.dart';
import 'package:esodecarros/pages/pagina_inicial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _claveController = TextEditingController();

  bool _mostrarClave = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text(
          "Registro de Usuario",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Crea tu cuenta",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Ingresa tus datos para continuar",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Campo nombre
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: "Nombre completo",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Por favor, ingresa tu nombre" : null,
              ),
              const SizedBox(height: 20),

              // Campo correo
              TextFormField(
                controller: _correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Correo electrónico",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingresa tu correo";
                  } else if (!value.contains('@')) {
                    return "Correo inválido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Campo contraseña
              TextFormField(
                controller: _claveController,
                obscureText: !_mostrarClave,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _mostrarClave
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() => _mostrarClave = !_mostrarClave);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, ingresa una contraseña";
                  } else if (value.length < 6) {
                    return "Debe tener al menos 6 caracteres";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Botón principal
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.lightBlueAccent,
    padding: const EdgeInsets.symmetric(vertical: 14),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
  ),
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PantallaInicial()),
      );
    }
  },
  child: const Text(
    "Registrar",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
),



              const SizedBox(height: 30),

              // Divider visual
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "O regístrate con",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 Botones sociales con iconos FontAwesome
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _iconButton(
                    color: Colors.white,
                    icon: FontAwesomeIcons.google,
                    iconColor: Colors.redAccent,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Iniciar con Google")),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  _iconButton(
                    color: const Color(0xFF1877F2),
                    icon: FontAwesomeIcons.facebookF,
                    iconColor: Colors.white,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Iniciar con Facebook")),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  _iconButton(
                    color: const Color(0xFF1DA1F2),
                    icon: FontAwesomeIcons.twitter,
                    iconColor: Colors.white,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Iniciar con Twitter")),
                      );
                    },
                  ),
                ],
              ),

              // Botón para ir a iniciar sesión
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("¿Ya tienes cuenta? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      "Inicia sesión",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔸 Widget reutilizable para botones sociales
  Widget _iconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
    required Color iconColor,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Icon(icon, color: iconColor, size: 28),
      ),
    );
  }
}
