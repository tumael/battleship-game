class DataManager

  constructor: (dataModel) ->
    @model = dataModel

  add: (item, callBack) ->
    @model.create item, (error, data) =>
      if error
        callBack true, null
      else
        callBack null, data

  findById: (filter, callback) ->
    @model.findById filter, (error, data) =>
      if error
        callBack true, null
      else
        callBack null, data

  findByIdAndModify: (id, newData, callback) ->
    filter =
      _id: id
    @model.findById filter, (error, data) =>
      if error
        callBack true, null
      else
        if data
          if data
            for attribute of newData
              data[attribute] = newData[attribute]
            data.save (error, updatedData) =>
              if error
                callBack true, null
              else
                callBack null, updatedData
          else
            callBack true, null
        else
          callBack true, null
        callBack null, data

  remove: (filter, callBack) ->
    @model.remove filter, (error, data) =>
      if error
        callBack true, null
      else
        callBack null, data

module.exports = DataManager