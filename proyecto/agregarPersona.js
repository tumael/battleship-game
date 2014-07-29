var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/Winter');
// var Person = mongoose.model('Person', { firstName: String, lastName:String, CI:String });
//
// var franz = new Person({ firstName: 'franz A', lastName: 'lopez choque', CI: '1234' });
// franz.save(function (err) {
//             if (err) // ...
//             console.log('meow');
// });


var movieSchema = new mongoose.Schema({
  firstName: { type: String }
, lastName: { type: String }
, CI: { type: String }
});

// Compile a 'Movie' model using the movieSchema as the structure.
// Mongoose also creates a MongoDB collection called 'Movies' for these documents.
// var Movie = mongoose.model('Movie', movieSchema);
//
// var thor = new Movie({
//   firstName: 'B'
// , lastName: 'PG-13'
// , CI: '2011'  // Notice the use of a String rather than a Number - Mongoose will automatically convert this for us.
// });
//
// thor.save(function(err, thor) {
//   if (err) return console.error(err);
//   console.dir(thor);
// });
// Movie.find(function(err, movies) {
//   if (err) return console.error(err);
//   //console.dir(movies);
// });
//

var Person = new mongoose.Schema({
  firstName: {
    type: String,
    trim: true,
    required: true
  },
  lastName: {
    type: String,
    trim: true,
    required: true
  },
  CI: {
    type: String,
    uppercase: true,
    trim: true,
    unique: true,
    required: true,
    match: /^[a-zA-Z0-9.\-\()_/\s]+$/
  }
});
var Person = mongoose.model('Person', Person);
var query = Person.find({});

query.where({"firstName" : "franz"});
query.exec(function (err, docs) {
  // called when the `query.complete` or `query.error` are called
  // internally
console.dir(docs);
});

// var franz = new Person({
//   firstName: 'franz'
// , lastName: 'lopez'
// , CI: '1-2014'  // Notice the use of a String rather than a Number - Mongoose will automatically convert this for us.
// });
// franz.save(function(err, franz) {
//   if (err) return console.error(err);
//   console.dir(franz);
// });
// Person.find(function(err, movies) {
//   if (err) return console.error(err);
//   console.dir(movies);
// });



