class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: ['F', 'M'] }


  has_many :requests,
    dependent: :destroy,
    class_name: :CatRentalRequest

end
