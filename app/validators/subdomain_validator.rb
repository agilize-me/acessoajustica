class SubdomainValidator < ActiveModel::EachValidator
  # http://matthewhutchinson.net/2010/10/27/rails-3-subdomain-validation-activemodeleachvalidator
  # https://gist.github.com/stuartbain/7212385

  def validate_each(object, attribute, value)
    return unless value.present?
    reserved_names = %w(www ftp mail pop smtp admin ssl sftp)
    reserved_names = options[:reserved] if options[:reserved]
    if reserved_names.include?(value)
      object.errors[attribute] << 'Subdomínio inválido!'
    end
    object.errors[attribute] << 'deve ter entre 3 e 63 caracteres' unless (3..63) === value.length
    object.errors[attribute] << 'não pode começar nem terminar com hífen' unless value =~ /\A[^-].*[^-]\z/i
    object.errors[attribute] << 'deve conter letras e números (e pode conter hífen no meio)' unless value =~ /\A[a-z0-9\-]*\z/i
  end
end
