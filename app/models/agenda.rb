class Agenda < ActiveRecord::Base
  has_many :users

  has_many :invoices

  validates :name,
            uniqueness: true
end
