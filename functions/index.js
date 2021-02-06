const functions = require("firebase-functions");
const admin = require('firebase-admin');
admin.initializeApp();
const database = admin.firestore(); 


 exports.checkForBookTransition = functions.pubsub.schedule('every 5 minutes').onRun(async (context)=>{
     const query = await database.collection.where("currentBookDue" , '<=', admin.firestore.Timestamp.name()).get();
     query.forEach(async eachGroup =>{
         await database.doc('groups/' + eachGroup.id).update({"currentBookDue": eachGroup.data()["nextBookDue"],
        "nextBookId":"waiting"})
     })
 })
 
