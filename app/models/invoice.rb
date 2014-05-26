class Invoice < ActiveRecord::Base
  has_many :lines,
           class_name: 'InvoiceLine',
           autosave: true

  def update_lines(line_params)
    line_params.each do |id, line|
      lines.find(id).update_column(:cost, line[:cost])
    end
  end
end
