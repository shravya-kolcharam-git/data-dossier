# Data Dossier

**Drop in any dataset and get a full data-science analysis, privately, in your browser.**

Data Dossier is a small side project. You drop a file in (or paste data), and it produces a structured report covering data quality, statistics, relationships, privacy risks and a review of whether the data is ready to use.

It **only analyzes** your data. It does not store, clean, change or upload anything. All processing happens in your browser tab.

🔗 **Live page:** https://shravya-kolcharam-git.github.io/data-dossier/

---

## What it accepts

Drop a file into the box, or paste text:

- **Tables:** CSV, TSV, semicolon- or pipe-separated files (with or without a header row)
- **Spreadsheets:** Excel (`.xlsx`, `.xls`, `.ods`), first sheet by default
- **Records:** JSON arrays, nested JSON (the largest record list is used), JSON Lines (`.jsonl`), XML
- **Text and code:** application logs, SQL scripts, source code, YAML/config, Markdown, plain text
- **Other:** binary files are identified and described, with conversion advice

## What you get

1. **Preview:** the first 20 rows and last 3 rows, before any analysis runs
2. **Executive summary:** a quality score out of 100, key findings and next steps
3. **Identity:** format, structure, granularity, likely domain, time dimension
4. **Data dictionary:** type, missing share, unique count and examples for every column
5. **Data quality audit:** missing cells, placeholders (N/A, null, ?), duplicates, mixed types, constant columns, outliers, whitespace and casing issues, ragged rows
6. **Numeric analysis:** mean, spread, quartiles, skew, histograms, outliers (Tukey fences)
7. **Categorical, text and dates:** level counts, date ranges, free-text lengths
8. **Relationships:** correlation matrix, strongest pairs, a candidate target column with associations, trends over time
9. **Risk:** outliers, personal and sensitive data scan (emails, phone numbers, card numbers, SSN-like values, credential names), leakage and modelling risks
10. **Use cases and method:** role-based guidance, test conditions derived from the data, an ML readiness checklist, and a Python (pandas) snippet that reproduces the core checks
11. **Senior review:** a verdict, a proposed data contract (allowed values and ranges per column), a missingness check (does a blank depend on other columns?) and questions for the data owner
12. **Learn more:** links to official documentation for each topic

For logs and text, the report covers log levels, error signatures, HTTP status codes, timelines, secrets and personal-data patterns, and vocabulary.

## Privacy

- Nothing is uploaded. The analysis runs locally in your browser.
- Nothing is stored. Closing the tab clears the data.
- The only external requests are for fonts and the Excel parser library from public CDNs.

## Print or save the report

Click **Save printable report** after an analysis. It saves a standalone HTML file. Open it and print, or choose "Save as PDF".

## Try it with the sample files

The `samples/` folder has 15 files to test the checks:

| File | What it tests |
|---|---|
| `01_clean_customers.csv` | Clean data, no issues expected |
| `14_clean_daily_timeseries.csv` | Clean time series |
| `02_problems_orders.csv` | Duplicates, negative values, outliers, mixed types, inconsistent labels, a broken row |
| `03_missing_values_patients.csv` | N/A, null, ?, blanks; missingness that depends on age |
| `04_weird_semicolon_bom.csv` | Semicolons, decimal commas, BOM, Windows line endings, a ragged row |
| `05_nested_orders.json` | Nested JSON with missing keys |
| `06_events.jsonl` | JSON Lines with nulls |
| `07_app_server.log` | Log levels, error signatures, stack traces |
| `08_warehouse_schema.sql` | SQL schema and inserts |
| `09_etl_pipeline.py` | Source code with TODO and FIXME markers |
| `10_notes_with_secrets.txt` | Fake credentials and personal data (screening test) |
| `11_employees_pii.xlsx` | Excel file with personal data (screening test) |
| `12_survey_quoted_text.csv` | Quoted fields containing commas and line breaks |
| `13_single_column_ids.txt` | Single-column list |
| `15_empty_file.csv` | Empty file edge case |

All sample data is generated. The secrets are fake examples.

## Limits

- This is a **screening tool**, not a replacement for a proper data review.
- Type, domain and target detection are heuristics. Confirm them with the data owner.
- Statistics describe the file you gave it, not the population it came from.
- Correlation is not causation.
- Large files are analyzed up to 250,000 rows.
- Personal-data detection is pattern-based and can miss free-form personal information.

## Built with

Plain HTML, CSS and JavaScript in a single file, with the [SheetJS](https://sheetjs.com/) library for Excel files and Google Fonts for typography. I built it with AI assistance (Claude and ChatGPT).

## Files

- `index.html`: the whole application
- `samples/`: test files
- `.github/workflows/pages.yml`: deploys the page to GitHub Pages on every push to `main`
