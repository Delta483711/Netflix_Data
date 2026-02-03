
-- Macro to find duplicate values in a specified column of a model

{% macro deduplicate(model, unique_column, order_columns) %}
    with ranked as (
        select
            *,
            row_number() over (
                partition by {{ unique_column }}
                order by {{ order_columns }}
            ) as rn
        from {{ model }}
    )
    select *
    from ranked
    where rn = 1
{% endmacro %}