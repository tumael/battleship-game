'use strict'

define ['directives'], (directives) ->
  directives.directive 'barco', () ->
    restrict: 'E'
    link: (scope, element, attrs) ->
      scope.dibujarBarco=(x,y,longitud, orientacion)->
        alert ('Directiva dibujar barco..'+x )
        #tablero= document.getElementById("tablero")
        #contextoTablero = tablero.getContext("2d")

        inix=(x)*scope.tamanioSector
        iniy= (y)*scope.tamanioSector


        scope.contextoTablero.moveTo inix,iniy
        if orientacion=='h'
          ancho=(longitud)*scope.tamanioSector
          alto=scope.tamanioSector
        else
          ancho=scope.tamanioSector
          alto=scope.tamanioSector*longitud


        scope.contextoTablero.fillStyle = "#00FF80"
        scope.contextoTablero.fillRect inix, iniy, ancho, alto


# scope.contextoTablero.lineTo (x)*scope.tamanioSector, scope.tamanioSector
      #  scope.contextoTablero.strokeStyle = "#00FF80"  #color de la tinta
      #  scope.contextoTablero.stroke()  #poniendo la tinta a lo dibujado




      scope.dibujarBarco parseInt(attrs.x),parseInt(attrs.y),parseInt(attrs.longitud), attrs.orientacion
