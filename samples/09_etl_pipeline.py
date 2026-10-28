import pandas as pd

# TODO: move paths into config
def load(path):
    return pd.read_csv(path)

def clean(df):
    df = df.drop_duplicates()
    df["amount"] = pd.to_numeric(df["amount"], errors="coerce")
    return df  # FIXME: no validation of negative amounts

if __name__ == "__main__":
    print(clean(load("orders.csv")).describe())
