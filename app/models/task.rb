class Task < ApplicationRecord
  validates_presence_of :title
  has_many :approvements, dependent: :destroy
  has_many :approvers, through: :approvements, source: :user
  include AASM

  aasm column: :status, timestamps: true, no_direct_assignment: true do
    state :new, initial: true
    state :in_progress, :completed, :cancelled

    event :start do
      transitions from: :new, to: :in_progress
    end

    event :cancel do
      transitions from: :in_progress, to: :cancelled
    end

    event :complete do
      transitions from: :in_progress, to: :completed
    end
  end

  def approve!(user)
    if(self.status == "in_progress")
      self.approvers << user
    end
  end
end
