import 'package:flutter/material.dart';

import '../../../../core/model/profile_model.dart';
import '../../../../main.dart';
import 'action_button_widget.dart';
import 'drag_widget.dart';

class CardsStackWidget extends StatefulWidget {
  const CardsStackWidget({Key? key}) : super(key: key);

  @override
  State<CardsStackWidget> createState() => _CardsStackWidgetState();
}

class _CardsStackWidgetState extends State<CardsStackWidget>
    with SingleTickerProviderStateMixin {
  List<Profile> draggableItems = [
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/474x/6e/48/91/6e489140de4ff27fe68284203006a710.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/474x/25/c8/29/25c8296b598f57a147d17671dfde0d35.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/474x/92/84/40/92844021a5e8ef50ab5dcb3085afe01b.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/474x/74/f7/f0/74f7f004d37f18af43dafeef23cd01c8.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/474x/9d/0a/7c/9d0a7c3a98499b78e47aca0dfb8af9db.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/474x/89/0c/be/890cbe1f5fcd55d93aef69489d662e98.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/474x/52/91/fb/5291fbc25b83ac5b800d6a13a9cf468f.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/474x/44/b3/03/44b30368f49b297799a9876735378b52.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/474x/a7/9a/08/a79a08f9877d06fd63df52ea2cb7d48d.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/236x/c6/7f/f9/c67ff9c1e5bc89cd37c4de3c8b115bd1.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/236x/50/03/4a/50034af5274e2a557c93c76276747762.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/236x/3e/8f/28/3e8f28838a47bf3b2e5865ae4d7de4bf.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/236x/2f/95/8d/2f958d55535186b8fa1fb984525b7bab.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/236x/6f/01/0a/6f010a9b53b6fff3708514b2c35dfdfc.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/236x/4e/ce/97/4ece97c535a4389f2a844495a6805526.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/236x/da/bc/9f/dabc9fb85ccb18327e49a7c220f20995.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/236x/00/f0/e2/00f0e23ecc0c4cd8b505f3cd1f427ae2.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/236x/d4/39/3c/d4393c00bd51d7e9a46f20d74486617c.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
    const Profile(
        name: 'Rohini',
        distance: '10 miles away',
        imageAsset1:
            'https://i.pinimg.com/236x/a6/7d/65/a67d65f9d460265d2abae1c0b90c56d3.jpg',
        imageAsset2:
            'https://i.pinimg.com/474x/d0/f9/f3/d0f9f3c1289d4122cd0969d32b4cb855.jpg'),
  ];

  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        draggableItems.removeLast();
        _animationController.reset();

        swipeNotifier.value = Swipe.none;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) => Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: List.generate(draggableItems.length, (index) {
                if (index == draggableItems.length - 1) {
                  return PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                          const Rect.fromLTWH(0, 0, 580, 340),
                          const Size(580, 340)),
                      end: RelativeRect.fromSize(
                          Rect.fromLTWH(
                              swipe != Swipe.none
                                  ? swipe == Swipe.left
                                      ? -300
                                      : 300
                                  : 0,
                              0,
                              580,
                              340),
                          const Size(580, 340)),
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.easeInOut,
                    )),
                    child: RotationTransition(
                      turns: Tween<double>(
                              begin: 0,
                              end: swipe != Swipe.none
                                  ? swipe == Swipe.left
                                      ? -0.1 * 0.3
                                      : 0.1 * 0.3
                                  : 0.0)
                          .animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve:
                              const Interval(0, 0.4, curve: Curves.easeInOut),
                        ),
                      ),
                      child: DragWidget(
                        profile: draggableItems[index],
                        index: index,
                        swipeNotifier: swipeNotifier,
                        isLastCard: true,
                      ),
                    ),
                  );
                } else {
                  return DragWidget(
                    profile: draggableItems[index],
                    index: index,
                    swipeNotifier: swipeNotifier,
                  );
                }
              }),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 46.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButtonWidget(
                  onPressed: () {
                    swipeNotifier.value = Swipe.left;
                    _animationController.forward();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 20),
                ActionButtonWidget(
                  onPressed: () {
                    swipeNotifier.value = Swipe.right;
                    _animationController.forward();
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.red,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                draggableItems.removeAt(index);
              });
            },
          ),
        ),
        Positioned(
          right: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.blue,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                draggableItems.removeAt(index);
              });
            },
          ),
        ),
      ],
    );
  }
}
