{% macro drop_all() %}

{% if target.name == 'prod' %}
    {{ exceptions.raise_compiler_error("drop_all is disabled in prod") }}
{% endif %}

{% for node in graph.nodes.values() if node.resource_type == 'model' %}

    {# Skip ephemeral models #}
    {% if node.config.materialized == 'ephemeral' %}
        {% continue %}
    {% endif %}

    {% set relation = adapter.get_relation(
        database=node.database,
        schema=node.schema,
        identifier=node.identifier
    ) %}

    {% if relation %}
        {% do log("Dropping relation: " ~ relation, info=True) %}
        {{ adapter.drop_relation(relation) }}
    {% else %}
        {% do log("Skipping (no relation): " ~ node.name, info=True) %}
    {% endif %}

{% endfor %}

{% endmacro %}
