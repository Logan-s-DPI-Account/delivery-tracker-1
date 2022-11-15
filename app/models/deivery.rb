# == Schema Information
#
# Table name: deiveries
#
#  id          :integer          not null, primary key
#  arrives     :date
#  description :string
#  details     :string
#  recieved    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Deivery < ApplicationRecord
end
