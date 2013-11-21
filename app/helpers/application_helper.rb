module ApplicationHelper
	def modal_list_data_field(array_data, ui_name, hidden_key, placeholder_key, photo_field, details_field_array, focused='', &block)
		content = capture(&block)
		template = ""
		array_data.each do |element|
			item_data_object = {
				"#{ui_name}_#{hidden_key}".to_sym 		=> element[hidden_key],
				"#{ui_name}_#{placeholder_key}".to_sym 	=> element[placeholder_key]
			}
			template << modal_item(ui_name, item_data_object) do 
				modal_item_details(element, photo_field, details_field_array)
			end
		end
		list_container_class = ui_name.pluralize + "-data-container " + focused

		list_container_data_object = {
			item_query: ".#{ui_name}-list .#{ui_name}",
			form_field_query: ".#{ui_name}-#{hidden_key}",
			hidden_input_key: ui_name + hidden_key.capitalize,
			field_placeholder: ui_name + placeholder_key.capitalize
		}

		modal_list_container(list_container_class, list_container_data_object) do 
			content_tag(:h5) do
				"Select one candidate :"
			end
			modal_list ("#{ui_name}-list") do 
				template.html_safe
			end
		end
		

	 # 	modal_item "candidate", { candidate_id: element.id, candidate_name: element.name }
	 # 	modal_item "position", { position: eleiment.position }
	end

	def modal_list_container(klass, data_obj={},&block)
		content = capture(&block)
  		content_tag(:article, content, class: 'modal-form-data-container ' + klass, data: data_obj )  
	end

	def modal_list(klass, &block)
		content = capture(&block)  
  		content_tag(:ul, content, class: 'list ' + klass)  
	end

	def modal_item(klass, data_obj={}, &block)
		content = capture(&block)  
  		content_tag(:li, content, class: 'item ' + klass, data: data_obj )  
	end

	def modal_item_details(item, photo_field, details_fields_array)
		if photo_field.empty?
			icon = content_tag(:span, item[details_fields_array[0]][0...1], class: 'item-photo item-icon')
		else
			icon = tag("img", src: item[photo_field], class: 'item-photo')
		end
		
		template = ""
		details_fields_array.each_with_index do |field, index|
			klass = "item-info"
			klass += " item-info-main" if index == 0
			template << content_tag(:span, item[field], class: klass)
		end
		details = content_tag(:div, template.html_safe, class: "item-details")
		(icon + details).html_safe
	end
end
