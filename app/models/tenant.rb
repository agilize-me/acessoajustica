class Tenant < ActiveRecord::Base
  after_create :create, unless: -> { Rails.env.test? }
  before_destroy :drop, unless: -> { Rails.env.test? }

  validates :nome, presence: true, uniqueness: true
  validates :subdomain, presence: true,
                        uniqueness: true,
                        subdomain:  true

  def self.current
    tenant = Tenant.find_by subdomain: Apartment::Tenant.current
    # raise ::Apartment::TenantNotFound, "Unable to find tenant" unless tenant
    tenant
  end

  def switch!
    Apartment::Tenant.switch! subdomain
  end

  def full_url
    "#{subdomain}.acessoajustica.com.br"
  end

  private

    def create
      Apartment::Tenant.create(name)
    end

    def drop
      Apartment::Tenant.drop(subdomain)
    end 
end
