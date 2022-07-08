import 'package:web_scraper/web_scraper.dart';

Future<List<List<String>>> getGasByZipCode(String ZipCode) async {
//Getting the response from the targeted url
  final webScraper = WebScraper('https://www.gasbuddy.com/');
  if (await webScraper.loadWebPage('home?search=' + ZipCode)) {
    print("Page loaded successfully");
    List<Map<String, dynamic>> elements = webScraper.getElement(
        'div.grid__column___nhz7X > div > div.GenericStationListItem-module__station___1O4vF > div > div.GenericStationListItem-module__priceColumn___UmzZ7 > div > span.StationDisplayPrice-module__price___3rARL',
        []);
    List<Map<String, dynamic>> elementsName = webScraper.getElement(
        'div.grid__column___nhz7X > div > div.GenericStationListItem-module__station___1O4vF > div > div.StationDisplay-module__column___3h4Wf > h3 > a',
        []);
    List<Map<String, dynamic>> elementsLoc = webScraper.getElement(
        'div.grid__column___nhz7X > div > div.GenericStationListItem-module__station___1O4vF > div> div.StationDisplay-module__column___3h4Wf > div.StationDisplay-module__address___2_c7v',
        []);
    print(elementsLoc);
    List<List<String>> gasPrices = [];
    for (var i = 0; i < elementsName.length; i++) {
      print("" +
          elementsName[i]['title'] +
          " at " +
          elementsLoc[i]['title'] +
          ": " +
          elements[i]['title']);
String temp = " ";
String tempLoc = " ";
String tempName = " ";
int num = elements[i]['title'].compareTo( elements[i+1]['title']);
if(num == 1){
   temp = elements[i]['title'];
  elements[i]['title'] = elements[i+1]['title'];
  elements[i+1]['title'] = temp;
   tempLoc = elementsLoc[i]['title'];
  elementsLoc[i]['title'] = elementsLoc[i+1]['title'];
  elementsLoc[i+1]['title'] = tempLoc;
   tempName = elementsName[i]['title'];
  elementsName[i]['title'] = elementsName[i+1]['title'];
  elementsName[i+1]['title'] = tempName;
  gasPrices.add([
        elementsName[i]['title'],
        elements[i]['title'],
        elementsLoc[i]['title']
      ]);
}
print(elements[i]['title'].compareTo( elements[i+1]['title']));
if (elementsLoc[i]['title'] == elementsLoc[i+1]['title']) {
  print("REMOVING");
  gasPrices.remove([
        elementsName[i+1]['title'],
        elements[i+1]['title'],
        elementsLoc[i+1]['title']
      ]);
}
 if( elements[i]['title'] == "---"){
            print("IT WORKED ");
          gasPrices.add([
        elementsName[i]['title'],
        'Data Not Available',
        elementsLoc[i]['title']
      ]);
      }
      else{
      gasPrices.add([
        elementsName[i]['title'],
        elements[i]['title'],
        elementsLoc[i]['title']
      ]);
      }
    }
    return gasPrices;
  } else {
    return [];
  }
}