require 'spec_helper'
require 'my_gem'

describe MyGem do
  it 'has a version number' do
    expect(MyGem::VERSION).not_to be nil
  end

  context "# almacenamiento de las coordenadas" do
    it "Se almacena correctamente la coordenada X" do
      p1 = MyGem::Point.new(1,1)
      expect(p1.x).to eq(1)
    end
    it "Se almacena correctamente la coordenada Y" do
      p1 = MyGem::Point.new(1,1)
      expect(p1.y).to eq(1)
    end
  end # context

  context "# producto por un escalar" do
    before :each do
      @p1 = MyGem::Point.new(1,1)
    end    
    
    it "la coordenada x y la coordenada y se multiplican por el valor" do
      p2 = @p1*5 
      expect(p2.x).to eq(5)
      expect(p2.y).to eq(5)
    end
    it "Si se multiplica por -1 se obtiene el opuesto" do
      p2 = @p1*-1 
      expect(p2.x).to eq(-1)
      expect(p2.y).to eq(-1)
    end
  end
  
  context "# opuesto de un punto" do
    it "la coordenada x y la coordenada y se multiplican por menos uno" do
      p1 = MyGem::Point.new(1,1)
      p2 = - p1 
      expect(p2.x).to eq(-1)
      expect(p2.y).to eq(-1)
    end
  end
  
  context "# suma de dos puntos " do
    it "coordenada x = original.x + otro.x, coordenada y = original.y + otro.y " do
      p1 = MyGem::Point.new(1,1) 
      p2 = p1 + p1
      expect(p2.x).to eq(2)
      expect(p2.y).to eq(2)
    end
  end
  
  context "# comparaciones entre dos puntos basada en su distancia al origen" do
    before :each do
       @p1 = MyGem::Point.new(1,1)
       @p2 = MyGem::Point.new(2,2)
       @p3 = MyGem::Point.new(1,0)
       @p4 = MyGem::Point.new(0,1)
       @pm = MyGem::Point.new(false,nil)
    end
    it "El punto (1,1) es menor que el punto (2,2)" do
      expect(@p1 < @p2).to eq(true)
    end
    it "El punto (1,1) es menor o igual que el punto (2,2)" do
      expect(@p1 <= @p2).to eq(true)
    end
    it "El punto (2,2) es mayor que el punto (1,1)" do
      expect(@p2 > @p1).to eq(true)
    end
    it "El punto (2,2) es mayor o igual que el punto (1,1)" do
      expect(@p2 >= @p1).to eq(true)
    end

    it "El punto (1,1) es igual al punto (1,1)" do
      expect(@p1 == @p1).to eq(true)
    end

    it "El punto (1,0) y el punto (0,1) son distintos" do
      expect(@p3 == @p4).to eq(false)
    end

    it "El punto (1,1) es distinto del Rectangulo (1,1)" do
      Rectangle = Struct.new(:x, :y)
      r = Rectangle.new(1,1)
      expect(@p1 == r).to eq(false)
    end
    
  end # context

 context "# haciendo el punto enumerable" do
    before :each do
       @p1 = MyGem::Point.new(1,1)
       @p2 = MyGem::Point.new(2,2)
       @p3 = MyGem::Point.new(1,0)
       @p4 = MyGem::Point.new(0,1)
       @pm = MyGem::Point.new(false,nil)
    end
    it "comprobrando el metodo all? con un bloque vacio" do
      expect(@p1.all?).to eq(true)
      expect(@pm.all?).to eq(false)
    end 
    it "comprobrando el metodo any?" do
      expect(@p1.any?).to eq(true)
      expect(@pm.any?).to eq(false)
    end 
    it "comprobrando el metodo collect" do
      expect(@p2.map{|i| i*i}).to eq([4,4])
      expect(@p2.collect{|i| i*i}).to eq([4,4])
    end 
    it "comprobrando el metodo count" do
      expect(@p2.count).to eq(2)
    end
    it "comprobrando el metodo detect" do
      expect(@p3.detect {|i| i == 0}).to eq(0)
      expect(@p3.find {|i| i == 1}).to eq(1)
    end
    it "comprobrando drop" do
      expect(@p4.drop(1)).to eq([1])
    end
    it "comprobrando max" do
      expect(@p4.max).to eq(1)
    end
    it "comprobrando min" do
      expect(@p4.min).to eq(0)
    end
    it "comprobrando sort" do
      expect(@p3.sort).to eq([0,1])
    end
  end
end
