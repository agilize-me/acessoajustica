module ApplicationHelper

  def page_title
    title = "Acesso à Justiça"
    title << " (#{Tenant.current.nome}) " if Tenant.current.present?
    title
  end
end
