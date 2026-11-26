# Power BI build guide

Import synthetic-rides.csv as a table named Rides. Set departure_date to Date, all seat counts to Whole Number, seat_value_tnd to Decimal Number, synthetic to True/False. All records are fictional.

| Field | Definition |
|---|---|
| ride_id | Unique fictional ride identifier |
| departure_date | Simulated scheduled departure date |
| origin / destination | City labels |
| offered_seats | Initial advertised capacity |
| requested_seats | Total seat demand, may exceed capacity |
| accepted_seats | Accepted seat demand before final outcome |
| completed_seats | Seats completed; zero for cancelled rides |
| ride_status | Final simulated ride outcome |
| seat_value_tnd | Hypothetical contribution per completed seat |
| synthetic | Always true |

## DAX measures

```dax
Published Rides = COUNTROWS(Rides)
Completed Rides = CALCULATE([Published Rides], KEEPFILTERS(Rides[ride_status] = "completed"))
Cancelled Rides = CALCULATE([Published Rides], KEEPFILTERS(Rides[ride_status] = "cancelled"))
Offered Seats = SUM(Rides[offered_seats])
Requested Seats = SUM(Rides[requested_seats])
Accepted Seats = SUM(Rides[accepted_seats])
Completed Seats = SUM(Rides[completed_seats])
Seat Utilization = DIVIDE([Completed Seats], [Offered Seats])
Acceptance Rate = DIVIDE([Accepted Seats], [Requested Seats])
Seat Completion Rate = DIVIDE([Completed Seats], [Accepted Seats])
Ride Cancellation Rate = DIVIDE([Cancelled Rides], [Published Rides])
Gross Seat Value TND = SUMX(Rides, Rides[completed_seats] * Rides[seat_value_tnd])
```

Create each measure individually. Format rates as percentages. Create a route calculated column using origin & " → " & destination. A calendar table may be related to departure_date for month filters.

## Report layout

Page 1 — Marketplace overview: six KPI cards, daily published rides, passenger booking conversion funnel and monthly published versus completed ride volume.

Page 2 — Route performance: offered/requested/accepted/completed seat comparison, cancellation rate and seat utilization by route.

Page 3 — Pricing and value: three value KPI cards, acceptance by 5 TND price bin, gross completed value by route, illustrative fee sensitivity and route-price evidence table.

Each page contains route and month slicers. Reconcile results against the totals in the analytics README before publishing updated dashboards; retain the existing data disclosure when sharing report extracts.

## Ready-to-open project source

See [Power BI project](power-bi-project/README.md), the [extended DAX library](power-bi-measures.dax), and the [dashboard gallery](README.md#power-bi-dashboard-screenshots). The project contains three report pages and an embedded CSV import. All three report pages have been opened and visually checked in Power BI Desktop.
