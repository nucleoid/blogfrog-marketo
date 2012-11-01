require 'spec_helper'

module Rapleaf
  module Marketo
    describe ParamsGetMultipleLeads do
      let(:list_name) { 'some list' }
      let(:list_selector) { LeadSelector::StaticListSelector.new list_name }
      let(:last_updated_at) { DateTime.new 2012, 11, 1 }
      let(:stream_position) { '50'}
      let(:batch_size) { 500 }
      let(:include_attributes) { ['email', 'phone'] }

      context 'initializing an instance' do
        subject { ParamsGetMultipleLeads.new(list_selector, last_updated_at, stream_position, batch_size, include_attributes) }

        its(:lead_selector) { should eq list_selector }
        its(:last_updated_at) { should eq last_updated_at }
        its(:stream_position) { should eq stream_position }
        its(:batch_size) { should eq batch_size }
        its(:include_attributes) { should eq include_attributes }
      end

      it "should to_hash with required parameters correctly" do
        params = ParamsGetMultipleLeads.new(list_selector)

        params.to_hash.should eq({ :lead_selector => { :static_list_name => list_name } })
      end

      it "should to_hash with all parameters correctly" do
        params = ParamsGetMultipleLeads.new(list_selector, last_updated_at, stream_position, batch_size, include_attributes)

        params.to_hash.should eq({
                                     :lead_selector => { :static_list_name => list_name },
                                     :last_updated_at => '2012-11-01T00:00:00-00:00',
                                     :stream_position => '50',
                                     :batch_size => 500,
                                     :include_attributes => ['email', 'phone']
                                 })
      end
    end
  end
end
