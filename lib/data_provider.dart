class DataProvider{

  String title, content, ref;
  List<String> label;
  DataProvider(this.title, this.content, this.ref, this.label);

  static List<DataProvider> getInstance({String law = "HGB", String s}){

    final ln = s.split("\n");
    final p = new RegExp(r"\(weggefallen\)");

    final sep1 = r"|||";
    final sep2 = r"###";

    final regParag = new RegExp(r"^(§\s+\d+[a-z]*)\s+(.*)$");
    final regSatz = new RegExp(r"^\s*\((\d+[a-z]*)\)\s+(.*)$");

    List<DataProvider> res = [];

    ln.forEach((f){
       var l = f.split(sep1);

       if(l.length > 1 && !l[0].contains(p)){

          var match = regParag.allMatches(l[0]).elementAt(0);
          res.addAll(l[1].split(sep2)
              .map(
                (e){
                  var f = e.trim();
                  if(!regSatz.hasMatch(f))
                    return new DataProvider(match.group(2), f, "${match.group(1)} $law ", []);
                  else{
                    var m = regSatz.allMatches(f).elementAt(0);
                    return new DataProvider(match.group(2), m.group(2), "${match.group(1)}.${m.group(1)} $law ", []);
                  }
                })
          );
       }
    });

    return res;

  }

  static void migrate(){

  }
}