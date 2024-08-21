{% snapshot my_snapshot %}

{{
  config(
    target_schema='dev',
    unique_key='composite_key',
    strategy='check',
    check_cols=['value_field', 'n_records']
  )
}}

select
  *,
  concat('value_field', '_', 'n_records') as composite_key,
  current_timestamp() as snapshot_time
from
    AIRBNB.DEV_DBT_TEST__AUDIT.TEST1

{% endsnapshot %}
