ActiveAdmin.register Book do
  permit_params :name, :description, :image, :categories_ids, :authors_ids, books_categories_attributes: [:id, :book_id, :category_id, :_destroy], authors_books_attributes: [:id, :author_id, :book_id, :_destroy]

  index do
    selectable_column
    column :id
    column :name
    column :description
    column :categories do |book|
      book.categories.map {|bk| bk.name}.join(", ").html_safe
    end
    column :authors do |book|
      book.authors.map {|ba| ba.last_name + ", " + ba.first_name}.join(", ").html_safe
    end
    actions
  end

  show do |book|
    attributes_table do
      row :name
      row :image
      row :description
      row :categories do |book|
        book.categories.map {|bk| bk.name}.join(", ").html_safe
      end
      row :authors do |book|
        book.authors.map {|ba| ba.last_name +  ", " + ba.first_name}.join(", ").html_safe
      end
    end
  end


  form(:html => {:multipart => true}) do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Books" do
      f.input :name
      f.input :description
      f.input :image, :as => :file
      has_many :books_categories, allow_destroy: true do |n_f|
        n_f.input :category
      end
      has_many :authors_books, allow_destroy: true do |n_a|
        n_a.input :author, :collection => Author.all.map {|author| [author.last_name, author.id]}
      end
    end
    f.actions
  end
end
