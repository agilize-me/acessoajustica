json.extract! tenant, :id, :nome, :subdomain, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
