// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:meiiem_vendor_app/utill/color_resources.dart';
// import 'package:meiiem_vendor_app/utill/styles.dart';

// class CustomNavBarItem extends StatelessWidget {
//   const CustomNavBarItem(
//       {super.key,
//       required this.index,
//       required this.pageIndex,
//       required this.icon,
//       required this.label,
//       this.onTap});
//   final int index;
//   final int pageIndex;
//   final String icon;
//   final String? label;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final bool isSelected = index == pageIndex;
//     return InkWell(
//       onTap: onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 350),
//             curve: Curves.easeOut,
//             alignment: Alignment.center,
//             width: isSelected ? 82 : 44,
//             height: 36,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//               color: isSelected
//                   ? ColorResources.iconBackground(context)
//                   : ColorResources.itemsBackground(context).withOpacity(0),
//             ),
//             child: SvgPicture.asset(
//               icon,
//               width: 20,
//               height: 20,
//               colorFilter: ColorFilter.mode(
//                 isSelected
//                     ? ColorResources.textPrimary(context)
//                     : ColorResources.textSecondary(context),
//                 BlendMode.srcIn,
//               ),
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label!,
//             style: semiBold12.copyWith(
//                 color: isSelected
//                     ? ColorResources.textPrimary(context)
//                     : ColorResources.textSecondary(context)),
//           ),
//         ],
//       ),
//     );
//   }
// }
