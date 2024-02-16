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
		
db.collection_name.insertMany([
{       "Série": "Made in Heaven",
        "Temporadas disponíveis": 1,
        "Linguagem": "Hindi",
        "Genero": ["Drama"],
        "IMDb Avaliação": 8.3,
        "Classificação": "18+"
    },{
        "Série": "Homecoming",
        "Temporadas disponíveis": 2,
        "Linguagem": "Inglês",
        "Genero": ["Drama"],
        "IMDb Avaliação": 7.5,
        "Classificação": "16+"
    }]) #insert many documents in a collection

db.collection_name.find(                          
{ age: { $gt: 18  } },    #query criteria
{ name: 1, address: 1 }   #projection
).limit(5)				  #cursor modifier

#Examples
db.series.find({},{"Série":1, "Ano de lançamento": 1, "_id":0})
db.series.find({"Ano de lançamento": {$in: [2019,2020]}})
db.series.find({}, {Série: 1, Classificação: 1, _id: 0}).sort({"Série":1})
db.series.find({"Temporadas disponíveis": {$gte: 4}})
db.series.find({"Ano de lançamento": {$ne: 2020}}) #value different of
db.series.find({"Genero": {$all:["Ação", "Comédia"]}})

db.series.update({}, { $rename: {"Genero": "Gênero" }}, false, true); #modifier field name

db.series.updateOne({"Série": "Grimm"},{$set: {"Temporadas disponíveis": 6}})
db.series.updateMany({"Série":{$in:["Four More Shots Please", "Fleabag"]}},{$set: {"Classificação": "18+"}})

db.series.deleteOne({"Série": "The Boys"})
db.series.deleteMany({"Temporadas disponíveis": 1})

