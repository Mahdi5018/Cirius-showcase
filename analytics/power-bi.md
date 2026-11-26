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
Completed Rides = CALCULATE([Published Rides], Rides[ride_status] = "completed")
Cancelled Rides = CALCULATE([Published Rides], Rides[ride_status] = "cancelled")
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

Page 1 — Marketplace overview: KPI cards, monthly rides and completed seats, route utilization bar chart, offered/requested/accepted/completed seat comparison.

Page 2 — Route performance: route matrix, cancellation rate, requested versus accepted seat scatter plot, date and route slicers.

Place a permanent banner on every page: **SIMULATED DATA — NOT ACTUAL CIRIUS PERFORMANCE**. Reconcile results against the totals in the analytics README before publishing any dashboard.

## Ready-to-open project source

See [Power BI project](power-bi-project/README.md), the [extended DAX library](power-bi-measures.dax), and the [dashboard gallery](README.md#dashboard-previews). The project contains three report pages and an embedded CSV import. Desktop verification remains outstanding.
