xml.content_type({value: attachment.content_type}) unless attachment.content_type.nil?
xml.language({value: attachment.language}) unless attachment.language.nil?
xml.data({value: attachment.data}) unless attachment.data.nil?
xml.url({value: attachment.url}) unless attachment.url.nil?
xml.size({value: attachment.size}) unless attachment.size.nil?
xml.tag!('hash', {value: attachment.hash}) unless attachment.hash.nil?
xml.title({value: attachment.title}) unless attachment.value.nil?