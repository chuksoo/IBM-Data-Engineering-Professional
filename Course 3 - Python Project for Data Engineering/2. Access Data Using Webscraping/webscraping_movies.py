# Consider that you have been hired by a Multiplex management organization 
# to extract the information of the top 50 movies with the best average rating 
# from the web link shared below.

# https://web.archive.org/web/20230902185655/https://en.everybodywiki.com/100_Most_Highly-Ranked_Films

# The information required is `Average Rank`, `Film`, and `Year`. You are required to 
# write a Python script `webscraping_movies.py` that extracts the information and 
# saves it to a `CSV` file `top_50_films.csv`. You are also required to save the same 
# information to a database `Movies.db` under the table name `Top_50`.

# Import libraries
import requests
import sqlite3
import pandas as pd
from bs4 import BeautifulSoup

# Initialization of known entities
url = 'https://web.archive.org/web/20230902185655/https://en.everybodywiki.com/100_Most_Highly-Ranked_Films'
db_name = 'Movies.db'
table_name = 'Top_50'
csv_path = '~/Documents/IBM-Data-Engineering-Professional/Course 3 - Python Project for Data Engineering/2. Access Data Using Webscraping/webscraping_movies/top_50_films.csv'
df = pd.DataFrame(columns=["Average Rank","Film","Year"])
count = 0

# Loading the webpage for Webscraping
html_page = requests.get(url).text
data = BeautifulSoup(html_page, 'html.parser')

# Using find_all() function
tables = data.find_all('tbody')
rows = tables[0].find_all('tr')

for row in rows:
    if count<50:
        col = row.find_all('td')
        if len(col)!=0:
            data_dict = {"Average Rank": col[0].contents[0],
                         "Film": col[1].contents[0],
                         "Year": col[2].contents[0]}
            df1 = pd.DataFrame(data_dict, index=[0])
            df = pd.concat([df,df1], ignore_index=True)
            count+=1
    else:
        break

print(df)

# Storing the data
df.to_csv(csv_path)

# Store the data to database
conn = sqlite3.connect(db_name)
df.to_sql(table_name, conn, if_exists='replace', index=False)
conn.close()



