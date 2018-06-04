module NotesHelper

  def to_reading(text)
  	return_text = sharp_to_tag(text)
  	return_text = range_surrounded_tag(return_text)  	

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

  def range_surrounded_tag(text)
  	conversions = range_conversions()
  	return_text = text  	

  	conversions.each do |conversion|  	
	  	changed_text = ""
	  	return_texts = return_text.split(conversion[:pattern])
	  	p return_texts
	  	(return_texts.count/2).times do |i|
	  		changed_text += return_texts[2*i]
	  		changed_text += conversion[:tag_first]
	  		changed_text +=	return_texts[2*i+1]
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
  		{pattern: /\*/ , tag_first:"<u><strong>" , tag_last: "</strong></u>"},  	
  	]
  end

end
