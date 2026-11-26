# Marketplace performance | Analytical findings

## Executive summary

Across 360 rides scheduled from January to March 2026, 1,111 seats were requested and 1,101 offered. Of these requests, 499 reached acceptance and 407 completion. The largest loss occurs before acceptance: 612 seats, or 86.9% of the 704 unfulfilled requested seats. Overall conversion is 36.6%; utilization is 37.0%.

## Route performance

| Route | Rides | Cancelled | Cancellation | Offered | Requested | Accepted | Completed | Acceptance | Utilization | Gross value (TND) |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Tunis → Bizerte | 63 | 11 | 17.5% | 200 | 204 | 103 | 85 | 50.5% | 42.5% | 848 |
| Sousse → Monastir | 65 | 5 | 7.7% | 197 | 213 | 96 | 81 | 45.1% | 41.1% | 551 |
| Sfax → Gabes | 63 | 8 | 12.7% | 186 | 187 | 80 | 65 | 42.8% | 34.9% | 775 |
| Tunis → Sousse | 61 | 8 | 13.1% | 185 | 204 | 88 | 69 | 43.1% | 37.3% | 999 |
| Tunis → Sfax | 57 | 10 | 17.5% | 174 | 152 | 68 | 60 | 44.7% | 34.5% | 1,369 |
| Sousse → Sfax | 51 | 9 | 17.6% | 159 | 151 | 64 | 47 | 42.4% | 29.6% | 558 |

Aggregate demand is 100.9% of supply; four routes show more requested than offered seats. This does not establish availability at a specific departure time or pickup point. Tunis → Bizerte has the highest utilization (42.5%); Sousse → Sfax has the lowest (29.6%) and highest cancellation rate (17.6%, 9/51). Tunis → Sfax has the highest gross completed value (1,369 TND). Sousse → Monastir has the lowest cancellation rate (7.7%, 5/65).

Of 92 accepted seats not completed, 62 are attached to cancelled rides and 30 to rides marked completed. The latter cannot be attributed to a specific reason from ride-level data.

## Pricing analysis

Price bins are lower-inclusive and upper-exclusive (e.g. 5 = [5,10) TND). Acceptance is the ratio of accepted to requested seats, not the average of individual ride rates.

| Price bin start (TND) | Rides | Requested | Accepted | Acceptance |
|---:|---:|---:|---:|---:|
| 5 | 89 | 288 | 144 | 50.0% |
| 10 | 180 | 564 | 243 | 43.1% |
| 15 | 34 | 107 | 44 | 41.1% |
| 20 | 51 | 138 | 61 | 44.2% |
| 25 | 6 | 14 | 7 | 50.0% |

| Route | Price bin start (TND) | Rides | Requested | Accepted | Acceptance |
|---|---:|---:|---:|---:|---:|
| Sfax → Gabes | 10 | 63 | 187 | 80 | 42.8% |
| Sousse → Monastir | 5 | 65 | 213 | 96 | 45.1% |
| Sousse → Sfax | 10 | 51 | 151 | 64 | 42.4% |
| Tunis → Bizerte | 10 | 39 | 129 | 55 | 42.6% |
| Tunis → Bizerte | 5 | 24 | 75 | 48 | 64.0% |
| Tunis → Sfax | 20 | 51 | 138 | 61 | 44.2% |
| Tunis → Sfax | 25 | 6 | 14 | 7 | 50.0% |
| Tunis → Sousse | 10 | 27 | 97 | 44 | 45.4% |
| Tunis → Sousse | 15 | 34 | 107 | 44 | 41.1% |

Tunis → Bizerte falls by 21.4 percentage points in the higher bin; Tunis → Sousse falls by 4.3 points. Tunis → Sfax increases by 5.8 points, but the upper bin contains only 14 requested seats from six rides. Three routes offer no within-route bin comparison. Pricing alone cannot explain acceptance; schedules, capacity, pickup arrangements and driver decisions remain hypotheses. No causal price elasticity is estimated.

## Commercial value and fee scenarios

Gross completed seat value = SUM(completed seats × seat value per ride) = 5,100 TND. Accepted seat value is 6,234 TND; the gap is 1,134 TND, including 760 TND attached to cancelled rides. This is not lost platform revenue or proof that every accepted seat could have been recovered.

| Illustrative fee | Amount on completed value (TND) |
|---:|---:|
| 5% | 255 |
| 10% | 510 |
| 15% | 765 |

These are gross fee scenarios over the observed period, not recognized revenue, monthly forecasts or profit. See the separate [financial model](../business-analysis/financial-model.md) for cost and break-even assumptions.

## Recommended priorities

| Priority | Action | Measurement |
|---|---|---|
| 1 | Instrument request acceptance, rejection reasons, negotiation time and expiry | Accepted/requested seats; time to decision |
| 2 | Diagnose high-cancellation routes and test departure reminders | Cancelled/published rides; accepted-seat completion |
| 3 | Compare contribution ranges within the same route and departure window | Acceptance by price range, ride count and requested seats |
| 4 | Improve matching around high-demand departures before broad supply acquisition | Requested/offered seats; completed/offered seats |
| 5 | Evaluate fees only after validating demand, costs and commercial feasibility | Gross completed value, contribution margin, break-even |

## Method

One row per ride; departure dates span 2026-01-01 to 2026-03-31. Rates are ratios of sums, recomputed within each filter context. Seat requests are not unique passengers. Ride cancellation and seat drop-off are distinct outcomes. The analysis cannot establish customer retention, acquisition cost, payment revenue or cancellation/rejection causes. Data scope is described in the [analytics README](README.md).
