# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  statement     :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  question_type :integer          default("0")
#

class Question < ApplicationRecord
  has_many :answers
  enum question_type: [:multiple_choice, :discursive, :true_false]
  validates :statement, presence: true
end
