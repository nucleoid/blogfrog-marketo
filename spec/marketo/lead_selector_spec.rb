require 'spec_helper'

module Rapleaf
  module Marketo
    module LeadSelector
      describe StaticListSelector do
        let(:list_name) { 'some list' }
        let(:list_id) { 423 }

        it 'should store list identifier on construction' do
          list_selector = StaticListSelector.new(list_name)
          list_selector.list_identifier.should eq list_name
        end

        it "should to_hash with a string correctly" do
          list_selector = StaticListSelector.new(list_name)

          list_selector.to_hash.should eq({ :static_list_name => list_name })
        end

        it "should to_hash with an integer correctly" do
          list_selector = StaticListSelector.new(list_id)

          list_selector.to_hash.should eq({ :static_list_id => list_id })
        end
      end

      describe LastUpdateAtSelector do
        #TODO add class
      end

      describe LeadKeySelector do
        #TODO add class
      end
    end
  end
end
