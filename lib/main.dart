import 'dart:ui';

import 'package:flutter/material.dart';

import 'constants/ui_constants.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  messagePrint() {
    print('Function Called');
  }

  @override
  Widget build(BuildContext context) {

    const backdropHeight = 250.0;
    const imageBackdrop = 'assets/images/Backdrop.jpg';
    const imagePoster = 'assets/images/Poster.jpg';
    const title = 'The Super Mario Bros. Movie';
    const circleBorderWidth = 2.0;
    const innerCirclePadding = 0.8;
    const cardTextPadding = 8.0;
    const cardText = '7.8';
    const date = '2023-04-05';
    const genres = '[Animation, Family, Adventure, Fantasy, Comedy]';
    const overviewTitle = 'Overview';
    const overview = 'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.';

    return MaterialApp(

        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.deepOrange.shade900,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange.shade900, background: Colors.deepOrange.shade900),
        ),
        home: Builder(
          builder: (context) {
            return Scaffold(
                body: SafeArea(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: backdropHeight,
                          child: Stack(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: UIConstants.backdropLeftPadding),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(imageBackdrop),
                                  height: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: UIConstants.backdropLeftPadding),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Theme.of(context).primaryColor,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(UIConstants.imagePadding),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(imagePoster),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: UIConstants.textsLargePadding,
                                bottom: UIConstants.textsShortPadding,
                            ),
                            child: Text(
                              title,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: UIConstants.titleFontSize,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: UIConstants.imagePadding),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Card(
                              shape: CircleBorder(side: BorderSide(color: Colors.indigo.shade900, width: circleBorderWidth)),
                              color: Colors.greenAccent.shade700,
                              child: Padding(
                                padding: const EdgeInsets.all(innerCirclePadding),
                                child: Card(
                                  shape: const CircleBorder(),
                                  color: Colors.indigo.shade900,
                                  child: Padding(
                                    padding: const EdgeInsets.all(cardTextPadding),
                                    child: Text(
                                      cardText,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onPrimary,
                                        fontSize: UIConstants.titleFontSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: UIConstants.textsShortPadding),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(color: Theme.of(context).focusColor),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: UIConstants.textsShortPadding),
                              child: Column(
                                children: [
                                  Text(
                                    date,
                                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                                  ),
                                  Text(
                                    genres,
                                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: UIConstants.textsShortPadding, horizontal: UIConstants.textsLargePadding),
                          child: Text(
                            overviewTitle,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: UIConstants.titleFontSize,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: UIConstants.textsShortPadding,
                              horizontal: UIConstants.textsLargePadding,
                          ),
                          child: Text(
                            overview,
                            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.all(UIConstants.imagePadding),
                            child: LikeIcon(),
                          ),
                        ),
                      ],
                    )));
          }
        ));
  }
}

class LikeIcon extends StatefulWidget {
  const LikeIcon({super.key});

  @override
  State<LikeIcon> createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {

  late IconData icon;

  @override
  void initState() {
    super.initState();
    icon = Icons.favorite_border;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (icon == Icons.favorite) {
              icon = Icons.favorite_border;
            } else {
              icon = Icons.favorite;
            }
          });
        },
        child: Icon(icon),
      ),
    );
  }
}
