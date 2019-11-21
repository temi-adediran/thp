class ApplicationPresenter < SimpleDelegator
  attr_accessor :model

  def initialize(model, view, opts = {})
    @model = model
    @view = view
    @opts = opts
    super(@model)
  end

  def self.wrap(collection, view)
    collection.map { |obj| new(obj, view) }
  end

  private

  def t(*args)
    @view.t(*args)
  end

  def current_user
    @opts.fetch(:current_user)
  end
end
