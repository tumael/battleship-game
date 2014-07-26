var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/Winter');

var Person = mongoose.model('Person', { firstName: String, lastName:String, CI:String });

var franz = new Person({ firstName: 'franz', lastName: 'lopez', CI: '123' });
franz.save(function (err) {
            if (err) // ...
            console.log('meow');
});
