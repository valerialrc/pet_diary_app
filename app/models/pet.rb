class Pet < ApplicationRecord
  belongs_to :user
  validates :name, :birth_date, :sex, :specie, :breed, :weight, presence: true

  def age
    now = Time.zone.now.utc.to_date
    birthdate = self.birth_date
    age = now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end
end