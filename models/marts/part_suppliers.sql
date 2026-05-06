with part as (

    select * from {{ ref('stg_tpch_parts') }}

),

supplier as (

    select * from {{ ref('stg_tpch_suppliers') }}

),

part_supplier as (

    select * from {{ ref('stg_tpch_parts_suppliers') }}

),

final as (
    select

        part_supplier.part_supplier_key,
        part.part_key,
        part.part_name,
        part.manufacturer,
        part.brand,
        part.part_type,
        part.part_size,
        part.container,
        part.retail_price,

        supplier.supplier_key,
        supplier.supplier_name,
        supplier.supplier_address,
        supplier.phone_number,
        supplier.account_balance,
        supplier.nation_key,

        part_supplier.available_quantity,
        part_supplier.supply_cost

    from
        part
    inner join
        part_supplier
            on part.part_key = part_supplier.part_key
    inner join
        supplier
            on part_supplier.supplier_key = supplier.supplier_key
    order by
        part.part_key
)

select * from final