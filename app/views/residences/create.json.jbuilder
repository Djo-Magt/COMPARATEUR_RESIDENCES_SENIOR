if @residence.persisted?
  json.form render(partial: "residences/form", formats: :html, locals: {residence: Residence.new})
  json.inserted_item render(partial: "residences/residence", formats: :html, locals: {residence: @residence})
else
  json.form render(partial: "residences/form", formats: :html, locals: {residence: @residence})
end
