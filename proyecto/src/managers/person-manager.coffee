DBManager = require './db-manager'
PersonModel = require '../models/person-model'

class PersonManager

  constructor: ->
    @dataManager = new DBManager PersonModel

  findById: (filter, callBack) =>
    @dataManager.findById filter, callBack

  add: (newPerson, callBack) =>
    @dataManager.add newPerson, callBack

  findByIdAndModify: (personID, newDataPerson, callBack) =>
    @dataManager.add personID, newDataPerson, callBack

  remove: (personID, callBack) =>
    @dataManager.remove {_id: personID}, callBack

module.exports = PersonManager