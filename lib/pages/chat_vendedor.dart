import 'package:flutter/material.dart';

class ChatVendedorPage extends StatefulWidget {
  final Map<String, dynamic> auto;
  final String vendedorNombre;
  final String vendedorFoto;

  const ChatVendedorPage({
    super.key,
    required this.auto,
    this.vendedorNombre = "Juan Pérez",
    this.vendedorFoto = "assets/imagenes/vendedor.png",
  });

  @override
  State<ChatVendedorPage> createState() => _ChatVendedorPageState();
}

class _ChatVendedorPageState extends State<ChatVendedorPage> {
  final TextEditingController _mensajeController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Lista de mensajes (simulado)
  final List<Map<String, dynamic>> mensajes = [];

  @override
  void dispose() {
    _mensajeController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _enviarMensaje() {
    if (_mensajeController.text.trim().isEmpty) return;

    setState(() {
      mensajes.add({
        "remitente": "cliente",
        "texto": _mensajeController.text,
        "hora": _obtenerHora(),
      });
    });

    _mensajeController.clear();
    _desplazarHaciaAbajo();

    // Simular respuesta del vendedor después de 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          mensajes.add({
            "remitente": "vendedor",
            "texto": "Excelente, ¡con gusto!",
            "hora": _obtenerHora(),
          });
        });
        _desplazarHaciaAbajo();
      }
    });
  }

  void _desplazarHaciaAbajo() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _obtenerHora() {
    final ahora = DateTime.now();
    return "${ahora.hour}:${ahora.minute.toString().padLeft(2, '0')} ${ahora.hour >= 12 ? 'PM' : 'AM'}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.vendedorNombre,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.auto["titulo"],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // ========== ÁREA DE MENSAJES ==========
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              itemCount: mensajes.length,
              itemBuilder: (context, index) {
                final mensaje = mensajes[index];
                final esVendedor = mensaje["remitente"] == "vendedor";

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: esVendedor
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      if (esVendedor)
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey.shade300,
                          child: const Icon(Icons.person, color: Colors.grey),
                        ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: esVendedor
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: esVendedor
                                    ? Colors.grey.shade200
                                    : Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                mensaje["texto"],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: esVendedor
                                      ? Colors.black87
                                      : Colors.white,
                                  height: 1.4,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              mensaje["hora"],
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!esVendedor) const SizedBox(width: 8),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(height: 1),

          // ========== CAMPO DE ENTRADA ==========
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                // Icono de emoticono (opcional)
                IconButton(
                  icon: const Icon(Icons.sentiment_satisfied_alt_outlined,
                      color: Colors.grey),
                  onPressed: () {},
                ),

                // Campo de texto
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      controller: _mensajeController,
                      decoration: InputDecoration(
                        hintText: "Escriba su mensaje...",
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                      maxLines: null,
                      textInputAction: TextInputAction.newline,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Botón enviar
                GestureDetector(
                  onTap: _enviarMensaje,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.lightBlueAccent,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
