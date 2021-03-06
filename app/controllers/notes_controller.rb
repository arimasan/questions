class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.where(published_state:true)
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    @tag = Note.find(params[:id]).tags.ids

  end

  def search
    result = Note.all
    result = result.where("title like '%" + params[:search] + "%'")
                   .or(result.where("content like '%" + params[:search] + "%'"))
    @notes = result
    render "index"
  end

  # POST /notes
  # POST /notes.json
  def create
    unless params[:note][:published_state_flag]
      params[:note][:published_state_flag] = false
    end

    @note = Note.new(title:params[:note][:title],content:params[:note][:content],user_id:current_user.id,published_state:params[:note][:published_state_flag])
    @note_tag = NoteTag.new(tag_id: params[:note][:tag].to_i)

    respond_to do |format|
      if @note.save
        @note_tag.note_id = Note.last.id 
        @note_tag.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_question
    @note = Note.find(params[:id])
  end

  def show_answer

  end

  def answer_check
    @note = Note.find(params[:note][:quest_id].to_i)
      text = @note.content
      texts = text.split("*")
      answer_texts = []

      (texts.count/2).times do |i|
        answer_texts.push(texts[2*i+1].strip)
      end

      params[:answer].each do |attr|

        if attr == answer_texts

        else

        end

      end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    def notes_params
      params.require(:note).permit(:name,:content,:tag)
    end

end
