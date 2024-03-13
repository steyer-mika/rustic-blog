use actix_web::web;

use super::controller::health::health;

async fn default_route() -> impl actix_web::Responder {
    actix_web::HttpResponse::NotFound().body("404 Not Found")
}

pub fn config(config: &mut web::ServiceConfig) {
    config.service(health);
    config.default_service(actix_web::web::route().to(default_route));
}
