// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_picket_schedule/class/jadwal.dart';
import 'package:flutter_picket_schedule/components/my_menu_bottomsheet.dart';
import 'package:flutter_picket_schedule/components/my_menu_box.dart';
import 'package:flutter_picket_schedule/pages/list.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
  }

  final jadwal = Jadwal();

  @override
  Widget build(BuildContext context) {
    //fungsi
    String weekDay = DateFormat("EEEEE", 'id').format(DateTime.now());
    String dateInFormat = DateFormat("dd-MM-yyyy", 'id').format(DateTime.now());
    final minggu1 = DateTime.utc(2024, DateTime.february, 12);
    final dateDiffSampah =
        jadwal.getDifferenceWithoutWeekends(minggu1, DateTime.now(), 'sampah') -
            1;
    final dateDiffGalon =
        jadwal.getDifferenceWithoutWeekends(minggu1, DateTime.now(), 'galon') -
            1;
    final dateDiffLantai6 = jadwal.getDifferenceWithoutWeekends(
            minggu1, DateTime.now(), 'lantai6') -
        1;
    final mingguKe = jadwal.getMingguKeberapa(dateDiffSampah + 1);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              // ElevatedButton.icon(
              //   onPressed: () {
              //     print('pressed');

              //   },
              //   icon: Icon(Icons.notification_add),
              //   label: Text('Show Notification'),
              // ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'P I K E T',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.more_vert_rounded),
                ],
              ),
              const SizedBox(height: 15),
              //box ijo
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('$weekDay - Minggu ke-$mingguKe'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Piket Lantai 6 : ${jadwal.jadwalPiketLantai6[dateDiffLantai6]}',
                          ),
                          Text(
                            'Piket Buang Sampah : ${jadwal.jadwalBuangSampah[dateDiffSampah]}',
                          ),
                          Text(
                            'Piket Galon lt3 : ${jadwal.jadwalPiketGalonlt3[dateDiffSampah]}',
                          ),
                          Text(
                            'Piket Galon & Lantai 2 : ${jadwal.jadwalPiketGalon[dateDiffGalon]}',
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.assignment_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: VerticalDivider(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            weekDay,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          // SizedBox(height: 5),
                          Text(
                            dateInFormat,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              //
              Row(
                children: [
                  MyMenuBox(
                    title: 'Sampah',
                    icon: Icons.delete_rounded,
                    iconColor: Colors.orangeAccent,
                    total: jadwal.jadwalBuangSampah.length.toString(),
                    satuan: 'Orang',
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          // <-- SEE HERE
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15.0),
                          ),
                        ),
                        builder: (context) => const SizedBox(
                          height: 250,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 25,
                                  left: 15,
                                  right: 15,
                                ),
                                child: Row(
                                  children: [
                                    MyMenuBottomSheet(
                                      minggu: 0,
                                      type: 'sampah',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                                child: Row(
                                  children: [
                                    MyMenuBottomSheet(
                                      minggu: 1,
                                      type: 'sampah',
                                    ),
                                    MyMenuBottomSheet(
                                      minggu: 2,
                                      type: 'sampah',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                                child: Row(
                                  children: [
                                    MyMenuBottomSheet(
                                      minggu: 3,
                                      type: 'sampah',
                                    ),
                                    MyMenuBottomSheet(
                                      minggu: 4,
                                      type: 'sampah',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 15),
                  MyMenuBox(
                    title: 'Galon lt1',
                    icon: Icons.water_drop,
                    iconColor: Colors.blue,
                    total: jadwal.jadwalPiketGalon.length.toString(),
                    satuan: 'Orang',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListPage(type: 'galon'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  MyMenuBox(
                    title: 'Galon lt3',
                    icon: Icons.water_drop,
                    iconColor: Colors.redAccent,
                    total: jadwal.jadwalPiketGalonlt3.length.toString(),
                    satuan: 'Orang',
                    onTap: () => showModalBottomSheet(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15.0),
                        ),
                      ),
                      builder: (context) => const SizedBox(
                        height: 250,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 25,
                                left: 15,
                                right: 15,
                              ),
                              child: Row(
                                children: [
                                  MyMenuBottomSheet(
                                    minggu: 0,
                                    type: 'galonlt3',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                              ),
                              child: Row(
                                children: [
                                  MyMenuBottomSheet(
                                    minggu: 1,
                                    type: 'galonlt3',
                                  ),
                                  MyMenuBottomSheet(
                                    minggu: 2,
                                    type: 'galonlt3',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                              ),
                              child: Row(
                                children: [
                                  MyMenuBottomSheet(
                                    minggu: 3,
                                    type: 'galonlt3',
                                  ),
                                  MyMenuBottomSheet(
                                    minggu: 4,
                                    type: 'galonlt3',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  MyMenuBox(
                    title: 'Lantai 6',
                    icon: Icons.home,
                    iconColor: Colors.green,
                    total: jadwal.jadwalPiketLantai6.length.toString(),
                    satuan: 'Kelompok',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListPage(type: 'lantai6'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
