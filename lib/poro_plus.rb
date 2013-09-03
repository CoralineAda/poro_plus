require 'json'

module PoroPlus

  def initialize(args={})
    args.each{|k,v| self.public_send("#{k}=", v) if self.respond_to?("#{k}=")}
  end

  def to_hash(args={})
    instance_variables.inject({}) do |h, iv|
      value = instance_variable_get(iv)
      return h if value.nil? && args[:skip_nils]
      h[sanitized_key(iv)] = value
      h
    end
  end

  def to_json(args={})
    to_hash(args).to_json
  end

  private

  def sanitized_key(instance_variable_name)
    instance_variable_name.to_s.gsub('@','').to_sym
  end

end
