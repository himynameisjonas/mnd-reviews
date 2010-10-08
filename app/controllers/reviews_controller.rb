class ReviewsController < ApplicationController
  # GET /reviews
  # GET /reviews.xml
  def index
    @reviews = Review.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.xml
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.xml
  def new
    @venue = Venue.find(params[:venue_id])
    @review = @venue.reviews.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @venue = Venue.find(params[:venue_id])
    @review = @venue.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.xml
  def create
    @venue = Venue.find(params[:venue_id])
    @review = @venue.reviews.new(params[:review])
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to(@venue, :notice => 'Recension sparad') }
        format.xml  { render :xml => @venue, :status => :created, :location => @venue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.xml
  def update
    @venue = Venue.find(params[:venue_id])
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to(@venue, :notice => 'Ändringarna av recensionen är sparade') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.xml
  def destroy
    @venue = Venue.find(params[:venue_id])
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to(venue_path(@venue)) }
      format.xml  { head :ok }
    end
  end
end
