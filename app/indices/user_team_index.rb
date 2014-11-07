ThinkingSphinx::Index.define :user_team, :with => :active_record do
    indexes :name, as => :user_team_name
end