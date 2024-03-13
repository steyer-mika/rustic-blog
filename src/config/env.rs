use std::env;

/// Retrieves the value of the RUST_ENV environment variable.
///
/// If the RUST_ENV environment variable is set, its value is returned.
/// Otherwise, "development" is returned by default.
/// ```
pub fn get_rust_env() -> String {
    env::var("RUST_ENV").unwrap_or_else(|_| "development".to_string())
}

/// Retrieves the server port from the PORT environment variable.
///
/// If the PORT environment variable is set, its value is returned as a `u16`.
/// Otherwise, the default port 5000 is returned.
/// ```
pub fn get_server_port() -> u16 {
    env::var("PORT")
        .unwrap_or_else(|_| "5000".to_string())
        .parse()
        .unwrap_or_else(|_| 5000)
}

/// Retrieves the application name from the APP_NAME environment variable.
///
/// If the APP_NAME environment variable is set, its value is returned.
/// Otherwise, "Rustic Blog" is returned by default.
/// ```
pub fn get_application_name() -> String {
    env::var("APP_NAME").unwrap_or_else(|_| "Rustic Blog".to_string())
}

/// Retrieves the database URL from the DATABASE_URL environment variable.
///
/// If the DATABASE_URL environment variable is set, its value is returned.
/// Otherwise, it panics with an error message indicating that the URL was not provided.
///
/// # Panics
///
/// Panics if the DATABASE_URL environment variable is not set.
/// ```
pub fn get_database_url() -> String {
    env::var("DATABASE_URL").expect("Database URL was not provided.")
}
