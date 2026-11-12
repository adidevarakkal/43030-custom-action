# 43030 Custom GitHub Action with Docker (Lecture 3 activities)

On every push to `main`, the workflow builds a Docker image and runs it. Inside the container, `entrypoint.sh` runs `frequency.py` to count the vowels in `data.txt`, then `update_readme.sh` appends the result, the contributor's username and a timestamp to this file.

## Vowel frequency results

- **2026-11-12 12:38:31** | pushed by **adidevarakkal** | vowel frequency in data.txt: a: 9, e: 13, i: 8, o: 6, u: 5
