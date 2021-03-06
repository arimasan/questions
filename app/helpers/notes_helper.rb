module NotesHelper

  def to_question(text)
    return_text = sharp_to_tag(text)
    return_text = range_surrounded_question(return_text,range_conversions_question)

    return_text
  end

  def to_reading(text)
  	return_text = sharp_to_tag(text)
  	return_text = range_surrounded_tag(return_text,range_conversions)  	

    return_text
  end

  def sharp_to_tag(text)

  	conversions = line_conversions()
   	text = text.gsub(/(\r\n|\r|\n)/, "<br />")


  	return_text = text

  	conversions.each do |conversion|

  	return_texts = return_text.split("<br />")
  	changed_text = ""
  	
  	return_texts.each do |text|
  		str = text
  		strs = text.split(conversion[:pattern])
  		
  		if strs.count > 1
  			str = str.gsub(conversion[:pattern], conversion[:tag_first])			
	  		changed_text += str
	  		changed_text += conversion[:tag_last]
  		else
	  		changed_text += str
	  		changed_text += "<br />"
  		end

  		return_text = changed_text
  	end

  end

  	return_text
  end

  def range_check(text)
    return_text = text    
    return_texts = return_text.split(conversion[:pattern])
      (return_texts.count/2).times do |i|
        puts return_texts[2*i]
        puts return_texts[2*i+1].strip
      end

    return_text
  end

  def range_surrounded_tag(text,conv)
  	conversions = conv
  	return_text = text  	

  	conversions.each do |conversion|  	
	  	changed_text = ""
	  	return_texts = return_text.split(conversion[:pattern])
	  	(return_texts.count/2).times do |i|
	  		changed_text += return_texts[2*i]
	  		changed_text += conversion[:tag_first]
	  		changed_text +=	return_texts[2*i+1].strip
	  		changed_text += conversion[:tag_last]
	  	end
      
      if return_texts.last
	  	  changed_text+=return_texts.last
      end

	  	return_text = changed_text
	end

	return_text
  end

  def range_surrounded_question(text,conv)
    conversions = conv
    return_text = text    

    conversions.each do |conversion|    
      changed_text = ""
      return_texts = return_text.split(conversion[:pattern])
      (return_texts.count/2).times do |i|
        changed_text += return_texts[2*i]
        changed_text += conversion[:tag_first]
        changed_text += (return_texts[2*i+1].length*1.9).to_s

        changed_text += "' name = 'answer[]"

        changed_text += conversion[:tag_last]
      end
      changed_text+=return_texts.last

      return_text = changed_text
  end

  return_text
  end

  def line_conversions
  	conversions = [
  		{pattern: /###### / , tag_first:"<h6>" , tag_last: "</h6>"},  	
  		{pattern: /##### / , tag_first:"<h5>" , tag_last: "</h5>"},    		
  		{pattern: /#### / , tag_first:"<h4>" , tag_last: "</h4>"},  
  		{pattern: /### / , tag_first:"<h3>" , tag_last: "</h3>"},  
  		{pattern: /## / , tag_first:"<h2>" , tag_last: "</h2>"},    				
  		{pattern: /# / , tag_first:"<h1>" , tag_last: "</h1>"},  
  	]
  end

  def range_conversions
  	conversions = [
  		{pattern: /\*/, tag_first:"<u><strong>" , tag_last: "</strong></u>"},  	
  	]
  end

  def range_conversions_question
    conversions = [
      {pattern: /\*/, tag_first:"<input type='text' class='show_question' size='" , tag_last: "'>"},
    ]
  end

end
