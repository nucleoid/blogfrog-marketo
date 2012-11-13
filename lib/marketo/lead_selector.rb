module Rapleaf
  module Marketo
    module LeadSelector

      # Encapsulates a selector used to look up leads which are members of a static list.
      class StaticListSelector

        # - *list_identifier* Integer or String either the static list id or the static list name ie. 'Pending Application v2'
        def initialize(list_identifier)
          @list_identifier = list_identifier
        end

        # get the list_identifier
        def list_identifier
          @list_identifier
        end

        # get the xsi:type
        def type
          'ns1:StaticListSelector'
        end

        # create a hash from this instance, for sending this object to marketo using savon
        def to_hash
          @list_identifier.is_a?(Integer) ? { :static_list_id => @list_identifier } : { :static_list_name => @list_identifier }
        end
      end

      class LastUpdateAtSelector
        # TODO add LastUpdateAtSelector class from "Marketo Enterprise API 2 0.pdf" specification
      end

      class LeadKeySelector
        # TODO add LeadKeySelector class from "Marketo Enterprise API 2 0.pdf" specification
      end
    end
  end
end