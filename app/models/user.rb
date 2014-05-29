class User < ActiveRecord::Base
  devise :database_authenticatable,
         :rememberable,
         :trackable

  belongs_to :agenda

  has_many :invoices,
           through: :agenda

  validates :name,
            presence: true
end
