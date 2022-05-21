import jsonlines

c = 0
with jsonlines.open('data/uber-file.jsonl') as reader:
    for obj in reader:
        try:
            if obj['source'] == 'reports':
                c += 1
        except:
            pass

print(c)