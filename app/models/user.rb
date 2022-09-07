class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :approvements, dependent: :destroy
  has_many :tasks, through: :approvements

  def approve_task(t)
    if(t.status == :in_progress)
      self.tasks << t
    end
  end

  private :approvements, :approvements=, :tasks, :tasks=
end
