import os
import jsonlines

os.makedirs("data/alignment_texts_txts", exist_ok=True)
i = 0
with jsonlines.open("data/alignment_texts.jsonl") as reader:
    for line in reader:
        try:
            text = line["text"]
            if text != "":
                with open(f"data/alignment_texts_txts/{i}.txt", "w") as f:
                    f.write(text)
                    i += 1
        except:
            pass