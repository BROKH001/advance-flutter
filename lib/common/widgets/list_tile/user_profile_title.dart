
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image.dart';
import '../../../utils/constants/size.dart';
import '../images/circular_image.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
    this.username = 'Sun Heng BroKH',
    this.email = 'brokh270405@gmail.com',
    this.userPhoto = TImage.user,
    required this.onPressed,
  });

  final String username, email, userPhoto;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(image: userPhoto, width: 50, height: 50),
      title: Text(username, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text(email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: Icon(Iconsax.edit, size: TSizes.iconMd, color: TColors.white)),
    );
  }
}