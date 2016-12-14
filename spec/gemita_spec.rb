require "spec_helper"

require "./lib/gemita.rb"

context Lista do
   before :each do
     @n = Nodo.new(1, nil)
     @m = Nodo.new(2,@n_menu)
     @list = Lista.new()
     t=['ALMUERZO' , '(30-35%)']
     i=['Macarrones con salsa tomate y queso', 'Escalope de ternera, 1 bistec mediano', 'Espaguetis y Hamburguesa encebollada']
     p=['V.C.T | % 313,6 kcal |',' 19% ', ' 34% ', ' 47% ']
     g="Hidratos y Carnes"
    age = [12]
     @almuerzo = Menu.new(t,i,p)
     @group = Grupo.new(t,i,p,g)
     @age = Edad.new(t,i,p,age)
     @n_edad = Nodo.new(@age,nil)
     @n_menu = Nodo.new(@group,nil)
     #@n2_group  = Nodo.new(@group,@n_edad,nil)
     @n2_age = Nodo.new(@age,@n_menu,nil)
     @list2 = Lista.new()
     @num = 3
     
 end
   describe "Probando clase lista" do
     it "Se crea la lista vacia" do
       expect(@list.head).to eq(nil)
     end
 end
 describe "Probando Struct Nodo" do
   it "Se crea un Nodo" do
     expect(Nodo.new(1)).to eq(@n)
   end
 end
   describe "Probando insertar nodo" do
     it "Se introduce un nodo" do
        expect(@list.insertar(@group)).to eq(1)
        expect(@list.extraer).to eq(@n_menu.value)
     end
        #expect(@list.insertar(@age)).to eq(@n_edad)
       #expect(@list.extraer).to eq(@n_edad.value)
   end
   
   describe "Probando enumerable" do
       
     it "Maximo" do
       @list2.insertar(1)
       @list2.insertar(2)
       @list2.insertar(3)
      expect(@list2.max).to eq(3)
     end
             it "Minimo"do
       @list2.insertar(1)
       @list2.insertar(2)
       @list2.insertar(3)
       expect(@list2.min).to eq(1)
     end
     it "Ordenar"do
       @list2.insertar(1)
       @list2.insertar(2)
       @list2.insertar(3)
       expect(@list2.sort).to eq([1,2,3])
     end    
   end
end

context Menu do
  before :each do
    t=['ALMUERZO' , '(30-35%)']
    i=['Macarrones con salsa tomate y queso', 'Arroz tres delicias', 'Espaguetis, media racion con atun']
    p=['V.C.T | % 313,6 kcal |',' 19% ', ' 34% ', ' 47% ']
    g= 'Hidratos'
    @menu = Menu.new(t,i,p)
    @grp = Grupo.new(t,i,p,g)
    j=['Cena' , '(35-40%)']
    k=['Ensalada mixta', 'Berengena rellena', 'Puchero']
    l=['V.C.T | % 212,6 kcal |',' 10% ', ' 25% ', ' 50% ']
    m= 'Verduras'
    @menu2 = Menu.new(j,k,l)
    @grp2 = Grupo.new(j,k,l,m)

    r=['ALMUERZO' , '(30-35%)']
    z=['Macarrones con salsa tomate y queso', 'Arroz tres delicias', 'Espaguetis, media racion con atun']
    s=['V.C.T | % 313,6 kcal |',' 19% ', ' 34% ', ' 47% ']
    h= [10-12]
    @age = Edad.new(r,z,s,h)
    end

    describe "Tipo de objeto" do
      it "Comprobando objecto grupo" do
        expect(@grp.class).to eq(Grupo)
      end
    end
    describe "Igualdad de objetos" do
      it "Comprobando Igualdad" do
        expect(@grp.equal?@grp2).to eq(false)
      end
    end
    describe "Desigualdad de clases" do
      it "Desigualdad entre Grupo y Edad"do
        expect(@age.is_a?Grupo).to eq(false)
      end
    end

    describe "Igualdad de superclases"do
      it "igualdad con Superclase object"do
        expect(@grp.is_a?Object).to eq(true)
    end
  end
  
  describe "Comparable"do
    it "Igualdad entre menús" do
      expect(@menu < (@menu2)).to eq(false)
      expect(@menu == (@menu2)).to eq(false)
      expect(@menu > (@menu2)).to eq(true)
    end
  end
  
   context Menu_DSL do
        before :each do    
      @desayuno = Menu_DSL.new("Ejemplo 1") do
      
      titulo "Desayuno"
      ingesta :min => 30
      plato :descripcion => "Leche desnatada", :porcion => "1 vaso", :gramos => 200
      plato :descripcion => "Cacao instantáneo", :porcion => "1 c/sopera", :gramos => 10
      plato :descripcion => "Cereales de desayuno en hojuelas", :porcion => " 1 bol pequeño", :gramos => 40
      plato :descripcion => "Almendras laminadas (10 unidades)", :porcion => "2 c/soperas", :gramos => 10
      plato :descripcion => "Pan de trigo integral", :porcion => "1 rodaja", :gramos => 20
      porcentajes :vct =>288.0, :proteinas => 17, :grasas => 21, :hidratos => 62
      end
  
      @almuerzo = Menu_DSL.new("Ejemplo 2") do
      
      titulo "Almuerzo"
      ingesta :min => 30, :max => 35
      plato :descripcion => "Macarrones con salsa de tomate y queso parmesano", :porcion => "1 1/2 cucharón", :gramos => 200
      plato :descripcion => "Escalope de ternera", :porcion => "1 bistec mediano", :gramos => 100
      plato :descripcion => "Ensalada básica con zanahoria rallada", :porcion => "guarnición", :gramos => 120
      plato :descripcion => "Mandarina", :porcion => "1 grande", :gramos => 180
      plato :descripcion => "Pan de trigo integral", :porcion => "1 rodaja", :gramos => 20
      porcentajes :vct => 785.9, :proteinas => 19, :grasas => 34, :hidratos => 47
      end
    
    @cena = Menu_DSL.new("Ejemplo 3") do
      
      titulo "Cena"
      ingesta :min => 25, :max => 30
      plato :descripcion => "Crema de bubango", :porcion => "2 cucharones", :gramos => 200
      plato :descripcion => "Tortilla campesina con espinacas", :porcion => "1 cuña grande", :gramos => 150
      plato :descripcion => "Tomate en dados con atún", :porcion => "5 a 6 c/soperas", :gramos => 150
      plato :descripcion => "Piña natural o en su jugo picada", :porcion => "5 c/soperas", :gramos => 120
      plato :descripcion => "Pan de trigo integral", :porcion => "1 rodaja", :gramos => 20
      porcentajes :vct => 561.6, :proteinas => 19, :grasas => 40, :hidratos => 41
      end
      
      @lunes = Lista.new()
      @nodo_l = Nodo.new(@desayuno,nil,nil)
      @lunes.insertar(@nodo_l)
      #expect(@list.insertar(@group)).to eq(1)
    end
    
      it "se crea desayuno" do
       expect(@desayuno).not_to be_nil
    end
  
    it "se crea almuerzo" do
       expect(@almuerzo).not_to be_nil
    end
  
    it "se crea la cena" do
      expect(@cena).not_to be_nil
    end    
    
     it "se muestra desayuno" do
        expect(@desayuno.to_s).to eq("Ejemplo 1\n=========\n[\"Desayuno\"] [[\" (30)%\"]]\n1) [\" (Leche desnatada, 1 vaso, 200)\"]\n2) [\" (Cacao instantáneo, 1 c/sopera, 10)\"]\n3) [\" (Cereales de desayuno en hojuelas,  1 bol pequeño, 40)\"]\n4) [\" (Almendras laminadas (10 unidades), 2 c/soperas, 10)\"]\n5) [\" (Pan de trigo integral, 1 rodaja, 20)\"]\n[[\" (VCT: 288.0kcal, Proteinas: 17%, Grasas: 21%, Hidratos: 62%)\"]]\n\n") 
    end
    
    it "se muestra almuerzo" do
        expect(@almuerzo.to_s).to eq("Ejemplo 2\n=========\n[\"Almuerzo\"] [[\" (30%, 35%)\"]]\n1) [\" (Macarrones con salsa de tomate y queso parmesano, 1 1/2 cucharón, 200)\"]\n2) [\" (Escalope de ternera, 1 bistec mediano, 100)\"]\n3) [\" (Ensalada básica con zanahoria rallada, guarnición, 120)\"]\n4) [\" (Mandarina, 1 grande, 180)\"]\n5) [\" (Pan de trigo integral, 1 rodaja, 20)\"]\n[[\" (VCT: 785.9kcal, Proteinas: 19%, Grasas: 34%, Hidratos: 47%)\"]]\n\n")
    end
    
     it "se muestra cena" do
        expect(@cena.to_s).to eq("Ejemplo 3\n=========\n[\"Cena\"] [[\" (25%, 30%)\"]]\n1) [\" (Crema de bubango, 2 cucharones, 200)\"]\n2) [\" (Tortilla campesina con espinacas, 1 cuña grande, 150)\"]\n3) [\" (Tomate en dados con atún, 5 a 6 c/soperas, 150)\"]\n4) [\" (Piña natural o en su jugo picada, 5 c/soperas, 120)\"]\n5) [\" (Pan de trigo integral, 1 rodaja, 20)\"]\n[[\" (VCT: 561.6kcal, Proteinas: 19%, Grasas: 40%, Hidratos: 41%)\"]]\n\n")  
    end
  end
end


