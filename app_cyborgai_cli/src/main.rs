//==================================================================================================
// CyborgAI
// CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
// https://github.com/cyborg-ai-git
//==================================================================================================
use evo_core_app_cli::CAppMain;
use evo_framework::{IControl, IError};
//==================================================================================================
/// Doc
#[tokio::main(flavor = "multi_thread")]
async fn main() -> Result<(), Box<dyn IError>> {
    let mut c_app_main = CAppMain::default();
    c_app_main.do_init().await?;
    c_app_main.do_start().await
}
//==================================================================================================