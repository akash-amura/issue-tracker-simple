require 'test_helper'

class ArtifactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
    @artifact =  Artifact.new(title:"Class Diagram for page",description:"A class diagram representing all the clases in the application",version:"1.0.1",data:["www.exampleurl.com"],category: :task,ticket_id:1)
  end

end
