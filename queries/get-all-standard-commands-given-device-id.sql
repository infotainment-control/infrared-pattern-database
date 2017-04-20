select raw_device_commands.device_id, commands_map.standard_name, raw_device_commands.pronto_hex_code
from
	raw_device_commands
	join
	commands_map
	on
		raw_device_commands.device_id=commands_map.device_id
		and
		raw_device_commands.unstandardized_name=commands_map.unstandardized_name
	where raw_device_commands.device_id=635;