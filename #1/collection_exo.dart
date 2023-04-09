// Exercise: Create a map with name, phone keys and store some values to it. Use where to find all keys that have length 4.
void main() {
  Map<String, String> phones = {
    "Guy1" : "500",
    "Guy2" : "6000",
    "Guy3" : "7000",
    "Guy4" : "80000"
  };

  Map<String, String> filteredPhones = Map.fromEntries(phones.entries.where(
    (entry) => (entry.value.length == 4)
  ));

  print(filteredPhones);
}