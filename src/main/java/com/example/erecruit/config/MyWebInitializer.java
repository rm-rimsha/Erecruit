package com.example.erecruit.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


//its purpose is so to remove the web.xml and the make the project
//free of xml based configurations

//import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MyWebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer  {

    //first way: build up the appplication context: this is when we are extending (implements WebApplicationInitializer
//	public void onStartup(ServletContext servletContext) throws ServletException {
//        AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();
//        appContext.register(ProjectConfig.class);
//
//        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("SpringDispatcher",
//                new DispatcherServlet(appContext));
//        dispatcher.setLoadOnStartup(1);
//        dispatcher.addMapping("/");
//
//
//
//        ContextLoaderListener contextLoaderListener = new ContextLoaderListener(appContext);
//
//        servletContext.addListener(contextLoaderListener);
//
//
//        // Filter.
//        FilterRegistration.Dynamic fr = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
//
//        fr.setInitParameter("encoding", "UTF-8");
//        fr.setInitParameter("forceEncoding", "true");
//        fr.addMappingForUrlPatterns(null, true, "/*");
//    }


    //second way to extend abstractannotconfigdispatcherserv and then override the methods (
    @Override
    protected Class<?>[] getRootConfigClasses() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        //to specify the class that will be used as the dispatcher servlet
        //configuration class (that is a replacement of the group-servlet.xml)
        return new Class[] {ProjectConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        //to configure the path that the dispatcher servlet will handle
        return new String[] {"/"};
    }

//	@Override
//	public void customizeRegistration(ServletRegistration.Dynamic registration) {
//		registration.setInitParameter("throwExceptionIfNoHandlerFound", "true");
//	}

}

