import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;

  const AgregarCarritoBoton({super.key, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 100,
      width: double.infinity,
      // color: Colors.red,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        children: [
          Text('\$${this.monto}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
          BotonNaranja(
            texto: 'Add to cart',
            // alto: 50,
            // ancho: 180,
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
