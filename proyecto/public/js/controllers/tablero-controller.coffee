define ['controllers'], (controllers) -> #es el modulo principal de controladores donde estan todos los controladores
  controllers.controller 'tableroController', ['$scope', ($scope)->
    # estas 4 variables deben estar disponibles para su uso por las directivas
    $scope.tamanioSector=0 # numero de pixels usados por las diretivas para dibujar tablero, barcos y bombas
    $scope.contextoTablero={}  #objeto canvas, donde ocurre toda la historia
    $scope.barcos=[] # este array de objetos de Barco ademas de administrar los barcos, permitira a la directiva dibujar los barcos
    $scope.bombasTablero=[]  # este arreglo, permitira a la directiva dibujar las bombas
    class Barco
      constructor:(@x,@y,@longitud,@direccion)->
        #x,y es la posicion inicial
        #longitud de 1 a 4,lo q significa lonMax 4xtamaÃ±o sector
        @ahogado=false
        @bombas=[]
        for i in [0..@longitud]
          @bombas[i]='l' #inicializa el array de bombas del barco como l=libre


      getBombas: () =>
        return @bombas
      getAhogado: () ->
        return @ahogado

      # este metodo actualiza el array de bombas de un barco,
      # que permite saber si el barco esta o no ahogado
      recibirBomba: (bombaX,bombaY)->
        for i in [1..@longitud]
          #bombas cuando direccion es horizontal
          if @direccion =='h' and (@x+i-1)==bombaX and @y==bombaY
            @bombas[i]='b'
          #bombas cuando direccion es vertical
          if @direccion=='v' and @x==bombaX and (@y+i-1)==bombaY
            @bombas[i]='b'
        @estaAhogado()


      #Este metodo actualiza el atributo ahogado (true, false)
      estaAhogado: ()->
        libreBombas=false
        if @ahogado
          return @ahogado
        for i in [1..@longitud]
          if @bombas[i]=='l'
            libreBombas=true
        if !libreBombas
           alert "barco hundido! :("
        @ahogado=!libreBombas

    # Agrega un nuevo barco a nuestro tablero
    # La directiva ng-repeat  utiliza este array para dibujar los barcos
    $scope.agregarBarco=(x,y,tamanio,direccion)->
        barco=new Barco(x,y,tamanio,direccion)
        $scope.barcos.push(barco)

    # recibe las bombas al tablero
    # actualiza estado de los barcos
    # actualiza array bombasTablero
    # la directiva ng-repeat utiliza este array p/dibujar las bombas
    $scope.recibirBombas=(x,y)->
       for i in [0..$scope.barcos.length-1]
         $scope.barcos[i].recibirBomba(x,y)
       if $scope.checkearBarcosHundidos()
         alert 'flota hundida'
       actualizarArregloBombasTablero(x,y)

    #esta funcion actualiza el arreglo de sitios bombardeados, para que
    # la directiva bomba, dibuje las bombas
    actualizarArregloBombasTablero=(x,y)->
      agregarBomba=true
      if $scope.bombasTablero.length>0
        for i in [0..$scope.bombasTablero.length - 1]
          if $scope.bombasTablero[i].x==x and $scope.bombasTablero[i].y==y
            alert "Ese sitio ya fue bombardeado"
            agregarBomba=false
      if agregarBomba
         nuevaBomba={
           x:x
           y:y
         }
         $scope.bombasTablero.push(nuevaBomba)


    # esta funcion devuelve true si la flota esta hundida
    $scope.checkearBarcosHundidos=()->
      for i in [0..$scope.barcos.length-1]
         if !$scope.barcos[i].getAhogado()
            return false
      return true
  ]