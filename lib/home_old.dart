// import 'package:flutter/material.dart';
// import 'package:flutter_picket_schedule/class/jadwal.dart';
// import 'package:flutter_picket_schedule/components/my_drawer.dart';
// import 'package:intl/intl.dart';

// class HomeApp extends StatefulWidget {
//   const HomeApp({super.key});

//   @override
//   State<HomeApp> createState() => _HomeAppState();
// }

// class _HomeAppState extends State<HomeApp> {
//   String weekDay = DateFormat("EEEEE").format(DateTime.now());
//   String dateInFormat = DateFormat("dd/MM/yyyy").format(DateTime.now());

//   final jadwal = Jadwal();
//   @override
//   Widget build(BuildContext context) {
//     final minggu1 = DateTime.utc(2024, DateTime.february, 12);
//     final dateDiffSampah =
//         jadwal.getDifferenceWithoutWeekends(minggu1, DateTime.now(), 'sampah') -
//             1;
//     final dateDiffGalon =
//         jadwal.getDifferenceWithoutWeekends(minggu1, DateTime.now(), 'galon') -
//             1;
//     final mingguKe = jadwal.getMingguKeberapa(dateDiffSampah);

//     //
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('H O M E'),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         foregroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       drawer: const MyDrawer(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: Row(
//               children: [
//                 Text(
//                   '$weekDay, ',
//                   style: const TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   dateInFormat,
//                   style: const TextStyle(
//                     fontSize: 30,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: Text(
//               'Minggu ke-$mingguKe',
//               style: const TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           const SizedBox(height: 15),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: Container(
//               padding: const EdgeInsets.all(12),
//               height: 150,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primary,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Piket Buang Sampah : ${jadwal.jadwalBuangSampah[dateDiffSampah]}',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                   ),
//                   Text(
//                     'Piket Angkat Galon : ${jadwal.jadwalPiketGalon[dateDiffGalon]}',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 12),
//                   height: 100,
//                   // width: 175,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.primary,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 12),
//                   height: 100,
//                   // width: 175,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.primary,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
