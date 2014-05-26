class Invoice < ActiveRecord::Base
  # Associations
  # ============
  has_many :lines,
           class_name: 'InvoiceLine',
           autosave: true

  # Instance method
  # ===============
  def update_line_costs(line_params)
    line_params.each do |id, line|
      lines.find(id).update_column(:cost, line[:cost])
    end
  end
end
