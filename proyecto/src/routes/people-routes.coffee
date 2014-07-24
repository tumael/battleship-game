module.exports = (app, dbManager) ->
  PersonManager = require '../managers/person-manager'
  personManager = new PersonManager dbManager

  ###
   Gets all people
  ###
  app.get '/people/', (request, respons) ->
    console.log "GET: /people"

    personManager.find {}, (error, person) =>
      if error?
        console.log person
        result =
          data: person
          v: '1'
        respons.send result

  ###
   Gets a person by an Id
  ###
  app.get '/people/:person_id', (request, respons) ->
    console.log "GET: /people/:person_id"
    personId = request.query.person_id

    personManager.findById personId, (error, person) =>
      if error?
        console.log person
        result =
          data: person
          v: '1'
        respons.send result

  ###
   Adds a person
  ###
  app.post '/people', (request, respons) ->
    console.log "POST: /people"
    person = request.body.person

    personManager.add person, (error, newPerson) =>
      if error?
        console.log newPerson
        result =
          data: newPerson
          v: '1'
        respons.send result

  ###
  update the  person information
  ###
  app.put '/people/:person_id', (request, respons) ->
    console.log "put: /people/:person_id"
    personID = req.params.person_id
    newDataPerson = request.body.newDataPerson

    personManager.findByIdAndModify personID, newDataPerson, (error, updatedPerson) =>
      if error?
        console.log updatedPerson
        result =
          data: updatedPerson
          v: '1'
        respons.send result

  ###
  Deletes the  person by an Id
  ###
  app.delete '/people/:person_id', (request, respons) ->
    console.log "DELETE: /people/:person_id"
    personID = req.params.person_id

    personManager.remove personID, (error) =>
      result = {}
      if error?
        result =
          data: true
          v: '1'
      else
        result =
          data: false
          v: '1'
      respons.send result