select devices.device_id
from devices
where devices.device_id NOT IN
(select device_id
from commands_map
where standard_name="POWER" );