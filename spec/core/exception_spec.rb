require File.dirname(__FILE__) + '/../spec_helper'

# class methods
#  exception, new

# instance methods
#  backtrace, exception, inspect, message, set_backtrace, to_s,
#  to_str, to_yaml

context "Exception class method" do
  specify "new should create a new instance of Exception" do
    example do
      Exception.new
    end.should_be_kind_of Exception
  end
  
  specify "new with message should set the message of the Exception" do
    example do
      Exception.new("I'm broken.").message
    end.should == "I'm broken."
  end
  
  specify "exception should be a synonym for new" do
    example do
      Exception.exception
    end.should_be_kind_of Exception
  end
  
  specify "exception should return 'Exception' for message when no message given" do
    example do 
      Exception.exception.message
    end.should == "Exception"
  end
  
  specify "exception with message should set the message of the Exception" do
    example do
      Exception.exception("Help, I've fallen.").message
    end.should == "Help, I've fallen."
  end
end

context "Exception instance method" do
  specify "message should return the exception message" do
    example do
      [Exception.new.message, Exception.new("Ouch!").message]
    end.should == ["Exception", "Ouch!"]
  end
  
  specify "inspect should return '#<Exception: Exception>' when no message given" do
    example do
      Exception.new.inspect
    end.should == "#<Exception: Exception>"
  end
  
  specify "inspect should include message when given" do
    example do
      [Exception.new("foobar").inspect]
    end.should == ["#<Exception: foobar>"]
  end
end

context "In the Exception class hierarchy" do
  specify "Exception should exist" do
    example do
      Exception.new
    end.should_be_kind_of Exception
  end
  
  specify "NoMemoryError should subclass Exception" do
    example do
      NoMemoryError.new
    end.should_be_kind_of Exception
  end

  specify "ScriptError should subclass Exception" do
    example do
      ScriptError.new
    end.should_be_kind_of Exception
  end
  
  specify "LoadError should subclass ScriptError" do
    example do
      LoadError.new
    end.should_be_kind_of ScriptError
  end

  specify "NotImplementedError should subclass ScriptError" do
    example do
      NotImplementedError.new
    end.should_be_kind_of ScriptError
  end

  specify "SyntaxError should subclass ScriptError" do
    example do
      SyntaxError.new
    end.should_be_kind_of ScriptError
  end

  specify "SignalException should subclass Exception" do
    example do
      SignalException.new
    end.should_be_kind_of Exception
  end
  
  specify "Interrupt should subclass SignalException" do
    example do
      Interrupt.new
    end.should_be_kind_of SignalException
  end

  specify "StandardError should subclass Exception" do
    example do
      StandardError.new
    end.should_be_kind_of Exception
  end
  
  specify "ArgumentError should subclass StandardError" do
    example do
      ArgumentError.new
    end.should_be_kind_of StandardError
  end

  specify "IOError should subclass StandardError" do
    example do
      IOError.new
    end.should_be_kind_of StandardError
  end

  specify "EOFError should subclass IOError" do
    example do
      EOFError.new
    end.should_be_kind_of IOError
  end
  
  specify "IndexError should subclass StandardError" do
    example do
      IndexError.new
    end.should_be_kind_of StandardError
  end

  specify "LocalJumpError should subclass StandardError" do
    example do
      LocalJumpError.new
    end.should_be_kind_of StandardError
  end

  specify "NameError should subclass StandardError" do
    example do
      NameError.new
    end.should_be_kind_of StandardError
  end
  
  specify "NameError.new should take optional name argument" do
    example do
      NameError.new("msg","name").name
    end.should == "name"
  end
  
  specify "NoMethodError should subclass NameError" do
    example do
      NoMethodError.new
    end.should_be_kind_of NameError
  end
  
  specify "NoMethodError.new should allow passing method args" do
    example do
      NoMethodError.new("msg","name","args").args
    end.should == "args"
  end

  specify "RangeError should subclass StandardError" do
    example do
      RangeError.new
    end.should_be_kind_of StandardError
  end
  
  specify "FloatDomainError should subclass RangeError" do
    example do
      FloatDomainError.new
    end.should_be_kind_of RangeError
  end

  specify "RegexpError should subclass StandardError" do
    example do
      RegexpError.new
    end.should_be_kind_of StandardError
  end

  specify "RuntimeError should subclass StandardError" do
    example do
      RuntimeError.new
    end.should_be_kind_of StandardError
  end

  specify "SecurityError should subclass StandardError" do
    example do
      SecurityError.new
    end.should_be_kind_of StandardError
  end

  specify "SystemCallError should subclass StandardError" do
    example do
      SystemCallError.new("")
    end.should_be_kind_of StandardError
  end
  
  specify "SystemCallError.new requires at least one argumentt" do
    example do
      try(ArgumentError,"success") do
        SystemCallError.new
      end
    end.should == "success"
  end
  
  specify "SystemCallError.new should take optional errno argument" do
    example do
      SystemCallError.new("message",1)
    end.should_be_kind_of SystemCallError
  end
  
  context "SystemCallError instance methods" do
    specify "errno should return nil when no errno given" do
      example do
        SystemCallError.new("message").errno
      end.should == nil
    end  
    
    specify "errno should return the errno given as optional argument to new" do
      example do
        SystemCallError.new("message", 42).errno
      end.should == 42
    end
  end

  specify "ThreadError should subclass StandardError" do
    example do
      ThreadError.new
    end.should_be_kind_of StandardError
  end

  specify "TypeError should subclass StandardError" do
    example do
      TypeError.new
    end.should_be_kind_of StandardError
  end

  specify "ZeroDivisionError should subclass StandardError" do
    example do
      ZeroDivisionError.new
    end.should_be_kind_of StandardError
  end

  specify "SystemExit should subclass Exception" do
    example do
      SystemExit.new
    end.should_be_kind_of Exception
  end

  specify "SystemStackError should subclass Exception" do
    example do
      SystemStackError.new
    end.should_be_kind_of Exception
  end
end
