ThinkingSphinx::Index.define :real_team, :with => :active_record do
    
    indexes :name, :as => :real_team_name
end