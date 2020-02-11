using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using Microsoft.Extensions.Configuration;
using System.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using DMS.Entity;

[assembly: OwinStartup(typeof(DMS.Startup))]

namespace DMS
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        public IConfiguration Configuration { get; }
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<ApplicationDbContext>(options => options.UseSqlServer(Configuration.GetConnectionString("DMSNEWEntities")));
        }
    }
}
