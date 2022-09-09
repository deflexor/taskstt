class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :approvements, dependent: :destroy
  has_many :tasks, through: :approvements

  def approved?(task)
    puts "!!!! #{self.tasks.include?(task)}"
    self.tasks.include?(task)
  end

  private :approvements, :approvements=, :tasks, :tasks=
end
