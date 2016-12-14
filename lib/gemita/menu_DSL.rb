class Menu_DSL
  attr_accessor :nombre_menu, :titulos, :ingestas, :platos, :porcentajes_

  def initialize(nombre, &bloque)
    self.nombre_menu = nombre
    self.titulos = []
    self.ingestas = []
    self.platos = []
    self.porcentajes_ = []

    if block_given?    
      if bloque.arity == 1
        yield self
      else
       instance_eval(&bloque) 
      end
    end
  end
 

  
  def to_s
    output = nombre_menu
    output << "\n#{'=' * nombre_menu.size}\n"
    output << "#{titulos} "
    output << "#{ingestas}\n"
   
    platos.each_with_index do |plato_, index|
        output << "#{index + 1}) #{plato_}\n"
    end
    
    output << "#{porcentajes_}\n\n"
    
    output
  end



  #Metodos
  #1
  def titulo(tipo)
      titulo_ = tipo
      titulos << titulo_
  end      
  
  #2
  def plato(options = {})

    plato_ =[]

    if options[:descripcion] && options[:porcion] && options[:gramos]
      plato_ << " (#{options[:descripcion]}, #{options[:porcion]}, #{options[:gramos]})"
    end
  
    platos << plato_
  end

  #3
  def ingesta(options = {})
    
    ingesta = []
    
    if options[:min] && options[:max]
      ingesta << " (#{options[:min]}%, #{options[:max]}%)"
    elsif options[:max]
      ingesta << " (#{options[:max]})%"
    elsif options[:min]
    ingesta << " (#{options[:min]})%"
    end

    ingestas << ingesta
  end
  
   #4
   def porcentajes(options = {})

  porcentaje_ = []

  if options[:proteinas]  && options[:grasas] && options[:hidratos]
    porcentaje_ << " (VCT: #{options[:vct]}kcal, Proteinas: #{options[:proteinas]}%, Grasas: #{options[:grasas]}%, Hidratos: #{options[:hidratos]}%)" 
  end

    porcentajes_ << porcentaje_
   end
  
end

