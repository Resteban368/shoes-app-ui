import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/zapatoModel.dart';
import '../pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ZapatoSizePreview({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (fullScreen) ? 5 : 30, vertical: (fullScreen) ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 400 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: (!fullScreen)
                ? BorderRadius.circular(50)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
          ),
          child: Column(
            children: [
              _ZapatoConSombra(),
              if (!fullScreen) _ZapatoTallas(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({super.key});

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          const Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra(),
          ),
          Image(
            image: AssetImage(zapatoModel.assetImage),
          ),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            const BoxShadow(
              color: Color(0xffEAA14E),
              blurRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(
            numero: 7,
          ),
          _TallaZapatoCaja(
            numero: 7.5,
          ),
          _TallaZapatoCaja(
            numero: 8,
          ),
          _TallaZapatoCaja(
            numero: 8.5,
          ),
          _TallaZapatoCaja(
            numero: 9,
          ),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;

  const _TallaZapatoCaja({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '${numero.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: (this.numero == zapatoModel.talla)
                ? Colors.white
                : Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: (this.numero == zapatoModel.talla)
                ? Color(0xffF1A23A)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (this.numero == zapatoModel.talla)
                BoxShadow(
                    color: Color(0xffF1A23A),
                    blurRadius: 10,
                    offset: Offset(0, 5))
            ]),
      ),
    );
  }
}
