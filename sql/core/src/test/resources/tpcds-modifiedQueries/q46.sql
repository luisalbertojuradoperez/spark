-- start query 46 in stream 0 using template query46.tpl
select
  c_last_name,
  c_first_name,
  ca_city,
  bought_city,
  ss_ticket_number,
  amt,
  profit
from
  (select
    ss_ticket_number,
    ss_customer_sk,
    ca_city bought_city,
    sum(ss_coupon_amt) amt,
    sum(ss_net_profit) profit
  from
    store_sales,
    date_dim,
    store,
    household_demographics,
    customer_address
  where
    store_sales.ss_sold_date_sk = date_dim.d_date_sk
    and store_sales.ss_store_sk = store.s_store_sk
    and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
    and store_sales.ss_addr_sk = customer_address.ca_address_sk
    and (household_demographics.hd_dep_count = 5
      or household_demographics.hd_vehicle_count = 3)
    and date_dim.d_dow in (6, 0)
    and date_dim.d_year in (1999, 1999 + 1, 1999 + 2)
    and store.s_city in ('Midway', 'Concord', 'Spring Hill', 'Brownsville', 'Greenville')
    -- partition key filter
    and ss_sold_date_sk in (2451181, 2451182, 2451188, 2451189, 2451195, 2451196, 2451202, 2451203, 2451209, 2451210, 2451216, 2451217, 
                            2451223, 2451224, 2451230, 2451231, 2451237, 2451238, 2451244, 2451245, 2451251, 2451252, 2451258, 2451259, 
                            2451265, 2451266, 2451272, 2451273, 2451279, 2451280, 2451286, 2451287, 2451293, 2451294, 2451300, 2451301, 
                            2451307, 2451308, 2451314, 2451315, 2451321, 2451322, 2451328, 2451329, 2451335, 2451336, 2451342, 2451343, 
                            2451349, 2451350, 2451356, 2451357, 2451363, 2451364, 2451370, 2451371, 2451377, 2451378, 2451384, 2451385, 
                            2451391, 2451392, 2451398, 2451399, 2451405, 2451406, 2451412, 2451413, 2451419, 2451420, 2451426, 2451427, 
                            2451433, 2451434, 2451440, 2451441, 2451447, 2451448, 2451454, 2451455, 2451461, 2451462, 2451468, 2451469, 
                            2451475, 2451476, 2451482, 2451483, 2451489, 2451490, 2451496, 2451497, 2451503, 2451504, 2451510, 2451511, 
                            2451517, 2451518, 2451524, 2451525, 2451531, 2451532, 2451538, 2451539, 2451545, 2451546, 2451552, 2451553, 
                            2451559, 2451560, 2451566, 2451567, 2451573, 2451574, 2451580, 2451581, 2451587, 2451588, 2451594, 2451595, 
                            2451601, 2451602, 2451608, 2451609, 2451615, 2451616, 2451622, 2451623, 2451629, 2451630, 2451636, 2451637, 
                            2451643, 2451644, 2451650, 2451651, 2451657, 2451658, 2451664, 2451665, 2451671, 2451672, 2451678, 2451679, 
                            2451685, 2451686, 2451692, 2451693, 2451699, 2451700, 2451706, 2451707, 2451713, 2451714, 2451720, 2451721, 
                            2451727, 2451728, 2451734, 2451735, 2451741, 2451742, 2451748, 2451749, 2451755, 2451756, 2451762, 2451763, 
                            2451769, 2451770, 2451776, 2451777, 2451783, 2451784, 2451790, 2451791, 2451797, 2451798, 2451804, 2451805, 
                            2451811, 2451812, 2451818, 2451819, 2451825, 2451826, 2451832, 2451833, 2451839, 2451840, 2451846, 2451847, 
                            2451853, 2451854, 2451860, 2451861, 2451867, 2451868, 2451874, 2451875, 2451881, 2451882, 2451888, 2451889, 
                            2451895, 2451896, 2451902, 2451903, 2451909, 2451910, 2451916, 2451917, 2451923, 2451924, 2451930, 2451931, 
                            2451937, 2451938, 2451944, 2451945, 2451951, 2451952, 2451958, 2451959, 2451965, 2451966, 2451972, 2451973, 
                            2451979, 2451980, 2451986, 2451987, 2451993, 2451994, 2452000, 2452001, 2452007, 2452008, 2452014, 2452015, 
                            2452021, 2452022, 2452028, 2452029, 2452035, 2452036, 2452042, 2452043, 2452049, 2452050, 2452056, 2452057, 
                            2452063, 2452064, 2452070, 2452071, 2452077, 2452078, 2452084, 2452085, 2452091, 2452092, 2452098, 2452099, 
                            2452105, 2452106, 2452112, 2452113, 2452119, 2452120, 2452126, 2452127, 2452133, 2452134, 2452140, 2452141, 
                            2452147, 2452148, 2452154, 2452155, 2452161, 2452162, 2452168, 2452169, 2452175, 2452176, 2452182, 2452183, 
                            2452189, 2452190, 2452196, 2452197, 2452203, 2452204, 2452210, 2452211, 2452217, 2452218, 2452224, 2452225, 
                            2452231, 2452232, 2452238, 2452239, 2452245, 2452246, 2452252, 2452253, 2452259, 2452260, 2452266, 2452267, 
                            2452273, 2452274)
  group by
    ss_ticket_number,
    ss_customer_sk,
    ss_addr_sk,
    ca_city
  ) dn,
  customer,
  customer_address current_addr
where
  ss_customer_sk = c_customer_sk
  and customer.c_current_addr_sk = current_addr.ca_address_sk
  and current_addr.ca_city <> bought_city
order by
  c_last_name,
  c_first_name,
  ca_city,
  bought_city,
  ss_ticket_number
limit 100
-- end query 46 in stream 0 using template query46.tpl
