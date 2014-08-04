define ['controllers'], (controllers) -> #es el modulo principal de controladores donde estan todos los controladores
  controllers.controller 'tableroController', ['$scope', ($scope)->
    $scope.tamanioSector=30
    $scope.contextoTablero={}

    class Barco
      constructor:(@x,@y,@longitud,@direccion)->
        #x,y es la posicion inicial
        #longitud de 1 a 4,lo q significa lonMax 4xtamaÃ±o sector
        @ahogado=false
        @bombas=[]
        for i in [0..@longitud]
          @bombas[i]='l'
      getBombas: () =>
        return @bombas
      getAhogado: () ->
        return @ahogado
      recibirBomba: (bombaX,bombaY)->
        alert "arreglo de bombas al inicio de recibir bombas"+@getBombas()
        for i in [1..@longitud]
          #bombas cuando direccion es horizontal
          if @direccion =='h' and (@x+i-1)==bombaX and @y==bombaY
            @bombas[i]='b'
          #bombas cuando direccion es vertical
          if @direccion=='v' and @x==bombaX and (@y+i-1)==bombaY
            @bombas[i]='b'
        #lanzaBombas=require("boardDirective")ARIEL o ERIK
        #lanzaBombas.dibujarBomba()
        @estaAhogado()
        alert "arreglo de bombas al terminar de recibir bombas"+@getBombas()
      estaAhogado: ()->
        libreBombas=false
        if @ahogado
          return @ahogado
        for i in [1..@longitud]
          if @bombas[i]=='l'
            libreBombas=true
        @ahogado=!libreBombas

#prueba de clase bargo, constructor
    #$scope.barco=new Barco(4,5,3,'h')
    #alert('creo barco:'+$scope.barco.getBombas())


    $scope.barcos=[]
    $scope.agregarBarco=(x,y,tamanio,direccion)->
        barco=new Barco(x,y,tamanio,direccion)
        $scope.barcos.push(barco)
    $scope.recibirBombas=(x,y)->
       for i in [0..$scope.barcos.length-1]
         $scope.barcos[i].recibirBomba(x,y)
       if $scope.checkearBarcosUndidos()
         alert 'flota undida'

    $scope.checkearBarcosUndidos=()->
      #flotaUndida=false
      for i in [0..$scope.barcos.length-1]
         if !$scope.barcos[i].getAhogado()
            return false
      return true







  ]
