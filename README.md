## Data files

- `data/source/purposes.csv` – Records the various “purpose” statements of the universities. Taken from university legislation. Cross reference against `data/university-acts.csv` using the `university` and `year` columns.
- `data/source/university-acts.csv` – Lists university legislation over time. All references are to the [_Statutes of Ontario_](https://archive.org/details/robarts?query=Statutes+of+the+Province+of+Ontario&sin=&sort=-date), unless a link is given by the `url` column.
- `data/source/universities.csv` – Register of public universities. Notes year of founding and, if relevant, dissolution or absorption.

## Method

- Find the first legislation for a university using the _Statutes of Ontario_, note the purpose. Acts can be either public or private.
- Check the [legislative tables](https://www.ontario.ca/laws/legislative-tables) for evidence of any updates, noting the purpose if changed.
