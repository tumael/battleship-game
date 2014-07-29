'use strict'

define [
 "angular"
 "css!generalStyle"
 "ngRoute"
 "controllers"
 "directives"
 "services"
 "ngDragDrop"
 "dibujarTableroController2" #nombre de mi controlador definido en main.coffee
       #notar no es el nombre de la funcion sino del nombre de la referencia al archivo
       #la referencia y ruta al archivo se define en main.app
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
