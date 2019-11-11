/*
This is purely an example. You can alter it as you see fit or even remove this file and the line in the "init.sqf" which calls this "[] execVM "briefing.sqf";" and use the Create Diary Record modules in he editor.
*/


player createDiaryRecord 
["Diary",
	["COMMAND/SIG",  //Example provided below
		"
			<br/>Long Range Comms:
			<br/>Ground Command Net AN/PRC-152: Channel 1
			<br/>Air Command Net AN/PRC - 148: Channel 2
			<br/>Inter Aircraft Net AN/PRC 117F: Channel 3
			<br/><br/>AN/PRC-343 Radio Channels:
			<br/>Raider 1-1: Channel 1
			<br/>Raider 1-2: Channel 2
			<br/>Raider 1-3: Channel 3
			<br/>Raider 1-4: Channel 4
		"
	]
];

player createDiaryRecord 
["Diary",
	["ADMIN/LOG",  //Example provided below
		"
			<br/>Gear:
			<br/>Civilian Takistani Attire.
			<br/><br/>Medical:
			<br/>A Medic is assigned to each Team. Each person is carrying splints and basic medical stores. If casualty is T1/Immediate then Squad Medic can assist expediting the process of getting them combat effective.
			<br/><br/>Resupply:
			<br/>Resupply is available at the <marker name='Safe_House'>Agency Safe House</marker>.

		"
	]
];

player createDiaryRecord 
["Diary",
	["EXECUTION",  //Example provided below
		"
			<br/>Phase 1: Raider Fireteams will await contact from the Agency Asset at Reshmaan North Airport then travel via public transportation to the <marker name='Safe_House'>Agency Safe House</marker> in the village of <marker name='CIV_01'>Bahijah</marker>. 
			<br/><br/>Phase 2: Upon arrival at the <marker name='Safe_House'>Agency Safe House</marker>, Raider Fireteams will resupply with weapons and ammunition and then travel clandestinely to the village of <marker name='CIV_02'>Kifah</marker>. 
			<br/><br/>Phase 3: Upon arrival at <marker name='CIV_02'>Kifah</marker>, Raider Fireteams will make contact with a militia arms dealer, friendly with the Agency asset, and attempt to purchase arms from the dealer using cash in a GPS-tracked briefcase. The briefcase and 'bag man' will lead us to the source of the weapons and, ideally, the location of 'Emil'. 
			<br/><br/>Phase 4: Once the briefcase reaches its destination and Command has confirmation, Raider Fireteams will receive an update, prepare and then assault the new objective with the aim of securing 'Emil'.
			<br/><br/>Phase 5: Raider Fireteams will then extract, if captured, 'Emil' back to the Agency Safehouse and await further instructions from Command.

		"
	]
];

player createDiaryRecord 
["Diary",
	["MISSION",  //Example provided below
		"
			<br/>Make contact with a local militia arms dealer in the village of <marker name='CIV_02'>Kifah</marker> (#Fig 1) and set up a trade. 
			<br/><img image='scripts\images\Objective_01.jpg' width='400' height='200'/> (#Fig 1)
			<br/><br/>The cash will be loaded into an GPS-tracked briefcase which Command will observe to its destination.
			<br/><br/>When the final destination of the cash is confirmed Raider Fireteams will assault the objective with the aim of capturing HVT 'Emil'.

		"
	]
];

player createDiaryRecord 
["Diary",
	["SITUATION", //Example provided below
		"
			<img image='scripts\images\Loading_Screen.jpg' width='400' height='200'/>
			<br/>Task Force Raider is in the process of gathering information regarding an elaborate multi-national weapon smuggling ring with possible ties to Russia.
			<br/>A key source of intel, able to shed more light on the arms network, is the known arms dealer 'Emil'. Command has tracked 'Emil', who managed to escape Tanoa during Operation Nesting Doll, to a remote airfield in Reshmaan Province but the trail then went cold. 
			<br/>Reshmaan Province is a no-go zone for US forces. Although under military “supervision” from the Takistan Army, multiple hostile militias are vying for power in the region. Whilst not openly hostile to US forces the Takistan Army would be uncomfortable with our presence in the Province. Hence the necessity for the clandestine operation.
			<br/>It is believed that Russia has taken advantage of the volatile situation in Reshmaan in order to supply arms to the militias. It is these same weapons that have found their way into the hands of hostile terrorist forces around the globe. Including the Syndikat forces Task Force Raider has previously come into hostile engagement with.
			<br/><br/>Task Force Raider will travel undercover to Reshmaan Province, establish contact with a local Agency asset and, using the assets information network, attempt to ascertain 'Emil’s' whereabouts so he may be captured and interrogated.

		"
	]
];