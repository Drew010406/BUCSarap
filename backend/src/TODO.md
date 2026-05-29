- TODO 1: Update the get_stall endpoint to also return the products of that stall
- TODO 2: [DONE] Make a PUT/PATCH method for updating the products in a stall e.g. Remove product or mark product as Not Available
- TODO 3: [DONE] Make a POST method for creating/adding new product/s(The product feature to)
- TODO 4: Calculate how much increase/decrease gained based on prev month(if filtered by month), week(if filtered by week), day(and so on)

- TODO 5 [DONE]: May comments akong nilagay sa orders route look for functions get_queue and add_items_
    
    updates: (1) added product name in the orderline request schema, but no changes in the db commit,
            (2) created queue schemas to match the needed results
                    -queue orderline response (product name tapos quantity)
                    -queue order response (order attributes + list ng queue orderline response),

                also added the derived value ng order cost (total = unit price at order * quantity)            



- TODO 6: [DONE] Add a get_owner_stall endpoint, should return the stall_id owned by that specific owner; why cuz in stalls.py route--the get_stall() and get_owner_stall_categories() accepts a stall_id and naisip ko sana ibase nlng sa owner_id pero ampangit ata kung ganun, para stall for stall, owner for owner approach tas nde magulo

- TODO 7:  Add endpoint for delete transaction history.
- TODO 8: Add endpoint deleting, updating(rename lang ata) stall categories. Sa deleting once na idelete ang isang category damay na kung anoman laman nun.
- TODO 9: Add endpoint for adding new category.
- TODO 10: For the income history add an endpoint that retrieves the revenue from the last 10 days(?)(gagamitin to sa graph)
- TODO(later): Modify the get_user endpoint wag mag accept ng owner_id, impement OAuth(last nato wag na muna isipin saka na pag natapos na ung main feats)
