class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts
  def index
    @contacts = Contact.all
    render json: @contacts      #methods: :birthdate_br     #methods: [:hello, :i18n]
    
    # render json: @contacts.map { |contact| contact.attributes.merge({ author: "Alexandre Farias" }) }
  end

  # GET /contacts/1
  def show
    render json: @contact.to_br #, include: :kind

    # render json: @contact
    # render json: @contact, methods: :author, root: true
    # render json: @contact.attributes.merge({ author: "Alexandre Farias", other: "Other data" })
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :email, :birthdate, :kind_id)
    end
end
