{#
{%- set temp -%}100{%- endset -%}

{% if temp > 70 %}
    {{ temp }}
{% else %}    
{% endif %}

{%- for j in range(26) %}
    select {{j}} {% if not loop.last %} union all {% endif %}
{% endfor %}

#}

{% set arr=['a','b','s'] %}
{% set arr={'a':1,'b':1,'s':3} %}
{%- for j in arr  %}
     {{arr[j]}}
{% endfor %}

