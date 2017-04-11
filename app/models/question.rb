# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  statement     :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  question_type :integer          default("0")
#  ability_id    :integer
#
# Indexes
#
#  index_questions_on_ability_id  (ability_id)
#

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy, inverse_of: :question
  belongs_to :ability
  enum question_type: [:multiple_choice, :discursive, :true_false]
  validates :statement, :ability, presence: true

  validates :answers, length: {is: 5}, if: :multiple_choice?
  validates :answers, length: {is: 1}, if: :discursive?
  validates :answers, length: {is: 2}, if: :true_false?

  accepts_nested_attributes_for :answers
end
