import 'package:hive_flutter/adapters.dart';
import 'package:project_news/data/model/source.dart';

class SourceAdapter extends TypeAdapter<Source>{ /// انا هنا المفروض عملت adapter عشان اقدر اخزن ال source ولو ها تعمل ال article برضو هنا وعشان ميضربس ايرور فلازم تعمل adapter وبيبقا عايز من 3 ovverride function تمم لما تيجي تدوس علي اسم الكلاس الانا عاملوا هيظهرللك ال 3 تدوس يعملهم وانتا تكمل كتابة
  @override
  Source read(BinaryReader reader) {
   var json =  reader.readMap(); /// انا خلاص كتبتوا map في سطر 16 خلاص يبقا تقرا readmap
   return Source.fromJson(json); /// انا هنا عشان عايزني ارجعوا source فا لازم اقولوا fromjson عشان اجيب ال source  زي evently  ال firebase firestore
  }

  @override
  // TODO: implement typeId
  int get typeId => 1; /// دا رقم عادي

  @override
  void write(BinaryWriter writer, Source obj) {
    writer.writeMap(obj.toJson()); /// انا هنا بقولوا اكتبلي ال source علي انو map وتحولوا ال source tojson ل map بس
  }

}