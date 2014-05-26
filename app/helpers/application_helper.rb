module ApplicationHelper
  def present(object)
    yield presenter_for(object)
  end

  def present_collection(collection, &block)
    presenters = collection.map { |member| presenter_for(member) }

    if block_given?
      presenters.each(&block)
    else
      presenters
    end
  end

  def presenter_for(object)
    "#{object.class.to_s}Presenter".
        constantize.
        new(object)
  end
end
