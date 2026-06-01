from pathlib import Path
from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
	model_config = SettingsConfigDict(
		env_file=Path(__file__).parent.parent.parent.parent / '.env',
		env_file_encoding='utf-8'
	)
	user_name: str
	db_password: str
	db_port: int
	db_host: str
	database: str
	access_secret_key: str
	refresh_secret_key: str
	database_url: str
	echo_sql: bool = True
	algo: str = "HS256"
	access_token_expire_seconds: int = 60 * 60 * 24 # 1 day
	refresh_token_expire_seconds: int = 60 * 60 * 24 * 7 # 7 days
	encode_type: str = "utf-8"
	@property
	def database_url(self) -> str:
		return f"mysql+pymysql://{self.user_name}:{self.db_password}@{self.db_host}:{self.db_port}/{self.database}"

settings = Settings()
