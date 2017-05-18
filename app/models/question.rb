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
#  competence_id :integer
#
# Indexes
#
#  index_questions_on_ability_id     (ability_id)
#  index_questions_on_competence_id  (competence_id)
#

class Question < ApplicationRecord

  MAX_MULTIPLE_CHOICE_ANSWERS = 5
  MAX_DISCURSIVE_ANSWERS = 1
  MAX_TRUE_FALSE_ANSWER = 2

  has_many :answers, dependent: :destroy, inverse_of: :question
  belongs_to :ability
  belongs_to :competence
  enum question_type: [:multiple_choice, :discursive, :true_false]
  validates :statement, presence: true

  validates :answers, length: {is: MAX_MULTIPLE_CHOICE_ANSWERS}, if: :multiple_choice?
  validates :answers, length: {is: MAX_DISCURSIVE_ANSWERS}, if: :discursive?
  validates :answers, length: {is: MAX_TRUE_FALSE_ANSWER}, if: :true_false?

  validate :has_correct_answer

  accepts_nested_attributes_for :answers, allow_destroy: true

  def has_correct_answer
    right_answers = answers.select{ |a| a.correct }.size
    if right_answers != 1
      errors.add(:answers, "there is no correct answer") if right_answers < 1
      errors.add(:answers, "there are more than one correct answer") if right_answers > 1      
    end
  end
end
