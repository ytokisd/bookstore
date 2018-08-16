ActiveAdmin.register Review do
  #belongs_to :user
  permit_params :book_id, :user_id, :status_id, :title, :review_text, :created_at, user_attributes: [:id, :email], book_attributes: [:id, :name], status_attributes: [:id, :name]
  scope :new, :default => true do |reviews|
    reviews.where('status_id = ?', 1)
  end
  scope :processed do |reviews|
    reviews.where('status_id != ?', 1)
  end
  index do
    selectable_column
    column :id
    column :title
    column :users do |review|
      review.user.email.html_safe
    end
    column :books do |review|
      review.book.name.html_safe
    end
    column :statuses do |review|
      review.status.name.html_safe
    end
    actions
  end

  show do |review|
    attributes_table do
      row :title
      row :review_text
      row :users do |review|
        review.user.email.html_safe
      end
      row :books do |review|
        review.book.name.html_safe
      end
      row :statuses do |review|
        review.status.name.html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Reviews" do
      f.input :title
      f.input :review_text
      f.input :user, :collection => User.all.map {|user| [user.email, user.id]}
      f.input :status
      f.input :book
    end
    f.actions
  end
end
