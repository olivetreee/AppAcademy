#QUESTIONS
difference between let and subject


#Basic syntax
describe "name of class/module/method" do
  it "does something" do
    expect (my_method(5)).to eq(10)
  end
end

#setting up a var beforehand
describe "name_of_method" do
  before(:each) do
    var_name = "str"
  end

  it "does something with a string" do
    expect(change_str(var_name)).to eq("STR")
  end

end

#Class isntance
describe ClassName do
  subject (:some_name) { ClassName.new }

  it "does something with it" do
    expect (subject.my_var).to_not eq("test")
  end
end

#Sometimes, a class depends on another class. This would mean creating
#the subject and then let an object for the other class. But then, we'd have to
#instantiate the second class to initialize the variables.
#Instead, we stub the second class by creating a mock, or double.
#A stub is like a Struct. It's an empty class that allows you to add whatever.
let (:some_name) {double ("SomeClass")}

#We initialize the variables by using:
allow(some_name).to receive(:instance_var_or_method_output).and_return("Some value here.")


#When we expect a method to call another method, we use expect:
describe Order
  let(:customer) { double('customer') }
  let(:product) { double('product', :cost => 5.99) }
  subject(:order) { Order.new(customer, product) }

  it "expects something" do
    expect(customer).to receive(:debit_from_account).with(5.99)
    order.charge_customer
  end
end

#Unit tests isolate problems and test them separately. They use double to mock objects.
#Integration tests use real objects to test for the real integration between them. The scope is much broader.
