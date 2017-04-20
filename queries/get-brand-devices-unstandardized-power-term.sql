select sony_devices.device_id, power_commands.unstandardized_name
from 
		(select manufactures.device_id
		from manufactures
		join brands 
		on manufactures.brand_id=brands.brand_id
		where brands.brand_name="Sony") sony_devices
join
		(select * 
		from commands_map
		where commands_map.standard_name="POWER") power_commands
on sony_devices.device_id=power_commands.device_id;
