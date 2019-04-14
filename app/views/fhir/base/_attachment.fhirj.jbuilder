json.contentType  attachment.content_type unless attachment.content_type.nil?
json.language     attachment.language unless attachment.language.nil?
json.data         attachment.data unless attachment.data.nil?
json.url          attachment.url unless attachment.url.nil?
json.size         attachment.size unless attachment.size.nil?
json.set! :hash,  attachment.hash unless attachment.hash.nil?
json.title        attachment.title unless attachment.title.nil?
json.creation     attachment.creation unless attachment.creation.nil?