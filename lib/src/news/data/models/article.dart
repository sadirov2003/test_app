// ignore_for_file: public_member_api_docs, sort_constructors_first
class Article {
  Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.readed = false,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  bool readed;
  final String? description;
}

//Все это может быть лишным для этой задачи. Просто скопировал код, который когда-то написал.
String timePublished(String dataTime) {
  final parser = DateTime.parse(dataTime);
  final now = DateTime.now();
  final difference = parser.difference(now);
  final days = -difference.inDays;
  final hours = -difference.inHours;
  int month = 0, year = 0;
  String timePublish;
  if (days == 0) {
    timePublish = hours.toString() + hourSuffix(hours);
  } else if (days >= 30) {
    month = days ~/ 30;
    timePublish = month.toString() + monthSuffix(month);
  } else if (month >= 12) {
    year = month ~/ 12;
    timePublish = year.toString() + yearSuffix(year);
  } else {
    timePublish = days.toString() + daySuffix(days);
  }

  return timePublish;
}


//Чтобы определить окончания слов 'час'
String hourSuffix(int time) {
  if (time == 1) {
    return ' час назад';
  } else if (time >= -2 && time <= -4) {
    return ' часа назад';
  } else {
    return ' часов назад';
  }
}

//Чтобы определить окончания слов 'день'
String daySuffix(int time) {
  if (time == 1) {
    return ' day ago';
  } else if (time >= 2 && time <= 4) {
    return ' days ago';
  } else {
    return ' days ago';
  }
}

//Чтобы определить окончания слов 'месяц'
String monthSuffix(int time) {
  if (time == 1) {
    return ' месяц назад';
  } else if (time >= 2 && time <= 4) {
    return ' месяца назад';
  } else {
    return ' месяцев назад';
  }
}

//Чтобы определить окончания слов 'год'
String yearSuffix(int time) {
  if (time == 1) {
    return ' год назад';
  } else if (time >= 2 && time <= 4) {
    return ' года назад';
  } else {
    return ' лет назад';
  }
}

