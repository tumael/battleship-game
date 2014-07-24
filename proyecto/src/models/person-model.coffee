mongoose = require 'mongoose'

Person = new mongoose.Schema(
  firstName:
    type: String
    trim: true
    required: true
  lastName:
    type: String
    trim: true
    required: true
  CI:
    type: String
    uppercase: true
    trim: true
    unique: true
    required: true
    match: /^[a-zA-Z0-9.\-\()_/\s]+$/
)

module.exports = mongoose.model 'Person', Person