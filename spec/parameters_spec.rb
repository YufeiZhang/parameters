require 'parameters/parameters'

require 'spec_helper'

require 'classes/module_parameters'
require 'classes/test_parameters'
require 'classes/custom_parameters'
require 'classes/inherited_parameters'
require 'classes/other_parameters'

describe Parameters do
  context "in a Module" do
    it "should provide parameters" do
      ModuleParameters.should have_param(:mixin_var)
    end

    it "should re-extend ClassMethods when including the module" do
      new_class = Class.new do
        include ModuleParameters
      end

      new_class.should have_param(:mixin_var)
    end
  end

  context "in a Class" do
    it "should provide parameters" do
      TestParameters.params.should_not be_empty
    end

    it "should have default values for parameters" do
      TestParameters.param_value(:var_with_default).should == 'thing'
    end

    it "should provide class methods for paremters" do
      TestParameters.var = 1
      TestParameters.var.should == 1
    end

    it "should inherite the super-classes parameters" do
      InheritedParameters.has_param?(:var).should == true
      InheritedParameters.has_param?(:child_var).should == true
    end

    it "should provide direct access to the parameter objects" do
      param = TestParameters.get_param(:var)

      param.should_not be_nil
      param.name.should == :var
    end

    it "should raise a ParamNotFound exception when directly accessing non-existent parameter objects" do
      lambda { TestParameters.get_param(:unknown) }.should raise_error(Parameters::ParamNotFound)
    end

    it "should provide descriptions for parameters" do
      TestParameters.describe_param(:var).should_not be_empty
    end

    it "should be able to initialize parameters" do
      obj = TestParameters.new

      obj.params.should_not be_empty
    end

    it "should set initialize parameters with initial nil values" do
      obj = CustomParameters.new

      obj.var_with_default.should == 10
    end

    it "should not override previous parameter values" do
      obj = CustomParameters.new(:test,5)

      obj.var.should == :test
      obj.var_with_default.should == 5
    end

    it "should not override previous 'false' values of parameters" do
      obj = CustomParameters.new(false,false)

      obj.var.should == false
      obj.var_with_default.should == false
    end

    it "should be able to create an object with initial parameter values" do
      obj = TestParameters.new(:var => 2, :var_with_default => 'stuff')

      obj.var.should == 2
      obj.var_with_default.should == 'stuff'
    end
  end

  context "in an Object" do
    before(:each) do
      @test = TestParameters.new
      @test_inherited = InheritedParameters.new
    end

    it "should provide direct access to all parameters" do
      @test.params[:var].should_not be_nil
      @test.params[:var_with_default].should_not be_nil
    end

    it "should have default values for parameters" do
      @test.param_value(:var_with_default).should == 'thing'
    end

    it "should provide instance methods for parameters" do
      @test.var = 2
      @test.var.should == 2
    end

    it "should set instance variables for paramters" do
      @test.instance_variable_get(:@var_with_default).should == 'thing'

      @test.var = 3
      @test.instance_variable_get(:@var).should == 3
    end

    it "should allow using lambdas for the default values of parameters" do
      test2 = TestParameters.new

      @test.var_with_lambda.should_not == test2.var_with_lambda
    end

    it "should contain the parameters from all ancestors" do
      @test_inherited.has_param?(:var).should == true
      @test_inherited.has_param?(:child_var).should == true
    end

    it "should provide direct access to the parameter objects" do
      @param = @test.get_param(:var)

      @param.should_not be_nil
      @param.name.should == :var
    end

    it "should raise a ParamNotFound exception when directly accessing non-existent parameter objects" do
      lambda { @test.get_param(:unknown) }.should raise_error(Parameters::ParamNotFound)
    end

    it "should allow for setting parameters en-mass" do
      @test.params = {:var => 3, :var_with_default => 7}

      @test.param_value(:var).should == 3
      @test.param_value(:var_with_default).should == 7
    end

    it "should allow for setting parameters en-mass from another object" do
      obj = TestParameters.new(:var => 5, :var_with_default => 'hello')
      @test.params = obj.params

      @test.var.should == 5
      @test.var_with_default.should == 'hello'
    end

    it "should allow for setting parameters en-mass from another class" do
      @test.params = OtherParameters.params

      @test.var.should be_nil
      @test.var_with_default.should == 'other'
    end

    it "should provide descriptions for parameters" do
      @test.describe_param(:var).should_not be_empty
    end

    it "should require that certain parameters have non nil values" do
      lambda {
        @test.instance_eval { require_params(:var_without_default) }
      }.should raise_error(Parameters::MissingParam)
    end
  end

  describe "runtime" do
    before(:each) do
      @test = TestParameters.new

      @test.parameter :new_param
      @test.parameter :new_param_with_default,
                      :default => 5
      @test.parameter :new_param_with_lambda,
                      :default => lambda { |obj| obj.new_param_with_default + 2 }
    end

    it "should allow for the addition of parameters" do
      @test.has_param?(:new_param).should == true
    end

    it "should provide direct access to all parameters" do
      @test.params[:new_param].should_not be_nil
      @test.params[:new_param_with_default].should_not be_nil
      @test.params[:new_param_with_lambda].should_not be_nil
    end

    it "should add reader methods for parameters" do
      @test.new_param.should be_nil
    end

    it "should add writer methods for parameters" do
      @test.new_param = 10
      @test.new_param.should == 10
    end

    it "should set the instance variables of parameters" do
      @test.instance_variable_get(:@new_param_with_default).should == 5

      @test.new_param_with_default = 10
      @test.instance_variable_get(:@new_param_with_default).should == 10
    end

    it "should initialize parameters with default values" do
      @test.new_param_with_default.should == 5
    end

    it "should initialize pamareters with default lambda values" do
      @test.new_param_with_lambda.should == 7
    end
  end
end
