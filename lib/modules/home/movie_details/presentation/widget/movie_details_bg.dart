// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/core/extension/build_context_extension.dart';

// class MovieDeetailsBg extends StatelessWidget {
//   final String posterUrl;
//   const MovieDeetailsBg({required this.posterUrl, super.key,});


//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           height: (context.fullVerticalSize /3) * 2.5,
//           width: double.infinity,
//           child: CachedNetworkImage(
//             width: 150,
//             fit: BoxFit.cover,
//             imageUrl: posterUrl,
//             placeholder: (context, url) => SizedBox(
//               height: 280,
//               width: 150,
//               child: Shimmer.fromColors(baseColors: Colors.grey),
//               higlightColor: Colors.grey.shade200,
//               child: Container(
//                 height: 280,
//                 width: 150,
//                 color: Colors.grey,
//               ),
//             ),
//             ErrorWidget(context, url, error) => Icon(Icon.error),
//             ),
//         ),
//       Align(
//         alignment: Alignment.bottomCenter,
//         child: Container(
//           height: context,fullVerticalSize / 4,
//           decoration: BoxDecoration(color: Colors.black, boxShadow: [
//             BoxShadow(blurRadius: 100, spreadRadius: 50,
//             color: Colors.black)
//           ]),
//         ),
//       )
//       ],
//     );
//   }
// }