# encoding: utf-8
# Este módulo se ha creado para describir
# distintas metodologías de programación
# haciendo uso del Lenguaje de Programación
# Ruby.  
# Con ella se han desarrollado los ejemplos
# de la asignatura Lenguajes y Paradigmas 
# de Programación.
#
# Author::    Coromoto Leon  (mailto:cleon@x.y)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby

module Point

  # Esta clase permite representar un punto en el espacio 
  # bidimensional.
  # Se han incluido los mixin Comparable y Enumerable.
  class Point
    include Comparable
    include Enumerable
    attr_reader :x, :y
    
    # Se asignan las coordenadas x e y 
    def initialize(x,y)
      # los comentarios locales a los métodos no generan documentación
      @x, @y = x, y
    end
    
=begin
      Comprobando si esto es un comentario que
      incluye varias líneas
      Pero no puede estar identado, debe estar en la columna 0
=end
    # Producto por un escalar
    def *(value)
      # los comentarios locales a los métodos no generan documentación
      Point.new(@x * value, @y * value)
    end
    
    # Opuesto a un punto
    # Este es un ejemplo de comentario en el que
    # se incluye esta parte.
    #--
    # NO APARECE: en los comentarios a partir de aquí
    # Es línea tampoco
    #++
    # Y esta parte del comentario también se incluye.
    def -@
      # los comentarios locales a los métodos no generan documentación
      Point.new(-@x, -@y)
    end
    
    # Suma dos puntos
    def +(other)
      # los comentarios locales a los métodos no generan documentación
      Point.new(@x + other.x, @y + other.y)
    end
    
    # Se define para incluir el mixin comparable
    # Se toma como valor para la comparación al 
    # distancia al origen.
    def <=>(other)
      # los comentarios locales a los métodos no generan documentación
      return nil unless other.instance_of? Point
      @x**2 + @y**2 <=> other.x**2 + other.y**2
    end
    
    # Tipeado pato 
    # def ==(other)
    #  if ((other.respond_to?x) && (other.respond_to?y)) then
    #    @x == other.x && @y == other.y
    #  end
    #  rescue
    #    false
    # end

    # Mas restrictivo (sin herencia - usa instance_of?)
    # def ==(other)
    #  if other.instance_of?Point
    #     @x == other.x && @y == other.y
    #  else
    #    false
    #  end
    # end

    # Restrictivo (con herencia - usa is_a?)
    # Se invalida porque el que proporciona el mix-in
    # no distingue entre (1,0) y el (0,1)
    def ==(other)
      # los comentarios locales a los métodos no generan documentación
      if other.is_a?Point
         @x == other.x && @y == other.y
      else
        false
      end
    end
    
    # Se incluye el metodo del mixin Enumerable
    # Se define como una iteración sobre las dos coordenadas
    def each #:nodoc:
      # los comentarios locales a los métodos no generan documentación
      yield @x
      yield @y
    end
  end
end

