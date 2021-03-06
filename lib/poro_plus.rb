require 'json'

module PoroPlus

  def initialize(args={})
    args.each{ |key, value| instance_variable_set("@#{key}".to_sym, value) if self.respond_to?(key) }
  end

  def to_hash(args={})
    instance_variables.inject({}) do |h, iv|
      key = sanitized_key(iv)
      value = instance_variable_get(iv)
      value ||= self.public_send(key) if self.respond_to?(key)
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
