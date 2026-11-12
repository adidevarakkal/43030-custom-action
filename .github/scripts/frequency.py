import sys
from collections import Counter

VOWELS = "aeiou"


def count_vowels(file_path):
    """Return the number of times each vowel appears in the file."""
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            text = f.read().lower()
    except FileNotFoundError:
        print(f"Error: file '{file_path}' not found.")
        sys.exit(1)
    counts = Counter(ch for ch in text if ch in VOWELS)
    return {v: counts.get(v, 0) for v in VOWELS}


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python frequency.py <file_path>")
        sys.exit(1)
    result = count_vowels(sys.argv[1])
    print(", ".join(f"{v}: {n}" for v, n in result.items()))
