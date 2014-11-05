###
# Это - черновик. Надо переписать БД, чтобы все это выглядело не так стремно.
# Копаю Sphinx в любом случае.
# И надо гемфайлы прописать.
###

ThinkingSphinx::Index.define :player, :with => :active_record do
    indexes :name
    indexes price, :sortable => true
end

