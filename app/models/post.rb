class Post < ApplicationRecord
    validates :task, {presence: true}

    def users
        return User.where(id: self.user_id)
    end

    end
