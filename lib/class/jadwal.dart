class Jadwal {
  final jadwalPiketGalon = [
    'Fairuz',
    'Kiral',
    'Reinandy',
    'Ahmad',
    'Fauzan',
    'Yefta',
    'Faathir'
  ];

  final jadwalBuangSampah = [
    'Annisa', //1 0
    'Pipah', //2 1
    'Aliya', //3 2
    'Renata', //4 3
    'Tika', //5 4
    'Zaenah', //6 5
    'Luthfie', //1 6
    'Reinandy', //2 7
    'Ichsan', //3 8
    'Fauzan', //4 9
    'Bang Reza', //5 10
    'Rahmat', //6 11
    'Anwar',
    'Bintang',
    'Ahmad',
    'Faathir',
    'Farhan',
    'Fairuz',
    'Yefta',
    'Tohuron',
    'Galang',
    'Tubagus',
    'Kiral',
    'Awal',
  ];

  final jadwalPiketLantai6 = [
    'Anwar, Kiral',
    'Faathir, Fairuz',
    'Tubagus, Fairuz',
    'Fauzan, Ahmad',
    'Reinandy, Farhan',
    'Luthfi, Yefta, Faathir',
  ];

  final jadwalPiketGalonlt3 = [
    'Tubagus',
    'Galang',
    'Rahmat',
    'Anwar',
    'Ichsan',
    'Bintang',
    'Luthfie',
    'Farhan',
    'Ichsan',
    'Awal',
    'Reza',
    'Rahmat',
    'Anwar',
    'Bintang',
    'Danang',
    'Chandra',
    'Farhan',
    'Tohuron',
    'Reza',
    'Tohuron',
    'Galang',
    'Tubagus',
    'Luthfie',
    'Awal',
  ];

  final weekDay = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
  ];

  int getDifferenceWithoutWeekends(
      DateTime startDate, DateTime endDate, String type) {
    int nbDays = 0;
    DateTime currentDay = startDate;
    while (currentDay.isBefore(endDate)) {
      currentDay = currentDay.add(const Duration(days: 1));
      if (currentDay.weekday != DateTime.sunday) {
        nbDays += 1;
      }
    }
    if (type == 'sampah') {
      while (nbDays > jadwalBuangSampah.length) {
        nbDays -= jadwalBuangSampah.length;
      }
    } else if (type == 'lantai6') {
      while (nbDays > jadwalPiketLantai6.length) {
        nbDays -= jadwalPiketLantai6.length;
      }
    } else {
      while (nbDays > jadwalPiketGalon.length) {
        nbDays -= jadwalPiketGalon.length;
      }
    }
    return nbDays;
  }

  DateTime dateAddWithoutWeekends(DateTime startDate, int day) {
    DateTime currentDay = startDate.add(Duration(days: day));
    if (currentDay.weekday == DateTime.sunday) {
      currentDay = currentDay.add(const Duration(days: 1));
    }

    return currentDay;
  }

  int getMingguKeberapa(int dateDiff) {
    int mingguKe = 1;
    int dd = dateDiff;
    while (dd > 6) {
      dd -= 6;
      mingguKe += 1;
    }
    return mingguKe;
  }
}
