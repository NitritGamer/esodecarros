import 'package:flutter/material.dart';
import 'package:esodecarros/pages/chat_vendedor.dart';

class DetallesVehiculoPage extends StatefulWidget {
  final Map<String, dynamic> auto;

  const DetallesVehiculoPage({super.key, required this.auto});

  @override
  State<DetallesVehiculoPage> createState() => _DetallesVehiculoPageState();
}

class _DetallesVehiculoPageState extends State<DetallesVehiculoPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
        actions: [
          IconButton(
            icon: Icon(
              widget.auto["fav"] ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                widget.auto["fav"] = !widget.auto["fav"];
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== GALERÍA DE IMÁGENES ==========
            _galeriaImagenes(),

            // ========== INFORMACIÓN BÁSICA ==========
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.auto["titulo"],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.auto["precio"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.auto["detalles"],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            // ========== CARACTERÍSTICAS PRINCIPALES ==========
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Características Principales",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _caracteristica(
                        icon: Icons.speed,
                        label: "Velocidad",
                        valor: "200 km/h",
                      ),
                      _caracteristica(
                        icon: Icons.local_gas_station,
                        label: "Combustible",
                        valor: "Gasolina",
                      ),
                      _caracteristica(
                        icon: Icons.settings,
                        label: "Transmisión",
                        valor: "Automático",
                      ),
                      _caracteristica(
                        icon: Icons.directions_car,
                        label: "Tipo",
                        valor: "SUV",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(),

            // ========== DESCRIPCIÓN ==========
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Descripción",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Este ${widget.auto["titulo"]} se encuentra en excelente estado. "
                    "Ha sido mantenido cuidadosamente y cuenta con todas las inspecciones "
                    "al día. Es un vehículo confiable y listo para ser conducido.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            // ========== ESPECIFICACIONES ==========
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Especificaciones",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _fila("Motor", "V6 3.5L"),
                  _fila("Potencia", "280 HP"),
                  _fila("Torque", "360 Nm"),
                  _fila("Transmisión", "Automática 8 velocidades"),
                  _fila("Tracción", "4WD"),
                  _fila("Consumo de Combustible", "11 L/100km"),
                ],
              ),
            ),

            const Divider(),

            // ========== INFORMACIÓN DE DOCUMENTACIÓN ==========
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Documentación del Vehículo",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _documentacion("✓ Título de Propiedad", true),
                  _documentacion("✓ Inspecciones Técnicas", true),
                  _documentacion("✓ Seguro al Día", true),
                  _documentacion("✓ Revisión Técnica Obligatoria", true),
                ],
              ),
            ),

            const Divider(),

            // ========== UBICACIÓN DEL VEHÍCULO ==========
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ubicación del Vehículo",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/imagenes/mapa.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "📍 Valencia, España",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ========== BOTÓN DE CONTACTO ==========
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _mostrarContactoVendedor();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Contactar al Vendedor",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ========== GALERÍA DE IMÁGENES ==========
  Widget _galeriaImagenes() {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.auto["img"],
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "1/4",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _miniatura(widget.auto["img"], true),
                const SizedBox(width: 8),
                _miniatura(widget.auto["img"], false),
                const SizedBox(width: 8),
                _miniatura(widget.auto["img"], false),
                const SizedBox(width: 8),
                _miniatura(widget.auto["img"], false),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _miniatura(String imagen, bool activa) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: activa ? Colors.lightBlueAccent : Colors.grey.shade300,
          width: activa ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          imagen,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _caracteristica({
    required IconData icon,
    required String label,
    required String valor,
  }) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.lightBlueAccent),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          valor,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _fila(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            valor,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _documentacion(String texto, bool completado) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: completado ? Colors.green : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            texto,
            style: TextStyle(
              fontSize: 14,
              color: completado ? Colors.green : Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarContactoVendedor() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatVendedorPage(auto: widget.auto),
      ),
    );
  }
}
