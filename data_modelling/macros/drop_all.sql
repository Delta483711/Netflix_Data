{% macro drop_all() %}

{# Loop over all models in the project and drop them #}
{% for model in graph.nodes.values() if model.resource_type == 'model' %}
    {% if execute %}
        {% do log("Dropping model: " ~ model.name, info=True) %}
        {% set sql %}
            {% if model.materialized == 'view' %}
                drop view if exists {{ model.schema }}.{{ model.identifier }} cascade;
            {% else %}
                drop table if exists {{ model.schema }}.{{ model.identifier }} cascade;
            {% endif %}
        {% endset %}
        {{ run_query(sql) }}
    {% endif %}
{% endfor %}

{% endmacro %}
