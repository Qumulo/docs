from google.analytics.data_v1beta import BetaAnalyticsDataClient
from google.analytics.data_v1beta.types import DateRange, Dimension, Metric, RunReportRequest
from google.oauth2 import service_account
import re

KEY_FILE_LOCATION = '/app/engineering-173019-49cb92815171.json'
PROPERTY_ID = '282075494'
README_PATH = '/app/README.md'

def initialize_analytics_reporting():
    credentials = service_account.Credentials.from_service_account_file(KEY_FILE_LOCATION)
    client = BetaAnalyticsDataClient(credentials=credentials)
    return client

def get_report(client):
    request = RunReportRequest(
        property="properties/{}".format(PROPERTY_ID),
        date_ranges=[DateRange(start_date="7daysAgo", end_date="today")],
        dimensions=[Dimension(name="pagePath"), Dimension(name="pageTitle")],
        metrics=[Metric(name="screenPageViews")],
        order_bys=[{"metric": {"metric_name": "screenPageViews"}, "desc": True}],
        limit=100
    )
    response = client.run_report(request)
    return response

def filter_urls(rows):
    ignore_paths = ["/", "/index.html", "/search.html", "/contacting-qumulo-care-team.html"]
    ignore_patterns = [
        re.compile(r"^/[^/]+/$"),
        re.compile(r"^/[^/]+/index.html$"),
        re.compile(r"^/[^/]+/[^/]+/$"),
        re.compile(r"^/[^/]+/[^/]+/index.html$"),
    ]

    filtered_rows = []
    for row in rows:
        path = row.dimension_values[0].value
        if path in ignore_paths:
            continue
        if any(pattern.match(path) for pattern in ignore_patterns):
            continue
        filtered_rows.append(row)

    return filtered_rows

def generate_markdown(filtered_rows):
    markdown_lines = [
        "## Hot Topics",
        "The following are the most-accessed pages on the Documentation Portal.",
        ""
    ]

    for idx, row in enumerate(filtered_rows[:10], start=1):
        dimensions = row.dimension_values
        page_path = dimensions[0].value
        page_title = dimensions[1].value.replace(" | Qumulo Documentation", "")
        markdown_lines.append("{}. [{}]({})".format(idx, page_title, page_path))

    markdown_lines.append("\n")  # Add a blank line after the last item
    return "\n".join(markdown_lines)

def update_readme(content):
    with open(README_PATH, 'r') as file:
        readme_content = file.read()

    start_idx = readme_content.find("## Hot Topics")
    end_idx = readme_content.find("## Get Qumulo Core")

    if start_idx != -1 and end_idx != -1:
        # Remove existing Hot Topics section before inserting the new one
        updated_content = readme_content[:start_idx] + content + readme_content[end_idx:]
    elif end_idx != -1:
        updated_content = readme_content[:end_idx] + "\n" + content + "\n" + readme_content[end_idx:]
    else:
        print("Error: Could not find the '## Get Qumulo Core' heading in the README file")
        return

    # Ensure there is only one "## Get Qumulo Core" heading
    updated_content = re.sub(r"(## Get Qumulo Core\s*)+", "## Get Qumulo Core\n", updated_content)

    with open(README_PATH, 'w') as file:
        file.write(updated_content)
    print("README file updated successfully")

def main():
    client = initialize_analytics_reporting()
    response = get_report(client)
    filtered_rows = filter_urls(response.rows)
    markdown_content = generate_markdown(filtered_rows)
    update_readme(markdown_content)

if __name__ == '__main__':
    main()
