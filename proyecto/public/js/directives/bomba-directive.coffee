'use strict'

define ['directives'], (directives) ->
  directives.directive 'dibujarBomba', () ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      scope.lanzarBomba=(x,y)->
        alert ('bombardeado..'+x )
        #tablero= document.getElementById("tablero")
        #contextoTablero = tablero.getContext("2d")

        scope.contextoTablero.font = 'bold 20px sans-serif'
        scope.contextoTablero.fillStyle = '#000'
        scope.contextoTablero.fillText 'x', (x+1)*scope.tamanioSector-21, (y+1)*scope.tamanioSector-11

      scope.lanzarBomba parseInt(attrs.x),parseInt(attrs.y)