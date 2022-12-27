import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/helpers.dart';
import '../models/zapatoModel.dart';
import '../widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'zapato-1',
                child: ZapatoSizePreview(fullScreen: true),
              ),
              Positioned(
                  top: 80,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                      cambiarStatusDart();
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60,
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    highlightElevation: 0,
                  ))
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ZapatoDescripcions(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      'The Nike Air Max 720 goes bigger than ever before with Nike\'s tallest Air unit yet, offering more air underfoot for unprecedented, all-day comfort.',
                ),
                _MontoBuyNow(),
                _ColoresYMas(),
                _BotoneslikeCarSettings()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _BotoneslikeCarSettings extends StatelessWidget {
  const _BotoneslikeCarSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BotonSombreado(
              icon: Icon(
            Icons.star,
            color: Colors.red,
            size: 25,
          )),
          _BotonSombreado(
              icon: Icon(
            Icons.add_shopping_cart,
            color: Colors.grey.withOpacity(0.4),
            size: 25,
          )),
          _BotonSombreado(
              icon: Icon(
            Icons.settings,
            color: Colors.grey.withOpacity(0.4),
            size: 25,
          )),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: icon,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  offset: Offset(0, 5),
                  blurRadius: 5)
            ]));
  }
}

class _ColoresYMas extends StatelessWidget {
  const _ColoresYMas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: 60,
                  child: _BotonColor(Color(0xffC6D642), 4, 'assets/verde.png')),
              Positioned(
                  left: 40,
                  child:
                      _BotonColor(Color(0xffFFAD29), 3, 'assets/amarillo.png')),
              Positioned(
                  left: 20,
                  child: _BotonColor(Color(0xff2099F1), 2, 'assets/azul.png')),
              _BotonColor(Color(0xff364D56), 1, 'assets/negro.png'),
            ],
          )),
          BotonNaranja(
              texto: 'More related items',
              alto: 30,
              ancho: 170,
              color: const Color(0xffFFC675))
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final int index;
  final Color color;
  final String urlImagen;
  const _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = urlImagen;
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text('\$180.0',
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Spacer(),
            Bounce(child: BotonNaranja(texto: 'Buy now', alto: 40, ancho: 130)),
          ],
        ),
      ),
    );
  }
}
