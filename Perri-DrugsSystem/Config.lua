Config = {} 
 
Config.ShowMessageWhileNearby = true -- SHOW MESSAGE WHILE NEARBY
 
Config.Recolectas = {

    {
        Name = 'bread', -- NAME TO SHOW
        Item = 'bread', -- ITEM TO ADD 
        Quantity = 2, -- QUANTITY TO ADD
        Coords = vector3(379.6197, -2049.6238, 21.8060),
        Time = 2000 -- TIME TO COLLECT
    }

}


Config.Procesos = {
    {
        Name = 'bread', -- NAME TO SHOW
        Item = 'bread', -- ITEM TO REMOVE
        ChangeTo = 'water', -- ITEM TO ADD
        Coords = vector3(367.3643, -2032.4114, 22.3248),
        
        Remove = 2, -- REMOVE QUANTITY
        Add = 2, -- ADD QUANTITY
        Time = 2000 -- TIME TO PROCESS
    }
} 
