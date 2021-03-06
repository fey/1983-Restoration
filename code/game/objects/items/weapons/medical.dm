////////////////////////
////Pill Pack Define////
////////////////////////
/obj/item/weapon/pill_pack
	name = "pill pack"
	desc = "Pills in sterile and handy pack."
	icon = 'icons/obj/medical.dmi'
	w_class = 1//Packed very effective
	icon_state = "pill_pack"
	var/pill_type = null
	var/pop_sound = 'sound/effects/pop_pill.ogg'

/obj/item/weapon/pill_pack/New()
	..()

	if(ispath(pill_type))
		for(var/i = 1 to 6)
			new pill_type(src)

	update_icon()

/obj/item/weapon/pill_pack/attack_hand(mob/user as mob)
	if(user.get_inactive_hand() == src)
		if(src.contents.len > 0)
			if(pop_sound)
				playsound(src.loc, pop_sound, 50, 1)
			var/obj/item/weapon/reagent_containers/pill/pill = contents[1]
			user << "<span class='notice'>You took one [pill.name] from [src.name]</span>"
			user.put_in_active_hand(pill)
			update_icon()
		else
			user << "<span class='warning'>It's empty!</span>"
	else
		..()

/obj/item/weapon/pill_pack/attack_self(mob/user as mob)
	if(src.contents.len > 0)
		var/obj/item/weapon/reagent_containers/pill/pill = contents[1]
		if(prob(30))
			if(pop_sound)
				playsound(src.loc, pop_sound, 50, 1)
			user << "<span class='notice'>You took one [pill.name] from [src.name]</span>"
			pill.loc = user.loc
			update_icon()
		else
			user << "<span class='warning'>You tried to take one [pill.name] from [src.name] by one hand but failed</span>"
	else
		user << "<span class='warning'>[name] is empty!</span>"

/obj/item/weapon/pill_pack/update_icon()
	icon_state = "[initial(icon_state)][contents.len]"

//////////////////
////Pill Packs////
//////////////////
/obj/item/weapon/pill_pack/antitox
	name = "antitoxin pill pack"
	desc = "Removes toxins and poisions from blood."
	pill_type = /obj/item/weapon/reagent_containers/pill/antitox

/obj/item/weapon/pill_pack/tramadol
	name = "tramadol pill pack"
	desc = "Effective painkiller."
	pill_type = /obj/item/weapon/reagent_containers/pill/tramadol

/obj/item/weapon/pill_pack/dexalin
	name = "dexalin pill pack"
	desc = "Used in cases of oxygen deprivation."
	pill_type = /obj/item/weapon/reagent_containers/pill/dexalin

/obj/item/weapon/pill_pack/bicaridine
	name = "bicaridine pill pack"
	desc = "Helps treat brute injures."
	pill_type = /obj/item/weapon/reagent_containers/pill/bicaridine

/obj/item/weapon/pill_pack/inaprovaline
	name = "inaprovaline pill pack"
	desc = "Prevents death by pain shock."
	pill_type = /obj/item/weapon/reagent_containers/pill/inaprovaline

/obj/item/weapon/pill_pack/adminordrazine
	name = "adminordrazine pill pack"
	desc = "Where did you even get that?"
	pill_type = /obj/item/weapon/reagent_containers/pill/adminordrazine

/obj/item/weapon/pill_pack/doxycycline
	name = "doxycycline pill pack"
	desc = "That's will help from the horrible death from gangrena"
	pill_type = /obj/item/weapon/reagent_containers/pill/doxycicline

/obj/item/weapon/pill_pack/cystamine
	name = "cystamine pill pack"
	desc = "That stuff will help you not die from vomit suffocation."
	pill_type = /obj/item/weapon/reagent_containers/pill/cystamine

/obj/item/weapon/pill_pack/phenazepam
	name = "phenazepam pill pack"
	desc = "Glory to psychonauts!"
	pill_type = /obj/item/weapon/reagent_containers/pill/phenazepam

/obj/item/weapon/pill_pack/sydnocarbum
	name = "sydnocarbum pill pack"
	desc = "For special occasions when shit got real."
	pill_type = /obj/item/weapon/reagent_containers/pill/sydnocarbum

/obj/item/weapon/pill_pack/amidopyrinum
	name = "amidopyrinum pill pack"
	desc = "Will help you not bit off your own tongue when you get a pain shock."
	pill_type = /obj/item/weapon/reagent_containers/pill/amidopyrinum

/obj/item/weapon/pill_pack/paracetamol
	name = "paracetamol pill pack"
	desc = "Such a useless stuff!"
	pill_type = /obj/item/weapon/reagent_containers/pill/paracetamol

/obj/item/weapon/pill_pack/morphine
	name = "morphine pill pack"
	desc = "Like in on of the Bulgakov's novels"
	pill_type = /obj/item/weapon/reagent_containers/pill/morphine

/obj/item/weapon/pill_pack/naloxone
	name = "naloxone pill pack"
	desc = "You have no idea what's that."
	pill_type = /obj/item/weapon/reagent_containers/pill/naloxone

/obj/item/weapon/pill_pack/promethazine
	name = "promethazine pill pack"
	desc = "You have no idea what's that."
	pill_type = /obj/item/weapon/reagent_containers/pill/promethazine


//////////////////////////
////Gauze Packs Define////
//////////////////////////

/obj/item/weapon/gauze_pack
	name = "pack of nothing"
	desc = "Contains nothing."
	icon = 'icons/obj/medical.dmi'
	w_class = 1 //Packed very effective
	var/content_type = null
	var/packed = 1
	var/rip_sound = 'sound/effects/rip_pack.ogg'

/obj/item/weapon/gauze_pack/New()
	..()

	if(ispath(content_type))
		new content_type(src)

	update_icon()

/obj/item/weapon/gauze_pack/attack_hand(mob/user as mob)
	if(user.get_inactive_hand() == src && packed)
		packed = 0
		if(rip_sound)
			playsound(src.loc, rip_sound, 50, 1)
		if(contents.len)
			var/obj/O = contents[1]
			user.put_in_active_hand(O)
			user << "<span class='notice'>You ripped the [src.name] and took out an [O.name].</span>"
		else
			user << "<span class='warning'>You ripped the [src.name] but it's empty!</span>"
		update_icon()
	else
		..()

/obj/item/weapon/gauze_pack/attack_self(mob/user as mob)
	if(packed)
		if(prob(50))
			packed = 1
			if(rip_sound)
				playsound(src.loc, rip_sound, 50, 1)
			if(contents.len)
				var/obj/O = contents[1]
				O.loc = user.loc
				user << "<span class='notice'>You ripped the [src.name] by one hand and [O] falls out.</span>"
			else
				user << "<span class='warning'>You ripped the [src.name] but it's empty!</span>"
			update_icon()
		else
			user << "<span class='warning'>You tried to rip the [src.name] but failed!</span>"
	else
		user << "<span class='warning'>[name] is already unpacked!</span>"

/obj/item/weapon/gauze_pack/update_icon()
	icon_state = "[initial(icon_state)][packed]"

///////////////////
////Gauze Packs////
///////////////////

/obj/item/weapon/gauze_pack/ipp
	name = "'IPP'"
	desc = "That's the Individualniy Perevyazochniy Paket. Contains sterile gauze."
	icon_state = "bint_pack"
	content_type = /obj/item/stack/medical/bruise_pack/bint

/obj/item/stack/medical/bruise_pack/bint
	name = "roll of gauze"
	singular_name = "bint length"
	icon = 'icons/obj/medical.dmi'
	icon_state = "bint"


/obj/item/weapon/gauze_pack/gauze
	name = "pack of gauze"
	desc = "Contains sterile gauze."
	icon_state = "gauze_pack"
	content_type = /obj/item/stack/medical/bruise_pack/gauze

/obj/item/stack/medical/bruise_pack/gauze
	name = "roll of gauze"
	singular_name = "gauze length"
	icon = 'icons/obj/medical.dmi'
	icon_state = "gauze"