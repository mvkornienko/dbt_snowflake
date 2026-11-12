{% snapshot snap_country_codes %}

{{
   config(
       schema='snapshots',
       unique_key='country_code',

       strategy='timestamp',
       updated_at='updated_at',
       dbt_valid_to_current="'9999-12-31T23:59:59'",
       invalidate_hard_deletes=true
   )
}}
select country_code,country_name,updated_at from {{ ref('country_codes') }}

{% endsnapshot %}