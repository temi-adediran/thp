class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new

		# Role::ROLES.each do |role|
		# 	send("set_abilities_for_#{role}") if user.has_role?(role)
		# end

		# def set_abilities_for_chapter_admin
		# 	can [:read, :update], Chapter, id: Chapter.with_role(:chapter_admin, user).pluck(:id)
		# 	can :manage, User, chapter: { id: user.chapter_id }
		# end

		# def set_abilities_for_zonal_admin
		# 	can [:read, :update], Zone, id: Zone.with_role(:zonal_admin, user).pluck(:id)
		# 	can :manage, Chapter, zone: { id: user.zone_id }
		# 	can [:read, :update], User, zone: { id: user.zone_id }
		# 	# can :assign_roles, User
		# end

		# def set_abilities_for_international_admin
		# 	can :manage, Zone
		# 	can :read, User
		# 	# can :assign_roles, User
		# end
	end
end
