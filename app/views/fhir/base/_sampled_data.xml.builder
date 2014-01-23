xml.origin({value: sampled_data.origin}) unless sampled_data.origin.nil?
xml.period({value: sampled_data.period}) unless sampled_data.period.nil?
xml.factor({value: sampled_data.factor}) unless sampled_data.factor.nil?
xml.lower_limit({value: sampled_data.lower_limit}) unless sampled_data.lower_limit.nil?
xml.upper_limit({value: sampled_data.upper_limit}) unless sampled_data.upper_limit.nil?
xml.dimensions({value: sampled_data.dimension}) unless sampled_data.dimensions.nil?
xml.data({value: sampled_data.data}) unless sampled_data.data.nil?