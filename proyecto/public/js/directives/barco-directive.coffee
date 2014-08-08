'use strict'

define ['directives'], (directives) ->
  directives.directive 'barco', () ->
    restrict: 'E'
    link: (scope, element, attrs) ->
      scope.dibujarBarco = (x, y, longitud, orientacion, duenio)->

        if duenio == 's'
          contextoTablero = scope.contextoTableroSistema
        else
          contextoTablero = scope.contextoTableroJugador

        inix = (x)*scope.tamanioSector
        iniy = (y)*scope.tamanioSector


        contextoTablero.moveTo inix, iniy
        if orientacion == 'h'
          ancho = (longitud)*scope.tamanioSector
          alto = scope.tamanioSector
        else
          ancho = scope.tamanioSector
          alto = scope.tamanioSector*longitud


        contextoTablero.fillStyle = "#00FF80"
        contextoTablero.fillRect inix, iniy, ancho, alto
      posX = parseInt(attrs.x)
      posY = parseInt(attrs.y)
      longitud = parseInt(attrs.longitud)
      orientacion = attrs.orientacion
      jugador = attrs.duenio
      scope.dibujarBarco posX, posY, longitud, orientacion, jugador
