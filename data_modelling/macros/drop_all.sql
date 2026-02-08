{% macro drop_all() %}

    {# --- Safety guard --- #}
    {% if target.name == 'prod' %}
        {{ exceptions.raise_compiler_error("drop_all is disabled in prod") }}
    {% endif %}

    {# --- Loop over dbt models only --- #}
    {% for node in graph.nodes.values() if node.resource_type == 'model' %}

        {# Skip ephemeral models (no physical relation) #}
        {% if node.config.materialized == 'ephemeral' %}
            {% do log("Skipping ephemeral model: " ~ node.name, info=True) %}
            {% continue %}
        {% endif %}

        {# Get the actual database relation (table or view) #}
        {% set relation = adapter.get_relation(
            database=node.database,
            schema=node.schema,
            identifier=node.alias
        ) %}

        {% if relation %}
            {% do log("Dropping relation: " ~ relation, info=True) %}
            {{ adapter.drop_relation(relation) }}
        {% else %}
            {% do log("Skipping (relation does not exist): " ~ node.name, info=True) %}
        {% endif %}

    {% endfor %}

{% endmacro %}
