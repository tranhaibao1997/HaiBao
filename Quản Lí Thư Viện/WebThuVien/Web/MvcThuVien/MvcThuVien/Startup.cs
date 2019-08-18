using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MvcThuVien.Startup))]
namespace MvcThuVien
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
