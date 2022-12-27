import 'package:flutter/material.dart';
import 'package:zapatos/src/helpers/helpers.dart';
import 'package:zapatos/src/widgets/custom_widgets.dart';

class ZapatpScreen extends StatelessWidget {
  const ZapatpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusDart();
    return Scaffold(
        // body: CustomAppBar(texto: 'For you'),
        body: Column(
      children: [
        CustomAppBar(texto: 'For you'),
        SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Hero(tag: 'zapato-1', child: ZapatoSizePreview()),
                const ZapatoDescripcions(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        'The Nike Air Max 720 goes bigger than ever before with Nike\'s tallest Air unit yet, offering more air underfoot for unprecedented, all-day comfort.'),
              ],
            ),
          ),
        ),
        const AgregarCarritoBoton(monto: 180.0),
      ],
    ));
  }
}
