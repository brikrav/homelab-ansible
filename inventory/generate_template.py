import re

input_file = "./inventory/hosts.ini"
output_file = "./inventory/hosts.ini.template"

# Regular expressions to match and replace specific details
hostname_regex = r"^(?P<alias>\w+)"
ip_address_regex = r"(?<=ansible_host=)[\d.]+"
username_regex = r"(?<=ansible_user=)\w+"

# Function to replace hostnames, IP addresses, and usernames with placeholders


def replace_details(line):
    line = re.sub(hostname_regex, "{{ inventory_hostname }}", line)
    line = re.sub(ip_address_regex, "{{ ansible_host }}", line)
    line = re.sub(username_regex, "{{ ansible_user }}", line)
    return line


with open(input_file, "r") as infile, open(output_file, "w") as outfile:
    for line in infile:
        modified_line = replace_details(line)
        outfile.write(modified_line)

print(f"Generated {output_file} based on {input_file}")
