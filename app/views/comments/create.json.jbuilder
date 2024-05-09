if @comment.persisted?
  json.form render(partial: "comments/form", formats: :html, locals: {residence:@residence, comment: @residence.comments.new})
  json.inserted_item render(partial: "comments/comment", formats: :html, locals: {comment: @comment})
else
  json.form render(partial: "comments/form", formats: :html, locals: {residence: @residence, comment:@residence.comments.new})
end
