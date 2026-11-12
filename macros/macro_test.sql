{%- macro cents_to_dollars(filed_name) -%}
    round({{filed_name}}/100.0,0)
{%- endmacro -%}