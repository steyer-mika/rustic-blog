use sqlx::MySqlPool;

/// Structure representing the application state.
///
/// This structure holds the database connection pool (`MySqlPool`) which can be shared across
/// multiple parts of the application.
/// ```
pub struct AppState {
    /// The MySQL database connection pool.
    ///
    /// This pool is used to manage connections to the MySQL database.
    pub db: MySqlPool,
}
