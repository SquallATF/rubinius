require 'mspec/mocks/proxy'

class Object
  def mock_to_path(path)
    obj = MockObject.new('path')
    obj.should_receive(:to_path).and_return(path)
    obj
  end
end
