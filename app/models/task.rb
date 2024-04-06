class Task < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :creation_date , presence: true
    belongs_to :user
    before_create do
        puts "New Task Is created and inserted Into the List "
    end
end
