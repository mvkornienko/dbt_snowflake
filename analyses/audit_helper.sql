
{% set old_relation = adapter.get_relation(
      database = "analytics",
      schema = "dbt_mkorniienko",
      identifier = "customer_orders_legacy"
) -%}

{% set dbt_relation = ref('fct_customer_orders') %}

{{ audit_helper.compare_row_counts(
    a_relation = old_relation,
    b_relation = dbt_relation
) }}

-----------------------------------------------------------

{% set old_relation = adapter.get_relation(
      database = "analytics",
      schema = "dbt_mkorniienko",
      identifier = "customer_orders_legacy"
) -%}

{% set dbt_relation = ref('fct_customer_orders') %}

{{ audit_helper.compare_all_columns(
    a_relation = old_relation,
    b_relation = dbt_relation,
    primary_key = "order_id"
) }}

----------------------------------------------------------------

{% set old_etl_relation=ref('customer_orders_legacy') %} 

{% set dbt_relation=ref('fct_customer_orders') %}  

{{ audit_helper.compare_relations(
        a_relation=old_etl_relation,
        b_relation=dbt_relation,
        primary_key="order_id"
    ) }}


{#
{{ audit_helper.compare_relation_columns(
    a_relation=old_relation,
    b_relation=dbt_relation
) }}

#}