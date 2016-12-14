Nodo = Struct.new(:value, :next, :prev){
  attr_accessor :prev
}

class Lista
  attr_reader  :head, :tail, :size

   include Enumerable
  
  def each
    i = tail
    f = @size
    k = 0
    while k < f
    yield i.value
    i = i.next
    k = k+1
    end
  end
  
  def initialize()
    @head = nil
    @tail = nil
    @size = 0
  end
  def to_s
    out = "#{@head}"
    out
  end
  def insertar(a)
    @nodo = Nodo.new(a,@head)
    
    if (@head != nil) then
      @head.next = @nodo
      @nodo.prev = @head
      @head = @nodo
      @size = @size + 1
    else
      #puts "hola"
      @head = @nodo
      @tail = @head
      @size = @size + 1
      
    end
  end
  
  def extraer
    if (head != nil)
    out = @head.value
    @head = @head.prev
    @size = @size - 1
  else 
    out = nil
      puts "Lista vacia"
    end
    out
  end
end