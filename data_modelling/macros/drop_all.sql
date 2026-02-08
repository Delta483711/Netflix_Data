{% macro drop_all() %}

{% if target.name == 'prod' %}
    {{ exceptions.raise_compiler_error("drop_all is disabled in prod") }}
{% endif %}

{% for model in graph.nodes.values() if model.resource_type == 'model' %}
    {% if execute %}
        {% do log("Dropping model: " ~ model.name, info=True) %}
        {% set sql %}
            {% if model.config.materialized == 'view' %}
                drop view if exists {{ model.schema }}.{{ model.identifier }};
            {% else %}
                drop table if exists {{ model.schema }}.{{ model.identifier }};
            {% endif %}
        {% endset %}
        {% do log(sql, info=True) %}
        {{ run_query(sql) }}
    {% endif %}
{% endfor %}

{% endmacro %}
