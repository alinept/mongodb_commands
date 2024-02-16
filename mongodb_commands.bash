use database_name

db.createCollection("collection_name")

db.collection_name.drop() #remove collection

db.dropDatabase() #remove database

db.collection_name.insertOne({
"Série": "Fleabag",
        "Ano de lançamento": 2016,
        "Temporadas disponíveis": 2,
        "Linguagem": "Inglês",
        "IMDb Avaliação": 8.7})  #insert document in some collection