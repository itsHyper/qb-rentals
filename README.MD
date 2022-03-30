# Vehicle Rental Script for QBCore Framework

* [Overtime Development](https://discord.gg/MeBxzrGtyY)
* [QBCore Discord](discord.gg/qbcore)
* [QBCore Framework](https://github.com/qbcore-framework)


# Dependencies
* [qb-target](https://github.com/BerkieBb/qb-target)
* [qb-menu](https://github.com/qbcore-framework/qb-menu)

## Preview
https://streamable.com/1r6iqa

# Installation

* Find this in **qb-target/config**
* Put this in **"Config.TargetModels"** (more reliable to always keep target models in config) 
```lua
    ["VehicleRental"] = {
        models = {
            `a_m_y_business_03`,
        },
        options = {
            {
                type = "client",
                event = "qb-rental:openMenu",
                icon = "fas fa-car",
                label = "Rent Vehicle",
            },
        },
        distance = 4.0
    },

}
```
# Rental Papers Item - qb-core/shared.lua

```
["rentalpapers"]				 = {["name"] = "rentalpapers", 					["label"] = "Rental Papers", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "rentalpapers.png", 		["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false, 	["combinable"] = nil, 	["description"] = "Yea, this is my car i can prove it!"},
```
# Rental Papers Item Description - qb-inventory/html/js/app.js (Line 577)

```lua
        } else if (itemData.name == "stickynote") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>' + itemData.info.label + '</p>');
        } else if (itemData.name == "rentalpapers") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p><strong>Name: </strong><span>'+ itemData.info.firstname + '</span></p><p><strong>Last Name: </strong><span>'+ itemData.info.lastname+ '</span></p><p><strong>Plate: </strong><span>'+ itemData.info.plate + '<p><strong>Model: </strong><span>'+ itemData.info.model +'</span></p>');
```
# Change Logs

### 1.2
* Added Return Option 

### 1.1
* Added qb-target export / qb-menu

### 1.0
* Initial release

# Credits - elfishii

# Issues and Suggestions
Please use the GitHub issues system to report issues or make suggestions, when making suggestion, please keep [Suggestion] in the title to make it clear that it is a suggestion.
