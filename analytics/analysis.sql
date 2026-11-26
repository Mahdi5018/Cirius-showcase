-- PostgreSQL example for the public synthetic dataset only.
-- Import synthetic-rides.csv into a local table named synthetic_rides first.
CREATE TABLE IF NOT EXISTS synthetic_rides (
  ride_id text PRIMARY KEY,
  departure_date date NOT NULL,
  origin text NOT NULL,
  destination text NOT NULL,
  offered_seats integer NOT NULL CHECK (offered_seats > 0),
  requested_seats integer NOT NULL CHECK (requested_seats >= 0),
  accepted_seats integer NOT NULL CHECK (accepted_seats BETWEEN 0 AND offered_seats AND accepted_seats <= requested_seats),
  completed_seats integer NOT NULL CHECK (completed_seats BETWEEN 0 AND accepted_seats),
  ride_status text NOT NULL CHECK (ride_status IN ('completed','cancelled')),
  seat_value_tnd numeric NOT NULL CHECK (seat_value_tnd >= 0),
  synthetic boolean NOT NULL CHECK (synthetic),
  CHECK (ride_status <> 'cancelled' OR completed_seats = 0)
);
-- In psql, after creating the table, import from analytics directory:
-- \copy synthetic_rides FROM 'synthetic-rides.csv' CSV HEADER

-- Route performance
SELECT origin, destination, count(*) AS rides,
       sum(offered_seats) AS offered, sum(completed_seats) AS completed,
       round(100.0 * sum(completed_seats) / nullif(sum(offered_seats),0),1) AS utilization_pct,
       sum(completed_seats * seat_value_tnd) AS gross_seat_value_tnd
FROM synthetic_rides GROUP BY origin,destination ORDER BY utilization_pct DESC;

-- Monthly seat funnel (scheduled departure month)
SELECT date_trunc('month',departure_date)::date AS month,
       count(*) AS rides, sum(requested_seats) AS requested,
       sum(accepted_seats) AS accepted, sum(completed_seats) AS completed,
       round(100.0 * sum(accepted_seats)/nullif(sum(requested_seats),0),1) AS acceptance_pct,
       round(100.0 * count(*) FILTER (WHERE ride_status='cancelled')/nullif(count(*),0),1) AS cancellation_pct
FROM synthetic_rides GROUP BY 1 ORDER BY 1;

-- Route-level cancellation and seat funnel
SELECT origin, destination, count(*) AS rides,
       count(*) FILTER (WHERE ride_status='cancelled') AS cancelled_rides,
       round(100.0 * count(*) FILTER (WHERE ride_status='cancelled') / nullif(count(*),0),1) AS cancellation_pct,
       sum(offered_seats) AS offered, sum(requested_seats) AS requested,
       sum(accepted_seats) AS accepted, sum(completed_seats) AS completed,
       round(100.0 * sum(accepted_seats)/nullif(sum(requested_seats),0),1) AS acceptance_pct,
       sum(completed_seats * seat_value_tnd) AS gross_value_tnd
FROM synthetic_rides GROUP BY origin,destination ORDER BY cancellation_pct DESC;

-- Within-route price bins with sample counts
SELECT origin,destination, floor(seat_value_tnd/5)*5 AS price_bin_start,
       count(*) AS rides, sum(requested_seats) AS requested, sum(accepted_seats) AS accepted,
       round(100.0 * sum(accepted_seats)/nullif(sum(requested_seats),0),1) AS acceptance_pct
FROM synthetic_rides GROUP BY 1,2,3 ORDER BY 1,2,3;

-- Value waterfall and cancellation contribution
SELECT ride_status, sum(accepted_seats) AS accepted, sum(completed_seats) AS completed,
       sum(accepted_seats*seat_value_tnd) AS accepted_value_tnd,
       sum(completed_seats*seat_value_tnd) AS completed_value_tnd,
       sum((accepted_seats-completed_seats)*seat_value_tnd) AS unrealized_value_tnd
FROM synthetic_rides GROUP BY ride_status;

-- Hypothetical gross fee sensitivity (not recognized revenue)
SELECT fee, sum(completed_seats*seat_value_tnd)*fee AS hypothetical_fee_tnd
FROM synthetic_rides CROSS JOIN (VALUES (0.05::numeric),(0.10),(0.15)) AS rates(fee)
GROUP BY fee ORDER BY fee;
