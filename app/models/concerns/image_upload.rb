module ImageUpload
extend ActiveSupport::Concern

=begin 
 	Upload image into Bucket airmelive in AWS Cloud.
=end
	def fog(location)
				loc = location.partition("?")
				connection = Fog::Storage.new({
 		    :provider                 => 'AWS',
    		:aws_access_key_id        => 'AKIAIS7NMF5PS3DYZRJQ',
    		:aws_secret_access_key    => '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',
			})
			directory = connection.directories.create(
    			:key    => "airmelive",
    			:public => true
			)
			file = directory.files.create(
				:key    => avatar_file_name,
				:body   => File.open(Rails.root.to_s+ "/public"+loc[0]),
				:public => true
			)
	end
end