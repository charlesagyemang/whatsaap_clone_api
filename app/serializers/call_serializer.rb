class CallSerializer < ActiveModel::Serializer
  attributes :id, :caller_name, :caller_picture, :call_type_icon, :date, :number_of_calls, :time_of_call
end
