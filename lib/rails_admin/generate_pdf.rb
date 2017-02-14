require 'prawn'

module RailsAdmin
	module Config
		module Actions 
			class GeneratePdf < RailsAdmin::Config::Actions::Base

				# Set default values to pdf file page
				PDF_OPTIONS =  {
						:page_size => "A4",
						:page_layout => :portrait,
						:margin =>  [40, 75]
				}

				# Define if the action is by model (collection) and/or register(member)
				register_instance_option :collection do
				 true 
				end

				# Define if the action button is visible or not
				register_instance_option :visible? do
				 true 
				end


				# Define icon button of the action
				register_instance_option :link_icon do
				 'icon-file' 
				end

				# Define action logic
        register_instance_option :controller do

        	# Get all users to populate the file
          users = User.all
          
          Proc.new do

	          # Building the PDF file 
						Prawn::Document.new(PDF_OPTIONS) do |pdf|
	        		pdf.fill_color "666666"
	        		pdf.text "Users", :size => 32, :style => :bold, :align => :center
	        		pdf.move_down 80

	        		users.each do |user|  
	        			pdf.text " <b>#{ user.email } - #{ user.name }</b>, Kind: #{ user.kind } ",  :size => 12, :align => :justify, :inline_format => true
	        			pdf.move_down 5
	        		end
	        		# Generate file in ...
	        		pdf.render_file('public/users.pdf')
	        	end
	        
						redirect_to '/users.pdf'
          end
        end	# -> register_instance_option :controller

        	

			end # -> class GeneratePDF
		end
	end
end