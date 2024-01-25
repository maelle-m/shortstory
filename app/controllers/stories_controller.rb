class StoriesController < ApplicationController
  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.valid?
      chatgpt_response = OpenaiService.new(generate_prompt(@story)).call
      @story.content = chatgpt_response
      @story.save
      redirect_to @story
    else
      render :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  private

  def story_params
    params.require(:story).permit(:title, :content, :number_of_characters, { character_names: [] }, :average_age, :setting, :custom_setting, :theme, :custom_theme)
 end

  def generate_prompt(story)
    prompt = "Create a child-friendly, positive short story"

    if story.average_age.present?
      prompt += " suitable for an average age of #{story.average_age} years old"
    end

    if story.character_names.present?
      prompt += " with characters named #{story.character_names}"
    end

    if story.custom_setting.present?
      prompt += " set in #{story.custom_setting}"
    elsif story.setting.present? && story.setting != 'Other'
      prompt += " set in #{story.setting}"
    end

    if story.custom_theme.present?
      prompt += " with a theme of #{story.custom_theme}"
    elsif story.theme.present? && story.theme != 'Other'
      prompt += " with a theme of #{story.theme}"
    end

      prompt += ". The story should be engaging, positive, and contain no scary or violent elements."
    end
  end
