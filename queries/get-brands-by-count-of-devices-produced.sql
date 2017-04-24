select models_produced, brand_name from 
(select count(manufactures.device_id) as models_produced, manufactures.brand_id as bid
from manufactures
group by brand_id
order by count(device_id) desc)
join brands
where bid = brands.brand_id;