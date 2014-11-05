###
# Это - черновик. Надо переписать БД, чтобы все это выглядело не так стремно.
# Копаю Sphinx в любом случае.
# И надо гемфайлы прописать.
###

ThinkingSphinx::Index.define :player, :with => :active_record do
    indexes :name, :sortable => true
    indexes amplua, :sortable => true
    
    has real_team(:name), as => :real_team_name
    has amplua(:amplua), as => :amplua
end

