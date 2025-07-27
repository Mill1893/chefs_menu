class GroceryListsController < ApplicationController
before_action :authenticate_user!
before_action :set_grocery_list, only: %i[ show edit update destroy pdf ]

  # GET /grocery_lists or /grocery_lists.json
  def index
    @grocery_lists = GroceryList.all
  end

  # GET /grocery_lists/1 or /grocery_lists/1.json
  def show
  end

  def pdf
    daily_menu = @grocery_list.daily_menu
    items = daily_menu.daily_menu_items.includes(:daily_menu)
    ingredient_hash = Hash.new { |h, k| h[k] = [] }
    items.each do |item|
      menu_item = MenuItem.find_by(name: item.name, category: item.category)
      if menu_item
        menu_item.ingredients.each do |ingredient|
          ingredient_hash[ingredient.menu_item.category] << ingredient
        end
      end
    end
    pdf = Prawn::Document.new
    pdf.text "Grocery List for #{daily_menu.date}", size: 20, style: :bold
    ingredient_hash.each do |category, ingredients|
      pdf.move_down 10
      pdf.text "Category: #{category}", size: 16, style: :bold
      ingredients.each do |ingredient|
        pdf.text "- #{ingredient.quantity} #{ingredient.name} (for #{ingredient.menu_item.name})", size: 12
      end
    end
    send_data pdf.render, filename: "grocery_list_#{daily_menu.date}.pdf", type: 'application/pdf', disposition: 'inline'
  end
  # Add route for PDF export

  # GET /grocery_lists/new
  def new
    @grocery_list = GroceryList.new
  end

  # GET /grocery_lists/1/edit
  def edit
  end

  # POST /grocery_lists or /grocery_lists.json
  def create
    @grocery_list = GroceryList.new(grocery_list_params)

    respond_to do |format|
      if @grocery_list.save
        format.html { redirect_to @grocery_list, notice: "Grocery list was successfully created." }
        format.json { render :show, status: :created, location: @grocery_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grocery_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grocery_lists/1 or /grocery_lists/1.json
  def update
    respond_to do |format|
      if @grocery_list.update(grocery_list_params)
        format.html { redirect_to @grocery_list, notice: "Grocery list was successfully updated." }
        format.json { render :show, status: :ok, location: @grocery_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grocery_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grocery_lists/1 or /grocery_lists/1.json
  def destroy
    @grocery_list.destroy!

    respond_to do |format|
      format.html { redirect_to grocery_lists_path, status: :see_other, notice: "Grocery list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grocery_list
      @grocery_list = GroceryList.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def grocery_list_params
      params.expect(grocery_list: [ :daily_menu_id ])
    end
end
