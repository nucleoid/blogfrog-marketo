module Rapleaf
  module Marketo

    # Encapsulates parameters used to look up or describe a group of leads.
    class ParamsGetMultipleLeads

      # - *lead_selector* LeadSelector the lead query use
      # - *last_updated_at* DateTime Time lead was last updated or created
      # - *stream_position* String Used for paging. Value is filled in by API and must be returned on subsequent calls when paging. When present, the last_updated_at value is ignored.
      # - *batch_size* Integer Maximum number of records to be returned. System will limit to 1000 or batch_size, whichever is less.
      # - *include_attributes* [String] Used to limit the lead fields that are returned by the API
      def initialize(lead_selector, last_updated_at = nil, stream_position = nil, batch_size = nil, include_attributes = nil)
        @lead_selector = lead_selector
        @last_updated_at = last_updated_at
        @stream_position = stream_position
        @batch_size = batch_size
        @include_attributes = include_attributes
      end

      # get the lead_selector
      def lead_selector
        @lead_selector
      end

      # get the last_updated_at value
      def last_updated_at
        @last_updated_at
      end

      # get the stream_position
      def stream_position
        @stream_position
      end

      # get the batch_size
      def batch_size
        @batch_size
      end

      # get the include_attributes value
      def include_attributes
        @include_attributes
      end

      # create a hash from this instance, for sending this object to marketo using savon
      def to_hash
        hash = { :lead_selector => @lead_selector.to_hash,
                 :attributes! => { :lead_selector => { 'xsi:type' => @lead_selector.type } } }
        hash[:last_updated_at] = @last_updated_at.strftime("%Y-%m-%dT%H:%M:%S-00:00")    if @last_updated_at
        hash[:stream_position] = @stream_position if @stream_position
        hash[:batch_size] = @batch_size if @batch_size
        hash[:include_attributes] = @include_attributes if @include_attributes
        hash
      end
    end
  end
end