module ApplicationHelper

  def page_title
    title = "Parajás"
    title << " (#{Tenant.current.nome}) " if Tenant.current.present?
    title
  end
end
