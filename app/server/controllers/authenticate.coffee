###
  Handles authenticate / unauthenticate session operations
  via socket.io & (TODO) http
###
config    = require GLOBAL.appRoot + 'config/config'
ORM       = require GLOBAL.appRoot + 'components/oRM'
bcrypt    = require 'bcrypt'
async     = require 'async'
_         = require 'underscore'
sequelize = ORM.setup()

employee  = ORM.model 'employee'
client    = ORM.model 'client'

module.exports = () ->
  app = GLOBAL.app 

  status = (req) ->
    if !_.isUndefined(req.session.user)
      req.io.respond _.extend
        authenticated: true,
        user:          req.session.user
    else
      req.io.respond
        authenticated: false

  authenticate = (req) ->
    #prevent DoS attacks
    if !req.data.username? || !req.data.password? || req.data.password.length > 70
      req.io.respond success: false
      return

    employee.find
      where:
        username: req.data.username
      include: [
        client
      ]
    .success (user) ->

      if !user?
        req.io.respond success: false
      else
        bcrypt.compare req.data.password, user.password, (err, res) ->
          if res

            respClient        = user.client.selectedValues
            userValues        = user.selectedValues
            userValues.client = respClient

            #dont send hashed password
            delete userValues.password

            #req.session.user = JSON.parse JSON.stringify user
            req.session.user = userValues

            #Hang out with the other cool super admins if you're a super admin
         #   if user.super_admin
         #     req.io.join 'super_admins'

            #Tell all the super cool admins a user just authenticated
         #   req.io.room('super_admins').broadcast 'user_authenticate', user

            req.session.save () ->
              req.io.respond 
                success: true
                user:    userValues
          else
            req.io.respond success: false

  unauthenticate = (req) ->
    delete req.session.user

    try
      #console.log req.io.manager.rooms
      for key, value of req.io.manager.rooms
        req.io.leave key.substring(1, key.length)
    catch e
      console.log e

    req.session.save () ->
      req.io.respond true


  #Bind methods to routes
  app.io.route 'authenticate',
    status:         status
    authenticate:   authenticate
    unauthenticate: unauthenticate


