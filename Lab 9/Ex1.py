import psycopg2
from geopy.geocoders import Nominatim

geolocator = Nominatim(user_agent='VAV')


con = psycopg2.connect(database="dvdrental", user="postgres",
                       password="26470759", host="127.0.0.1", port="5432")


cur = con.cursor()

cur.callproc('change_address')

row = cur.fetchall()

for i in row:
    print(i[0])
    location = geolocator.geocode(i[0], timeout=None)

    if location != None:
        cur.execute(f'update address set latitude = {location.latitude}, longitude = {location.longitude} where address.address_id = {i[1]}')
    else:
        cur.execute(f'update address set latitude = 0, longitude = 0 where address.address_id = {i[1]}')

con.commit()
cur.close()
con.close()