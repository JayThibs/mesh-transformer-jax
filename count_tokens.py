import os
from transformers import AutoTokenizer

tokenizer = AutoTokenizer.from_pretrained('gpt2')
total_token_count = 0
for file in os.listdir('data/uber-file-txt/'):
    if file.endswith('.txt'):
        with open('data/uber-file-txt/' + file, 'r') as f:
            text = f.read()
        encoding = tokenizer(text)
        print(file, len(encoding.tokens()))
        total_token_count += len(encoding.tokens())

print('Total token count:', total_token_count)