import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';

import 'widgets/chips_options.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(labelText: "Search"),
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 75,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Center(
                      child: ChipsOptions(),
                    ),
                    Center(
                      child: ChipsOptions(),
                    ),
                    Center(
                      child: ChipsOptions(),
                    ),
                  ],
                ),
              ),
              // PEGAR IMAGENS DO BANCO DE DADOS
              Container(
                height: 220,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://picsum.photos/536/354',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
