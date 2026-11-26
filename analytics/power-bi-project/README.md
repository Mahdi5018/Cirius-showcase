# Cirius | Power BI project

Three editable report pages: marketplace overview, route performance, pricing and value. The project contains a local import model with the source CSV embedded in the Power Query partition, avoiding machine-specific paths and external credentials.

1. Clone or download the repository; retain the project folder structure.
2. Open [Cirius.pbip](Cirius.pbip) in a current Power BI Desktop version with Power BI project and enhanced report format support enabled if required.
3. Select Refresh. Compare results with the [analytics README](../README.md). Validate the route and month slicers, funnel labels, price bin order and fee chart.
4. Save as PBIX if desired. Do not commit local .pbi caches.

All three report pages have been opened and visually checked in Power BI Desktop. See the [dashboard screenshots](../README.md#dashboard-previews).

For a later CSV revision, update the embedded Power Query Source step or replace it with the CSV import, keeping the same fields and derived columns. See [DAX measures](../power-bi-measures.dax) and [methodology](../insights.md).
