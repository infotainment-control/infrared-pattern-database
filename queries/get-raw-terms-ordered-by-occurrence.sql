select  raw_device_commands.unstandardized_name, count(unstandardized_name) from raw_device_commands
group by unstandardized_name
order by count(unstandardized_name) desc;