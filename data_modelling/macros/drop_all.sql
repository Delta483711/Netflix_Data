{% macro drop_all(schema_name) %}

{% if execute %}
    {% set sql %}
        DO $$
        DECLARE
            r RECORD;
        BEGIN
            -- Drop all tables
            FOR r IN 
                SELECT tablename AS name, 'table' AS type
                FROM pg_tables
                WHERE schemaname = '{{ schema_name }}'
            LOOP
                EXECUTE 'DROP TABLE IF EXISTS {{ schema_name }}.' || quote_ident(r.name) || ' CASCADE';
            END LOOP;

            -- Drop all views
            FOR r IN
                SELECT table_name AS name
                FROM information_schema.views
                WHERE table_schema = '{{ schema_name }}'
            LOOP
                EXECUTE 'DROP VIEW IF EXISTS {{ schema_name }}.' || quote_ident(r.name) || ' CASCADE';
            END LOOP;
        END$$;
    {% endset %}
    {{ run_query(sql) }}
{% endif %}

{% endmacro %}
