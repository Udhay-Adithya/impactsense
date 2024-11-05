import 'package:flutter/material.dart';

class AlertsCarousel extends StatefulWidget {
  const AlertsCarousel({super.key});

  @override
  AlertsCarouselState createState() => AlertsCarouselState();
}

class AlertsCarouselState extends State<AlertsCarousel> {
  Map<String, dynamic>? gradesMap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Theme.of(context).colorScheme.secondary,
            ),
            width: 200,
            height: 125,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (index == 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'I had\nan accident',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                ),
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward_rounded),
                              ),
                            ),
                            const Icon(
                              Icons.car_crash_outlined,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                else if (index == 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'I have\nan injury',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_rounded,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.report_problem_outlined,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                else if (index == 2)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'I\'m feeling\ndizzy',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                ),
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_forward_rounded),
                              ),
                            ),
                            const Icon(
                              Icons.sick_outlined,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
