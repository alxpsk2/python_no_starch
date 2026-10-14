from elasticsearch import Elasticsearch
from openai import OpenAI, AzureOpenAI
from dotenv import load_dotenv
import os
from pprint import pprint

es_client = Elasticsearch("http://localhost:9200")

# Get configuration settings 
load_dotenv()
azure_oai_endpoint = os.getenv("AZURE_OAI_ENDPOINT")
azure_oai_key = os.getenv("AZURE_OAI_KEY")
azure_oai_deployment = os.getenv("AZURE_OAI_DEPLOYMENT")

openai_client = AzureOpenAI(
    api_version="2024-02-15-preview",
    api_key=azure_oai_key,
    azure_endpoint=azure_oai_endpoint
)

movies = [
    {"title": "Inception", "genre": "Sci-Fi", "release_year": 2010},
    {"title": "The Shawshank Redemption", "genre": "Drama", "release_year": 1994},
    {"title": "The Godfather", "genre": "Crime", "release_year": 1972},
    {"title": "Pulp Fiction", "genre": "Crime", "release_year": 1994},
    {"title": "Forrest Gump", "genre": "Drama", "release_year": 1994},    
    {"title": "Scarface", "genre": "Crime", "release_year": 1983},
    {"title": "The Empire Strikes Back", "genre": "Sci-Fi", "release_year": 1980},
    {"title": "The Dark Knight", "genre": "Action", "release_year": 2008},
    {"title": "Fight Club", "genre": "Drama", "release_year": 1999},
    {"title": "The Matrix", "genre": "Sci-Fi", "release_year": 1999},
    {"title": "Goodfellas", "genre": "Crime", "release_year": 1990},
    {"title": "The Silence of the Lambs", "genre": "Thriller", "release_year": 1991},
    {"title": "Se7en", "genre": "Thriller", "release_year": 1995},
    {"title": "The Usual Suspects", "genre": "Thriller", "release_year": 1995},
    {"title": "The Sixth Sense", "genre": "Thriller", "release_year": 1999},
    {"title": "Memento", "genre": "Thriller", "release_year": 2000},
    {"title": "The Prestige", "genre": "Thriller", "release_year": 2006},
    {"title": "Gone Girl", "genre": "Thriller", "release_year": 2014},
    {"title": "The Departed", "genre": "Crime", "release_year": 2006},
    {"title": "The Social Network", "genre": "Drama", "release_year": 2010},
    {"title": "Interstellar", "genre": "Sci-Fi", "release_year": 2014},
    {"title": "Django Unchained", "genre": "Western", "release_year": 2012},
    {"title": "Gladiator", "genre": "Action", "release_year": 2000},
    {"title": "Braveheart", "genre": "Historical Drama", "release_year": 1995},
    {"title": "Titanic", "genre": "Romance", "release_year": 1997},
    {"title": "Avatar", "genre": "Sci-Fi", "release_year": 2009},
    {"title": "Jurassic Park", "genre": "Adventure", "release_year": 1993},
    {"title": "The Lord of the Rings: The Fellowship of the Ring", "genre": "Fantasy", "release_year": 2001},
    {"title": "The Lord of the Rings: The Two Towers", "genre": "Fantasy", "release_year": 2002},
    {"title": "The Lord of the Rings: The Return of the King", "genre": "Fantasy", "release_year": 2003},
    {"title": "Harry Potter and the Sorcerer's Stone", "genre": "Fantasy", "release_year": 2001},
    {"title": "Harry Potter and the Chamber of Secrets", "genre": "Fantasy", "release_year": 2002},
    {"title": "Harry Potter and the Prisoner of Azkaban", "genre": "Fantasy", "release_year": 2004},
    {"title": "Harry Potter and the Goblet of Fire", "genre": "Fantasy", "release_year": 2005},
    {"title": "Harry Potter and the Order of the Phoenix", "genre": "Fantasy", "release_year": 2007},
    {"title": "Harry Potter and the Half-Blood Prince", "genre": "Fantasy", "release_year": 2009},
    {"title": "Harry Potter and the Deathly Hallows: Part 1", "genre": "Fantasy", "release_year": 2010},
    {"title": "Harry Potter and the Deathly Hallows: Part 2", "genre": "Fantasy", "release_year": 2011},
    {"title": "The Hobbit: An Unexpected Journey", "genre": "Fantasy", "release_year": 2012},
    {"title": "The Hobbit: The Desolation of Smaug", "genre": "Fantasy", "release_year": 2013},
    {"title": "The Hobbit: The Battle of the Five Armies", "genre": "Fantasy", "release_year": 2014},
    {"title": "The Chronicles of Narnia: The Lion, the Witch and the Wardrobe", "genre": "Fantasy", "release_year": 2005},
    {"title": "The Chronicles of Narnia: Prince Caspian", "genre": "Fantasy", "release_year": 2008},
    {"title": "The Chronicles of Narnia: The Voyage of the Dawn Treader", "genre": "Fantasy", "release_year": 2010},
    {"title": "The Chronicles of Narnia: The Silver Chair", "genre": "Fantasy", "release_year": 2022}
]

# Indexing movies
for movie in movies:
    movie['title_embedding'] = openai_client.embeddings.create(
        input=[movie['title']], model='text-embedding-ada-002'
    ).data[0].embedding
    print(movie)
    print(movie['title_embedding'])
    if es_client.indices.exists(index="movies"):
        print("YES!!")
    es_client.index(index="movies", document=movie)

vector_value = openai_client.embeddings.create(
        input=["harry"], model='text-embedding-ada-002'
    ).data[0].embedding

query_string = {
    "field": "title_embedding",
    "query_vector": vector_value,
    "k": 3,
    "num_candidates": 100
}

results = es_client.search(index="movies", knn=query_string, source_includes=["title", "genre", "release_year"])

pprint(results['hits']['hits'])