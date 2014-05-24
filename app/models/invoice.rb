class Invoice < ActiveRecord::Base
  has_many :lines,
           class_name: 'InvoiceLine',
           autosave: true
end
