class Article < ApplicationRecord

  has_many :comments

  validates :title, :body, presence:true
  validates :body, length: {minimum: 2, message: "Ya abi 2 karakterli body mi olur geççen onu."}

end
