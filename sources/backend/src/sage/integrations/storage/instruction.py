from google.cloud import storage

from sage.config import get_app_config


def read_instructions() -> str:
    config = get_app_config()
    bucket_name = f"{config.resource_prefix}-instructions"

    client = storage.Client(project=config.project_id)
    blob = client.bucket(bucket_name).blob("instruction.md")
    return blob.download_as_text(encoding="utf-8", timeout=10)
