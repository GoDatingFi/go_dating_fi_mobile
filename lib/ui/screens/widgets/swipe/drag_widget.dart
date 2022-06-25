import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import '../../../../core/model/profile_model.dart';
import '../../../../main.dart';
import 'profile_card.dart';
import 'tag_widget.dart';

class DragWidget extends StatefulWidget {
  const DragWidget({
    Key? key,
    required this.profile,
    required this.index,
    required this.swipeNotifier,
    this.isLastCard = false,
  }) : super(key: key);
  final Profile profile;
  final int index;
  final ValueNotifier<Swipe> swipeNotifier;
  final bool isLastCard;

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Draggable<int>(
          // Data is the value this Draggable stores.
          data: widget.index,
          feedback: Material(
            color: Colors.transparent,
            child: ValueListenableBuilder(
              valueListenable: widget.swipeNotifier,
              builder: (context, swipe, _) {
                return RotationTransition(
                  turns: widget.swipeNotifier.value != Swipe.none
                      ? widget.swipeNotifier.value == Swipe.left
                          ? AlwaysStoppedAnimation(-2.sm / 360.sm)
                          : AlwaysStoppedAnimation(2.sm / 360.sm)
                      : const AlwaysStoppedAnimation(0),
                  child: Stack(
                    children: [
                      ProfileCard(profile: widget.profile),
                      widget.swipeNotifier.value != Swipe.none
                          ? widget.swipeNotifier.value == Swipe.right
                              ? Positioned(
                                  top: 40.sm,
                                  left: 20.sm,
                                  child: Transform.rotate(
                                    angle: 12.sm,
                                    child: TagWidget(
                                      text: 'LIKE',
                                      color: Colors.green[400]!,
                                    ),
                                  ),
                                )
                              : Positioned(
                                  top: 50.sm,
                                  right: 24.sm,
                                  child: Transform.rotate(
                                    angle: -12.sm,
                                    child: TagWidget(
                                      text: 'DISLIKE',
                                      color: Colors.red[400]!,
                                    ),
                                  ),
                                )
                          : const SizedBox.shrink(),
                    ],
                  ),
                );
              },
            ),
          ),
          onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
            if (dragUpdateDetails.delta.dx > 0 &&
                dragUpdateDetails.globalPosition.dx >
                    MediaQuery.of(context).size.width / 2) {
              widget.swipeNotifier.value = Swipe.right;
            }
            if (dragUpdateDetails.delta.dx < 0 &&
                dragUpdateDetails.globalPosition.dx <
                    MediaQuery.of(context).size.width / 2) {
              widget.swipeNotifier.value = Swipe.left;
            }
          },
          onDragEnd: (drag) {
            widget.swipeNotifier.value = Swipe.none;
          },

          childWhenDragging: Container(
            color: Colors.transparent,
          ),

          //This will be visible when we press action button
          child: ValueListenableBuilder(
              valueListenable: widget.swipeNotifier,
              builder: (BuildContext context, Swipe swipe, Widget? child) {
                return Stack(
                  children: [
                    ProfileCard(profile: widget.profile),
                    // heck if this is the last card and Swipe is not equal to Swipe.none
                    swipe != Swipe.none && widget.isLastCard
                        ? swipe == Swipe.right
                            ? Positioned(
                                top: 40.sm,
                                left: 20.sm,
                                child: Transform.rotate(
                                  angle: 12.sm,
                                  child: TagWidget(
                                    text: 'LIKE',
                                    color: Colors.green[400]!,
                                  ),
                                ),
                              )
                            : Positioned(
                                top: 50.sm,
                                right: 24.sm,
                                child: Transform.rotate(
                                  angle: -12.sm,
                                  child: TagWidget(
                                    text: 'DISLIKE',
                                    color: Colors.red[400]!,
                                  ),
                                ),
                              )
                        : const SizedBox.shrink(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
