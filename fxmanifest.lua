fx_version 'cerulean'
game 'gta5'

description 'QB-ScooterRental'
author 'Hyper'
version '1.0.0'


client_script 'client/*'
server_script 'server/*'

shared_scripts {
	'config.lua',
}

-- Scooter Model

files {
	'data/carcols.meta',
	'data/carvariations.meta',
	'data/handling.meta',
	'data/vehicles.meta',
}

data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'

lua54 'yes'