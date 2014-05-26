class ApplicationPresenter
  def initialize(object)
    @object = object
  end

  def presented_object
    @object
  end

  def method_missing(*args, &block)
    @object.send(*args, &block)
  end

  def respond_to_missing?(method, include_priv)
    @object.respond_to?(method, include_priv)
  end
end
