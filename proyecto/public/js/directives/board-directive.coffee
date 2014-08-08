'use strict'

define ['directives'], (directives) ->
 directives.directive 'board', () ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      if attrs.duenio == 's'
        scope.contextoTableroSistema = element[0].getContext("2d")
        contextoTablero= scope.contextoTableroSistema
      else
        scope.contextoTableroJugador = element[0].getContext("2d")
        contextoTablero=scope.contextoTableroJugador
      alert  "canvas:"+ contextoTablero
      #alert("hola "+typeof scope.contextoTablero)
      #alert('directiva board:'+scope.barco.bombas )
      dibujarTablero = (alto,ancho,sector) =>

        #alert ("este es scope.sector: "+scope.tamanioSector)
        contextoTablero.fillStyle = "#999"
        contextoTablero.fillRect 0, 0, ancho, alto
        scope.tamanioSector=sector

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

      dibujarTablero parseInt(attrs.height),parseInt(attrs.width), parseInt(attrs.tamanio)