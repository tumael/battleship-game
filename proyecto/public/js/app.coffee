'use strict'

define [
 "angular"
 "css!generalStyle"
 "ngRoute"
 "controllers"
 "directives"
 "services"
 "ngDragDrop"
], (angular) ->
  battleShipsApp = angular.module "battleShipsApp", [
    "ngRoute"
    "battleShipsControllers"
    "battleShipsDirectives"
    "battleShipsServices"
    "ngDragDrop"
  ]

  # Sets the URL routes for partial views.
  battleShipsApp.config [
    "$routeProvider"
  , ($routeProvider) ->
      $routeProvider.when("/",
        templateUrl: "main.html"
      ).otherwise
        redirectTo: "/main.html"
  ]

  battleShipsApp
