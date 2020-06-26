return {
  postgres = {
    up = [[
      DO $$
      BEGIN
        ALTER TABLE IF EXISTS ONLY "services" ADD "request_buffering" BOOLEAN;
      EXCEPTION WHEN DUPLICATE_COLUMN THEN
        -- Do nothing, accept existing state
      END;
      $$;
    ]],
  },

  cassandra = {
    up = [[
      ALTER TABLE services ADD request_buffering boolean;
    ]],
  },
}
