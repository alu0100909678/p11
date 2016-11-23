class Menu

  attr_reader :titulo, :menu, :calorias

  include Comparable
  
 def <=>(other) 
      
    @calorias <=> other.calorias
      
  end
  
       #METODO INITIALIZE.
  def initialize(ti, me, calo)
    @titulo = ti
    @menu = me
    @calorias = calo
  end
  def to_s
    out = "#{@titulo[0]} (#{(@titulo[1])})\n"
    i=0
    @menu.each do
    out << '-'
    out << "#{@menu[i]}\n"
    i+=1
    end

    j=0
    @calorias.each do
      out << "#{@calorias[j]}"
      if j >=2
        out << "-"
      end
      j+=1
    end
    out
  end

  #METODO PARA OBTENER TITULO.
  def tittle
    "#{@titulo[0]}"
  end
  #METODO PARA OBTENER LA INGESTA DIARIA.
  def diary_intake
    "#{@titulo[1]}"
  end
 #METODO PARA OBTENER UN PLATO EN CONCRETO.
  def uniq_plate(pos)
    "#{@menu[pos]}"
  end
  #METODO PARA MOSTRAR TODOS LOS PLATOS.
  def all_plate
    k=0
    men =""
    @menu.each do
      men << "#{@menu[k]} - "
      k+=1
    end
    men
  end
  #METODO PARA OBTENER VCT.
  def get_VCT
   "#{@calorias[0]}"
  end
  #METODO PARA OBTENER PROTEINAS
  def get_protein
    "#{@calorias[1]}"
  end
  #METODO PARA OBTENER GRASAS
  def get_graease
    "#{@calorias[2]}"
  end
  #METODO PARA OBTENER HIDRATOS
  def get_hydrates
    "#{@calorias[3]}"
  end
end

class Grupo < Menu
  def initialize(ti, me, cal, grp)
    super(ti, me, cal)
    @group = grp
  end
  def to_s
    out = super
    out << " "
    out << "#{@group}"
    out
  end
end

class Edad < Menu
  def initialize(ti, me, cal, ag)
    super(ti, me, cal)
    @age = ag
  end
  def to_s
    out = super
    out  << " "
    out << "Edad"
    out << "#{@age[0]}"
    out << " a"
    out << " #{@age[1]}"
    out
  end
  
end
