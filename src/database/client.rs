use crate::config::env;
use sqlx::mysql::MySqlPoolOptions; // Change to MySQL pool options

pub async fn create_pool() -> sqlx::Result<sqlx::MySqlPool> {
    // Change return type to MySqlPool
    let database_url: String = env::get_database_url();

    MySqlPoolOptions::new() // Use MySQL pool options
        .max_connections(10)
        .connect(&database_url)
        .await
}
