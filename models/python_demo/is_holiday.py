import holidays

def model(dbt, session):
    dbt.config(enabled=True,
               materialized="table", 
               packages=["pandas", "pyarrow", "holidays"])
    
    is_holidays = holidays.country_holidays('US')

    df = dbt.ref("date_spine").to_pandas()
    df["IS_HOLIDAY"] = df["DATE_DAY"].apply(lambda x: x in is_holidays)

    return session.create_dataframe(df)
