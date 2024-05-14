// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_picket_schedule/class/jadwal.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ListPage extends StatefulWidget {
  ListPage({super.key, required this.type, this.minggu});

  final String type;
  int? minggu = 0;
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final jadwal = Jadwal();

  String getWeekDay(int day) {
    return jadwal.weekDay[day];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> data;
    if (widget.type == 'sampah') {
      data = jadwal.jadwalBuangSampah
          .getRange(0 + ((widget.minggu == 0 ? 1 : widget.minggu ?? 0) * 6 - 6),
              (widget.minggu == 0 ? 4 : widget.minggu ?? 4) * 6)
          .toList();
    } else if (widget.type == 'galonlt3') {
      data = jadwal.jadwalPiketGalonlt3
          .getRange(0 + ((widget.minggu == 0 ? 1 : widget.minggu ?? 0) * 6 - 6),
              (widget.minggu == 0 ? 4 : widget.minggu ?? 4) * 6)
          .toList();
    } else if (widget.type == 'galon') {
      data = jadwal.jadwalPiketGalon;
    } else if (widget.type == 'lantai6') {
      data = jadwal.jadwalPiketLantai6;
    } else {
      data = [];
    }
    String dateNow = DateFormat("EEEEE, dd MMM", 'id').format(DateTime.now());
    String dateNowWeekDay = DateFormat("EEEEE", 'id').format(DateTime.now());
    final minggu1 = DateTime.utc(2024, DateTime.february, 12);
    final dateDiffSampah =
        jadwal.getDifferenceWithoutWeekends(minggu1, DateTime.now(), 'sampah') -
            1;
    final dateDiffGalon =
        jadwal.getDifferenceWithoutWeekends(minggu1, DateTime.now(), 'galon') -
            1;

    final mingguKe = jadwal.getMingguKeberapa(dateDiffSampah + 1);

    int indexDay = 0;
    String getDate() {
      DateTime date =
          DateTime.now().add(Duration(days: indexDay - dateDiffGalon));
      if (date.weekday == DateTime.sunday) {
        int nxt = indexDay += 1;
        indexDay += 1;
        return DateFormat("EEEEE, dd MMM", 'id')
            .format(DateTime.now().add(Duration(days: nxt - dateDiffGalon)));
      }

      indexDay += 1;
      print(dateDiffGalon);
      return DateFormat("EEEEE, dd MMM", 'id').format(date);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text('List Jadwal'),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            String keterangan;
            if (widget.type == 'sampah' || widget.type == 'galonlt3') {
              if (widget.minggu! == 0) {
                keterangan =
                    'Minggu ke-${jadwal.getMingguKeberapa(widget.minggu == 0 ? index : ((widget.minggu == 0 ? 0 : widget.minggu ?? 0) * 6 - 6) + 1)}';
              } else {
                keterangan = getWeekDay(index);
              }
            } else if (widget.type == 'lantai6') {
              keterangan = getWeekDay(index);
            } else if (widget.type == 'galon') {
              keterangan = getDate();
            } else {
              keterangan = '';
            }
            return Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: keterangan == dateNow ||
                        (dateNowWeekDay == keterangan &&
                            (widget.minggu == mingguKe ||
                                widget.type == 'lantai6'))
                    ? Colors.teal
                    : Theme.of(context).colorScheme.secondary,
              ),
              child: ListTile(
                title: Text(
                  data[index],
                  style: TextStyle(
                    color: keterangan == dateNow ||
                            (dateNowWeekDay == keterangan &&
                                (widget.minggu == mingguKe ||
                                    widget.type == 'lantai6'))
                        ? Colors.white
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
                trailing: Text(
                  keterangan,
                  style: TextStyle(
                      color: keterangan == dateNow ||
                              (dateNowWeekDay == keterangan &&
                                  (widget.minggu == mingguKe ||
                                      widget.type == 'lantai6'))
                          ? Colors.white
                          : Theme.of(context).colorScheme.outline),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
