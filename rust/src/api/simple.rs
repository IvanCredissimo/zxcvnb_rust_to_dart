use flutter_rust_bridge::frb;

#[frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

#[frb(mirror(String))]
pub type RustString = String;

/// returns a score from 0.0 to 4.0 indicating the strength of the password
#[frb]
pub fn estimate_password_strength(password: String) -> f64 {
    if password.is_empty() {
        return 0.0; // Return 0.0 for empty passwords
    }
    
    let result = zxcvbn::zxcvbn(&password, &[]).unwrap();
    result.score() as f64
}