from bs4 import BeautifulSoup
from pytz import country_names
from array import *
import requests
import time

zip = "92078"
print("(1)Regular, (2)Midgrade, (3)Premium, (4)Diesel, (5)E85")
fuel = 1
payment = 1

finalData = [[],[],[],[],[],[],[],[],[],[]]
fuelTypeList = [["1","Regular"],["2","Midgrade"],["3","Premium"],["4","Diesel"],["5","E85"]]
paymentTypeList = [["all","Credit and Cash"],["credit","Credit Only"]]

names = []
prices = []
locations = []
availableZip = True

# LOCATE HTML CODE BY ZIP ------------------------------------------
# (1)Regular, (2)Midgrade, (3)Premium, (4)Diesel, (5)E85
# ('all')Credit and Cash, ('credit')Credit Only
url = "https://www.gasbuddy.com/home?search=" + zip + "&fuel=" + fuelTypeList[fuel][0] + "&method=" + paymentTypeList[payment][0]

headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36'}
page = requests.get(url, headers=headers)
soup = BeautifulSoup(page.content, "html.parser")

count = 0
# DIV FOR NAME ------------------------------------------
for thing in soup.find_all ('div', class_='StationDisplay-module__mainInfoColumn___1ZBwz StationDisplay-module__column___3h4Wf'):
    finalData[count].append(thing.h3.a.text)
    count+=1

count = 0
# SPAN FOR PRICE ------------------------------------------
for thing in soup.find_all ("span",class_="text__xl___2MXGo text__left___1iOw3 StationDisplayPrice-module__price___3rARL"):
    finalData[count].append (thing.text)
    count+=1

count = 0
# DIV FOR ADDRESS ------------------------------------------
for thing in soup.find_all ('div', class_='StationDisplay-module__address___2_c7v'):
    location = ""
    location += thing.text
    finalData[count].append (location)
    count+=1

# ZIP AVAILABLE ------------------------------------------
for thing in soup.find_all('em'):
    availableZip = False

print(finalData)
print(availableZip)
print(url)


with open('data.txt', 'w') as filehandle:
    filehandle.write('%s\n' % (time.asctime() +", "+ str(availableZip)))
    filehandle.write('%s\n' % (zip +", "+ fuelTypeList[fuel][1] +", "+ paymentTypeList[payment][1]))
    for listitem in finalData:
        filehandle.write('%s\n' % listitem)