Config = {

    Healthcheck = true, -- Charges money when vehicle comes back with health below damage.

    Repaircost = 450, -- If enable is true sets repair cost for vehicles with health below damage amount.
    Damage = 700, -- If enable is true this sets acceptable vehicle damage level on return.

    Repair2 = true, -- If enabled you can set a secondary repair cost should be based on a higher health.
    -- Ex. based on currrent config. IF vehicle health is 700 or lower you pay a $450 repair cost, elseif vehicle health is 900 to 700 pay only $250 for repairs.
    Damage2 = 900, -- Health of secondary repair fee.
    Repaircost2 = 250, -- Repair cost for secondary damage check.

    Depositenabled = true, -- Turns on a deposit allowing player to make a portion of their money back for returning the vehicle.
    Deposit = 500, -- Deposit given back to player when returning the vehicle **Offers incentive to return vehicle.

    --Ped Spawning info
    PedCoords = vector3(109.9739, -1088.61, 28.302), -- Ped and Polyzone location, if not using polyzone go to client main lua and comment out top part.
    PedHeading = 345.64, -- Ped heading

    --Vehicale spawning info
    VehCoords = vector4(111.4223, -1081.24, 29.192, 340.0), -- Vehicle spawn location





    Vehicle1 = 'Panto',
    Vehicle1cost = 1500,
    Vehicle1Spawncode = 'Panto',

    Vehicle2 = 'Asea',
    Vehicle2cost = 1500,
    Vehicle2Spawncode = 'Asea',

    Vehicle3 = 'Dilettante',
    Vehicle3cost = 1500,
    Vehicle3Spawncode = 'Dilettante',
    }
