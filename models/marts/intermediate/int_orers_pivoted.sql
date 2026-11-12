with payment as(
    select * from {{ ref('stg_stripe__payment') }}
),
pivoted as (
    select order_id, 
    {% set sql %}
        select distinct payment_method from {{ ref('stg_stripe__payment') }}
    {% endset %}
    {% if execute %}
        {% set methods=run_query(sql).columns[0].values() %}
    {% else %}    
        {% set methods=[] %}
    {% endif %}
    {% for method in methods %}
        nvl(sum(case when payment_method='{{method}}' then payment_amount end ),0) as by_{{method}}{% if not loop.last %},{% endif%}
    {% endfor %}
    from payment
    group by order_id
    order by 1
)
select * from pivoted