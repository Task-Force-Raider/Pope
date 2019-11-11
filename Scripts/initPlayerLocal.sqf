waituntil {!isnull (finddisplay 46)};

    player addEventHandler
        [
        "Fired",
    
            {                            
                _nearEnemy = nearestObjects [player,["Man"],200];
                if ((east countSide _nearEnemy) > 1) then 
                {
                    player setCaptive false;
                };
            }
                                
        ];
