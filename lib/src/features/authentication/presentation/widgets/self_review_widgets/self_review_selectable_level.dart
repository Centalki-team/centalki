import 'package:flutter/material.dart';

import '../../../../../../base/define/dimensions.dart';
import '../../../domain/entities/self_review/self_level_entity.dart';
import 'selectable_item.dart';

class SelfReviewSelectableLevel extends StatefulWidget {
  const SelfReviewSelectableLevel({
    super.key,
    this.physics,
    required this.levelsList,
    this.initialValue,
    this.onSelect,
  });

  final ScrollPhysics? physics;
  final List<SelfLevelEntity> levelsList;
  final SelfLevelEntity? initialValue;
  final Function(SelfLevelEntity?)? onSelect;

  @override
  State<SelfReviewSelectableLevel> createState() =>
      _SelfReviewSelectableLevelState();
}

class _SelfReviewSelectableLevelState extends State<SelfReviewSelectableLevel> {
  SelfLevelEntity? currentSelect;

  @override
  void initState() {
    currentSelect = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.levelsList.isNotEmpty
      ? ListView.separated(
          physics: widget.physics,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (currentSelect != widget.levelsList[index]) {
                setState(() {
                  currentSelect = widget.levelsList[index];
                });
                widget.onSelect?.call(currentSelect);
              }
            },
            child: SelectableLevelItem(
              selfLevelEntity: widget.levelsList[index],
              isSelected: currentSelect == widget.levelsList[index],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: spacing8,
          ),
          itemCount: widget.levelsList.length,
        )
      : const SizedBox.shrink();
}
