foreach()
    i.increment!
    validates  :player_id,
                presence: true,
                uniqueness: true,
                numericality: { only_integer: true }

    validates :user_id,
                presence: true,
                numericality: { only_integer: true }
end

if (i >= 15)
    fail
end
