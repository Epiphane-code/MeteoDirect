import 'package:directmeteo/controllers/meteo_controller.dart';
import 'package:directmeteo/widgets/detail_card.dart';
import 'package:directmeteo/widgets/ecran_initial.dart';
import 'package:directmeteo/widgets/error_message_widget.dart';
import 'package:directmeteo/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Interface extends StatefulWidget {
  const Interface({super.key});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface>
    with SingleTickerProviderStateMixin {
  // Animation du contenu
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  // Controller du champ de recherche
  final TextEditingController _fieldController = TextEditingController();

  // Couleurs du gradient
  List<Color> _gradientColors = [Colors.blue, Colors.lightBlue];

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _fieldController.dispose();
    super.dispose();
  }

  // Changer le fond selon la météo
  void onDonneesRecues(String iconCode) {
    setState(() {
      _gradientColors = _getGradient(iconCode);
    });

    _fadeController.forward(from: 0);
  }

  List<Color> _getGradient(String icon) {
    if (icon.startsWith('01')) {
      return [Colors.blue, Colors.lightBlueAccent];
    }

    if (icon.startsWith('10')) {
      return [Colors.indigo, Colors.blueAccent];
    }

    return [Colors.blueGrey, Colors.grey];
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MeteoController>();
    final controllerRead = context.read<MeteoController>();
    final List<String> histories = controller.searchHistory;
    if (controller.success) {
      onDonneesRecues(controller.meteo!.iconCode);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: controller.searchHistory.isNotEmpty
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                color: Colors.white,
                                size: 30,
                              ),

                              SizedBox(width: 10),

                              Text(
                                'Application Météo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),

                          if (controller.searchHistory.isNotEmpty)
                            IconButton(
                              onPressed: () {
                                if (histories.isNotEmpty) {
                                  controllerRead.getMeteo(histories.last);
                                }
                              },
                              icon: const Icon(
                                Icons.refresh_outlined,
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                        controller: _fieldController,
                        style: const TextStyle(color: Colors.white),
                        onSubmitted: (value) {
                          final city = value.trim();

                          if (city.isNotEmpty) {
                            controllerRead.getMeteo(city);
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),

                          filled: true,
                          fillColor: Colors.white24,

                          hintText: 'Rechercher une ville',

                          hintStyle: const TextStyle(color: Colors.white70),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white24,
                              width: 2,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    histories.isNotEmpty
                        ? SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: histories.length,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              itemBuilder: (context, index) {
                                // Afficher le plus récent en premier
                                final history =
                                    histories[histories.length - 1 - index];

                                return GestureDetector(
                                  onTap: () {
                                    _fieldController.text = history;
                                  },
                                  child: Chip(
                                    side: BorderSide(color: Colors.white30),
                                    backgroundColor: Colors.black87,
                                    label: Text(
                                      history,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white24,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                              side: const BorderSide(
                                color: Colors.white24,
                                width: 2,
                              ),
                            ),
                          ),
                          onPressed: () {
                            final city = _fieldController.text.trim();

                            if (city.isNotEmpty) {
                              controllerRead.getMeteo(city);
                            }
                          },
                          icon: const Icon(Icons.search, color: Colors.white),
                          label: const Text(
                            'Rechercher',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      child: controller.initial
                          ? EcranInitial()
                          : controller.isloading
                          ? WidgetLoading()
                          : controller.success
                          ? DetailCard(controller.meteo!)
                          : ErrorMessageWidget(controller.textError),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
