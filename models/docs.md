{% docs return_flag %}
Indicates the return status of a line item. Values are sourced directly from the TPCH `L_RETURNFLAG` field:

- `N` — Not returned. The item was fulfilled with no return requested.
- `R` — Returned. The item has been flagged for return by the customer.
- `A` — Accepted. The return has been accepted and processed.

This field is only meaningful for orders with a `status_code` of `F` (fulfilled). For open orders, this value will always be `N`.
{% enddocs %}

{% docs net_item_sales_amount %}
The final revenue amount for a line item after all adjustments have been applied.

Calculated as:
`gross_item_sales_amount + item_discount_amount + item_tax_amount`

Note that `item_discount_amount` is modelled as a negative number, so adding it effectively subtracts the discount. This allows all three components to be summed consistently in aggregations.
{% enddocs %}