class DataProvider{

  String title, content, ref;
  List<String> label;
  DataProvider(this.title, this.content, this.ref, this.label);

  static List<DataProvider> getInstance(){
    return [
      DataProvider("Pflicht zur Aufstellung", "Der Kaufmann hat zu Beginn seines Handelsgewerbes und für den Schluß eines jeden Geschäftsjahrs einen das Verhältnis seines Vermögens und seiner Schulden darstellenden Abschluß (Eröffnungsbilanz, Bilanz) aufzustellen. Auf die Eröffnungsbilanz sind die für den Jahresabschluß geltenden Vorschriften entsprechend anzuwenden, soweit sie sich auf die Bilanz beziehen.", "§ 242.1 HGB", ["HGB", "Pflicht"]),
      DataProvider("Umfang eines Jahresabschlusses", "Die Bilanz und die Gewinn- und Verlustrechnung bilden den Jahresabschluß.", "§ 242.3 HGB", ["HGB", "Jahresabschluss"]),
      DataProvider("Befreiung von der Pflicht zur Buchführung und Erstellung eines Inventars", "Einzelkaufleute, die an den Abschlussstichtagen von zwei aufeinander folgenden Geschäftsjahren nicht mehr als jeweils 600 000 Euro Umsatzerlöse und jeweils 60 000 Euro Jahresüberschuss aufweisen, brauchen die §§ 238 bis 241 nicht anzuwenden. Im Fall der Neugründung treten die Rechtsfolgen schon ein, wenn die Werte des Satzes 1 am ersten Abschlussstichtag nach der Neugründung nicht überschritten werden.", "§ 241a HGB", ["HGB", "Jahresabschluss", "Befreiung"]),
    ];
  }
}