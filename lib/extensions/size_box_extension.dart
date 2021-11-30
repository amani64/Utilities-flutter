part of '../utilities.dart';

extension SizeBoxExtension on double {
  Widget get widthBox => SizedBox(width: this);

  Widget get heightBox => SizedBox(height: this);
}
