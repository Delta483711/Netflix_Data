{% macro drop_schema(schema_name) %}
{% if execute %}
    {% set sql %}
        DO $$
        DECLARE r RECORD;
        BEGIN
            FOR r IN SELECT tablename FROM pg_tables WHERE schemaname='{{ schema_name }}' LOOP
                EXECUTE 'DROP TABLE IF EXISTS {{ schema_name }}.' || quote_ident(r.tablename) || ' CASCADE';
            END LOOP;

            FOR r IN SELECT table_name FROM information_schema.views WHERE table_schema='{{ schema_name }}' LOOP
                EXECUTE 'DROP VIEW IF EXISTS {{ schema_name }}.' || quote_ident(r.table_name) || ' CASCADE';
            END LOOP;
        END$$;
    {% endset %}
    {{ run_query(sql) }}
{% endif %}
{% endmacro %}