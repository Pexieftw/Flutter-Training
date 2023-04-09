import "dart:io";
void main () async {
  final path = "data.csv";
  // Sync
  print("Print Synchronously:");
  var data = getDataSync(path);
  print(data);

  // Async
  print("Print Asynchronously:");
  try{
    var data2 = await getDataAsync(path);
    print(data2);
  } catch(e) {
    print(e);
  }
}

String getDataSync(String filename){
  var file = File(filename);
  if (!(file.existsSync())){
    throw Exception("File does not exist");
  }
  return file.readAsStringSync();
}

Future getDataAsync(String filename) async{
  var file = File(filename);
  if (!(await file.exists())) {
    throw Exception("File does not exist");
  }
  String content = await file.readAsString();
  return content;
}