import 'package:flutter/material.dart';
import 'package:flutter_picket_schedule/class/jadwal.dart';
import 'package:flutter_picket_schedule/pages/list.dart';

class MyMenuBottomSheet extends StatelessWidget {
  const MyMenuBottomSheet({
    super.key,
    required this.minggu,
    required this.type,
  });

  final int minggu;
  final String type;
  @override
  Widget build(BuildContext context) {
    final minggu1 = DateTime.utc(2024, DateTime.february, 12);
    final dateDiffSampah = Jadwal()
            .getDifferenceWithoutWeekends(minggu1, DateTime.now(), 'sampah') -
        1;

    final mingguKe = Jadwal().getMingguKeberapa(dateDiffSampah + 1);
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListPage(
              type: type,
              minggu: minggu,
            ),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: mingguKe == minggu
                ? Colors.teal
                : Theme.of(context).colorScheme.secondary,
          ),
          height: 50,
          child: Center(
            child: Text(
              minggu == 0 ? 'Semua' : 'Minggu ke $minggu',
              style: TextStyle(
                  fontSize: 16,
                  color: mingguKe == minggu
                      ? Colors.white
                      : Theme.of(context).colorScheme.outline),
            ),
          ),
        ),
      ),
    );
  }
}
