db = db.getSiblingDB("blog_db");

db.createCollection("posts", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["titre", "auteur", "vues"],
      properties: {
        titre: { bsonType: "string" },
        auteur: { bsonType: "string" },
        vues: { bsonType: "int" }
      }
    }
  },
  validationAction: "error"
});

db.posts.insertMany([
  { titre: "Article 1", auteur: "Alice", vues: NumberInt(10) },
  { titre: "Article 2", auteur: "Bob", vues: NumberInt(20) },
  { titre: "Article 3", auteur: "Charlie", vues: NumberInt(30) },
  { titre: "Article 4", auteur: "Diane", vues: NumberInt(40) },
  { titre: "Article 5", auteur: "Evan", vues: NumberInt(50) }
]);

print("Base blog_db initialisée");