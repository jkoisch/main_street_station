xml.content_type({value: attachment.content_type}) if attachment.content_type
xml.language({value: attachment.language}) if attachment.language
xml.data({value: attachment.data}) if attachment.data
xml.url({value: attachment.url}) if attachment.url
xml.size({value: attachment.size}) if attachment.size
xml.tag!("hash", {value: attachment.hash}) if attachment.hash
xml.title({value: attachment.title}) if attachment.value