'use strict'

define ['directives'], (directives) ->
 directives.directive 'board', () ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      scope.contextoTablero = element[0].getContext("2d")
      #alert("hola "+typeof scope.contextoTablero)
      #alert('directiva board:'+scope.barco.bombas )
      scope.dibujarTablero = (alto,ancho,sector) =>

        #alert ("este es scope.sector: "+scope.tamanioSector)
        scope.contextoTablero.fillStyle = "#999"
        scope.contextoTablero.fillRect 0, 0, ancho, alto
        scope.tamanioSector=sector

        for i  in [1..10]
          #dibujando 1,2,3,4, en cada columna
          scope.contextoTablero.font = 'bold 12px sans-serif'
          scope.contextoTablero.fillStyle ='#000'
          scope.contextoTablero.fillText(i, sector+i*sector-21, 0+20)

          #dibujando 1,2,3,4, en cada fila
          scope.contextoTablero.font = 'bold 12px sans-serif'
          scope.contextoTablero.fillStyle ='#000'
          scope.contextoTablero.fillText(i, 0+10,sector+i*sector-11)

          #lineas horizontales
          scope.contextoTablero.moveTo i*sector, 0
          scope.contextoTablero.lineTo i*sector, alto

          #lineas verticales
          scope.contextoTablero.moveTo 0, i*sector
          scope.contextoTablero.lineTo ancho, i*sector
        scope.contextoTablero.strokeStyle = "#eee"  #color de la tinta
        scope.contextoTablero.stroke()  #poniendo la tinta a lo dibujado

      scope.dibujarTablero parseInt(attrs.height),parseInt(attrs.width), parseInt(attrs.tamanio)

