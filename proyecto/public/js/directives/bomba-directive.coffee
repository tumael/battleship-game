'use strict'

define ['directives'], (directives) ->
  directives.directive 'dibujarBomba', () ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      alert('directiva board:'+scope.barco.getBombas() )
      alert('directiva estamos llamando a contextoTablero:'+scope.contextoTablero )
      x=parseInt(attrs.x)
      y=parseInt(attrs.y)
      alert('lanzar bomba del directive')
      scope.lanzarBomba=(x,y)->
        alert ('bombardeado..')
        #tablero= document.getElementById("tablero")
        #contextoTablero = tablero.getContext("2d")

        scope.contextoTablero.font = 'bold 20px sans-serif'
        scope.contextoTablero.fillStyle = '#000'
        scope.contextoTablero.fillText 'x', x*30-21, y*30-11

      scope.lanzarBomba parseInt(attrs.x),parseInt(attrs.y)