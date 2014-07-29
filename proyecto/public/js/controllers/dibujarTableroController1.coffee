define ['controllers'], (controllers) -> #es el modulo principal de controladores donde estan todos los controladores
  controllers.controller 'tableController', ['$scope', ($scope)->
    $scope.tablero= document.getElementById("tablero")
    $scope.contextoTablero = tablero.getContext("2d")
    $scope.hola='esto lo puse con ANGULAR'

    $scope.dibujarTablero = (x,y) ->
      $scope.hola='Dibujando Tablero'
      #$scope.tablero= document.getElementById("tablero")
      #contextoTablero = tablero.getContext("2d")
      $scope.contextoTablero.fillStyle ="#999"
      $scope.contextoTablero.fillRect(x, y, 330, 330)
      for i  in [1..10]
        #dibujando 1,2,3,4, en cada columna
        $scope.contextoTablero.font = 'bold 12px sans-serif'
        $scope.contextoTablero.fillStyle ='#000'
        $scope.contextoTablero.fillText(i, 30+i*30-21, 0+20)

        #dibujando 1,2,3,4, en cada fila
        $scope.contextoTablero.font = 'bold 12px sans-serif'
        $scope.contextoTablero.fillStyle ='#000'
        $scope.contextoTablero.fillText(i, 0+10,30+i*30-11)

        #lineas horizontales
        $scope.contextoTablero.moveTo(i*30,0)
        $scope.contextoTablero.lineTo(i*30,330)
        #lineas verticales
        $scope.contextoTablero.moveTo(0,i*30)
        $scope.contextoTablero.lineTo(330,i*30)
      $scope.contextoTablero.strokeStyle = "#eee"  #color de la tinta
      $scope.contextoTablero.stroke();  #poniendo la tinta a lo dibujado

    $scope.lanzarBomba = (x,y)->
      alert ('bombardeado..'+x+':'+y)
      $scope.hola= 'bombardeando '+x+':'+y
      $scope.contextoTablero.font = "bold 20px sans-serif"
      $scope.contextoTablero.fillStyle ="#000"
      $scope.contextoTablero.fillText('x', 30+x*30-21,30+y*30-11)

  ]