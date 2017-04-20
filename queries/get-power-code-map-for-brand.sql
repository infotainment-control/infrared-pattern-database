
select sony_selection.device_id, raw_device_commands.pronto_hex_code from 
(select  *  from commands_map
where device_id in (select device_id from manufactures join brands  on manufactures.brand_id=brands.brand_id where brands.brand_name="Sony")
and standard_name="POWER") sony_selection join 
raw_device_commands
on sony_selection.unstandardized_name=raw_device_commands.unstandardized_name
and sony_selection.device_id=raw_device_commands.device_id;