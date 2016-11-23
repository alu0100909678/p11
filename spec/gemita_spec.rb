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
    end
  end
end
