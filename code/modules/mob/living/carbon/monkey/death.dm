/mob/living/carbon/monkey/gib()
	death(1)
	var/atom/movable/overlay/animation = null
	notransform = TRUE
	canmove = 0
	icon = null
	invisibility = 101

	animation = new(loc)
	animation.icon_state = "blank"
	animation.icon = 'icons/mob/mob.dmi'
	animation.master = src

	flick("gibbed-m", animation)
	gibs(loc, dna)

	spawn(15)
		if(animation)	qdel(animation)
		if(src)			qdel(src)

/mob/living/carbon/monkey/dust()
	dust_process()
	new /obj/effect/decal/cleanable/ash(loc)
	dead_mob_list -= src

/mob/living/carbon/monkey/death(gibbed)
	if(stat == DEAD)
		return
	
	stat = DEAD

	if(!gibbed)
		visible_message("<b>The [name]</b> lets out a faint chimper as it collapses and stops moving...")

	update_canmove()

	return ..(gibbed)
