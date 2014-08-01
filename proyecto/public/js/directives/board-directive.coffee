'use strict'

define ['directives'], (directives) ->
  directives.directive 'board', () ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      contextoTablero = element[0].getContext("2d")

      scope.dibujarTablero = (alto,ancho,sector) =>

        #$scope.tablero= document.getElementById("tablero")
        #contextoTablero = tablero.getContext("2d")
        contextoTablero.fillStyle = "#999"
        contextoTablero.fillRect 0, 0, ancho, alto

        for i  in [1..10]
          #dibujando 1,2,3,4, en cada columna
          contextoTablero.font = 'bold 12px sans-serif'
          contextoTablero.fillStyle ='#000'
          contextoTablero.fillText(i, sector+i*sector-21, 0+20)

          #dibujando 1,2,3,4, en cada fila
          contextoTablero.font = 'bold 12px sans-serif'
          contextoTablero.fillStyle ='#000'
          contextoTablero.fillText(i, 0+10,sector+i*sector-11)

          #lineas horizontales
          contextoTablero.moveTo i*sector, 0
          contextoTablero.lineTo i*sector, alto

          #lineas verticales
          contextoTablero.moveTo 0, i*sector
          contextoTablero.lineTo ancho, i*sector
        contextoTablero.strokeStyle = "#eee"  #color de la tinta
        contextoTablero.stroke()  #poniendo la tinta a lo dibujado

      scope.dibujarTablero parseInt(attrs.height),parseInt(attrs.width), parseInt(attrs.tamanio)

      scope.lanzarBomba = (x,y) =>
        alert ('bombardeado..')
        #tablero= document.getElementById("tablero")
        #contextoTablero = tablero.getContext("2d")
        contextoTablero.font = 'bold 20px sans-serif'
        contextoTablero.fillStyle = '#000'
        contextoTablero.fillText 'x', x*30-21, y*30-11