class Tenant < ActiveRecord::Base
  after_create :add_tenant_to_apartment

  validates :nome, uniqueness: true
  validates :subdomain, uniqueness: true

  def self.current
    tenant = Tenant.find_by subdomain:Apartment::Tenant.current
    raise ::Apartment::TenantNotFound, "Unable to find tenant" unless tenant
    tenant
  end

  def switch!
    Apartment::Tenant.switch! subdomain
  end

  def full_url
    "#{subdomain}.acessoajustica.com.br"
  end

  private
    def add_tenant_to_apartment
      Apartment::Tenant.each do |ten|
        return true if ten == subdomain
      end

      puts "Creating schema #{subdomain}"
      Apartment::Tenant.create(subdomain) if unique
      true
    end

    def drop_tenant_from_apartment
      Apartment::Tenant.drop(subdomain)
    end
end
