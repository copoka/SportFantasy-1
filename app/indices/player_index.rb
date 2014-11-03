###
# Это - черновик. Надо переписать БД, чтобы все это выглядело не так стремно.
# Копаю Sphinx в любом случае.
# И надо гемфайлы прописать.
###

<<<<<<< Updated upstream
#ThinkingSphinx::Index.define :player, :with => :active_record do
#  # fields
#  indexes player.name, :as player,:sortable => true
#  indexes player.amplua, :as player, :sortable => true
#  indexes player.team, :as player, :sortable => true
#  indexes player.leagueID, :as player, :sortable => true
#
#  # attributes
#  has player.id, player.price
#end
=======
ThinkingSphinx::Index.define :player, :with => :active_record do
  # fields
  indexes player.name
  indexes player.amplua
  indexes player.team
  indexes player.leagueID

  # attributes
  has player.id, player.price
end
>>>>>>> Stashed changes
