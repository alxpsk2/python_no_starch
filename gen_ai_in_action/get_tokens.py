import tiktoken as tk

def get_tokens(string: str, encoding_name: str) -> str:
    # Get the encoding
    encoding = tk.get_encoding(encoding_name)
    
    # Encode the string
    encoded_string = encoding.encode(string)

    return encoded_string

def get_string(tokens: str, encoding_name: str) -> str:
    # Get the encoding
    encoding = tk.get_encoding(encoding_name)

    # Decode the tokens
    decoded_string = encoding.decode(tokens)
    
    return decoded_string

# Define the input string
prompt = "I have a white dog named Champ."

# Display the tokens
print(f"cl100k_base tokens: {get_tokens(prompt, 'cl100k_base')}")
print(f"  p50k_base tokens: {get_tokens(prompt, 'p50k_base')}")
print(f"  r50k_base tokens: {get_tokens(prompt, 'r50k_base')}")

print(f"Original String: {get_string([40, 617, 264, 4251, 5679, 7086, 56690, 13], 'cl100k_base')}")
print(get_string([2567], 'cl100k_base'))