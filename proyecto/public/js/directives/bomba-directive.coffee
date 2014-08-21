'use strict'

define ['directives'], (directives) ->
  directives.directive 'bomba', () ->
    restrict: 'E'
    link: (scope, element, attrs) ->
      if attrs.duenio == 's'
        contextoTablero = scope.contextoTableroSistema
      else
        contextoTablero = scope.contextoTableroJugador

      scope.lanzarBomba=(x,y)->
        contextoTablero.font = 'bold 20px sans-serif'
        contextoTablero.fillStyle = '#000'
        contextoTablero.fillText 'x', (x+1)*scope.tamanioSector-21, (y+1)*scope.tamanioSector-11

      scope.lanzarBomba parseInt(attrs.x),parseInt(attrs.y)
