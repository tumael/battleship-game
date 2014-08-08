define ['controllers'], (controllers) -> #es el modulo principal de controladores donde estan todos los controladores
  controllers.controller 'tableroController', ['$scope', ($scope)->
    # estas 4 variables deben estar disponibles para su uso por las directivas
    $scope.tamanioSector=0 # numero de pixels usados por las diretivas para dibujar tablero, barcos y bombas
    $scope.contextoTableroJugador={}  #objeto canvas, donde ocurre toda la historia
    $scope.barcosJugador=[] # este array de objetos de Barco ademas de administrar los barcos, permitira a la directiva dibujar los barcos
    $scope.bombasTableroJugador=[]  # este arreglo, permitira a la directiva dibujar las bombas

    #Variables de IA
    $scope.contextoTableroSistema={}
    $scope.barcosSistema=[]
    $scope.bombasTableroSistema=[]
    $scope.bombasTableroSistemaDibujar=[]

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
      #Este metodo es true si sectorX y sectorY esta ocupado por este barco
      estaOcupadoSector:(sectorX,sectorY)->
        ocupado=false
        for i in [1..@longitud]

          if @direccion =='h' and (@x+i-1)==sectorX and @y==sectorY
            return true

          if @direccion=='v' and @x==sectorX and (@y+i-1)==sectorY
            return true
        return ocupado



    # Agrega un nuevo barco a nuestro tablero
    # La directiva ng-repeat  utiliza este array para dibujar los barcos
<<<<<<< HEAD
    $scope.agregarBarco=(x,y,tamanio,direccion)->
      if estaDentroDeTablero(x,y,tamanio,direccion)
        if !checkearColisionBarco(x,y,tamanio,direccion)
          barco=new Barco(x,y,tamanio,direccion)
          $scope.barcos.push(barco)
          alert "sin colision"
        else
          alert "Colision de barco: Poner nueva ubicacion"
      else
        alert "salio del tablero"
     # recibe las bombas al tablero
=======
    $scope.agregarBarco=(x,y,tamanio,direccion, duenio)->
        if duenio == 's'
          barcoAgregar=$scope.barcosSistema
        else
          barcoAgregar=$scope.barcosJugador

        barco=new Barco(x,y,tamanio,direccion)
        barcoAgregar.push(barco)

    # recibe las bombas al tablero
>>>>>>> origin/feature/tableroMaquina
    # actualiza estado de los barcos
    # actualiza array bombasTablero
    # la directiva ng-repeat utiliza este array p/dibujar las bombas
    $scope.recibirBombas=(x,y, duenio)->
      if duenio == 's'
          barcosBombardeados=$scope.barcosSistema
      else
          barcosBombardeados=$scope.barcosJugador

      if barcosBombardeados.length >0
          for i in [0..barcosBombardeados.length-1]
             barcosBombardeados[i].recibirBomba(x,y)
          if $scope.checkearBarcosHundidos(barcosBombardeados)
              alert 'flota hundida'
          actualizarArregloBombasTablero(x,y, barcosBombardeados)

    #esta funcion actualiza el arreglo de sitios bombardeados, para que
    # la directiva bomba, dibuje las bombas
    actualizarArregloBombasTablero=(x,y, bombasTablero)->
      agregarBomba=true
      if bombasTablero.length>0
        for i in [0..bombasTablero.length - 1]
          if bombasTablero[i].x==x and bombasTablero[i].y==y
            alert "Ese sitio ya fue bombardeado"
            agregarBomba=false
      if agregarBomba
         nuevaBomba={
           x:x
           y:y
         }
         bombasTablero.push(nuevaBomba)


    # esta funcion devuelve true si la flota esta hundida
    $scope.checkearBarcosHundidos=(barcos)->
      for i in [0..barcos.length-1]
         if !barcos[i].getAhogado()
            return false
      return true

    # Funcion que devuelve falso si no existe colision con el nuevo barco
    checkearColisionBarco=(nuevoX,nuevoY,nuevaLongitud,nuevaDireccion)->
      colision=false
      if $scope.barcos.length > 0
        for i in [0..$scope.barcos.length-1]
          for j in [1..nuevaLongitud]
            if nuevaDireccion =='h' and $scope.barcos[i].estaOcupadoSector(nuevoX+j-1,nuevoY)
              return true
            if nuevaDireccion =='v' and $scope.barcos[i].estaOcupadoSector(nuevoX,nuevoY+j-1)
              return true
      return colision

    # Funcion que controla que el nuevo barco este dentro del tablero
    estaDentroDeTablero=(nuevoX,nuevoY,nuevaLongitud,nuevaDireccion)->
      if nuevaDireccion == 'h'
        return nuevaLongitud+nuevoX-1<=10
      else
        return nuevaLongitud+nuevoY-1<=10

  ]