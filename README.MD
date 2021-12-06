#This needs to be added in qb-core/shared.lua on the items

["rentalpapers"]  = {["name"] = "rentalpapers", ["label"] = "Papeles de renta", ["weight"] = 0, ["type"] = "item", ["image"] = "stickynote.png", ["unique"] = true, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = "Yea, this is my car i can proove it!"},

#Next we are gonna add something to our inventory


We are gonna go to our qb-inventory/html/js/app.js we have to find something like this

} else if (itemData.name == "stickynote") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>' + itemData.info.label + '</p>');

at the bottom of it add this

} else if (itemData.name == "rentalpapers") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p><strong>Nombre: </strong><span>'+ itemData.info.firstname + '</span></p><p><strong>Apellido: </strong><span>'+ itemData.info.lastname+ '</span></p><p><strong>Placa: </strong><span>'+ itemData.info.plate + '<p><strong>Modelo: </strong><span>'+ itemData.info.model +'</span></p>');

it should look like this

 } else if (itemData.name == "stickynote") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>' + itemData.info.label + '</p>');
        } else if (itemData.name == "rentalpapers") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p><strong>Nombre: </strong><span>'+ itemData.info.firstname + '</span></p><p><strong>Apellido: </strong><span>'+ itemData.info.lastname+ '</span></p><p><strong>Placa: </strong><span>'+ itemData.info.plate + '<p><strong>Modelo: </strong><span>'+ itemData.info.model +'</span></p>');


There are some things in spanish here just change them

Nombre = name
Apellido = last name
Placa =  Plate
Modelo = Model