package com.example.erecruit.config;

import org.springframework.context.annotation.Bean;
//imports
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
;

//this class is for the purpose of replacing the group-servlet.xml file which was:

/*
<?xml version="1.0" encoding="UTF-8"?>

<!-- this is the configuration file for the dispatcher servlet and
it is supposed to be with the name <servlet name>-servlet.xml -->

<beans xmlns="http://www.springframework.org/schema/beans"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:context="http://www.springframework.org/schema/context"
   xsi:schemaLocation="http://www.springframework.org/schema/beans
   http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
   http://www.springframework.org/schema/context
   http://www.springframework.org/schema/context/spring-context-3.0.xsd">


	<!-- here i am specifying that it should work on annotation based configuration and
	should search the base package mentioned for the controllers -->
	<context:annotation-config></context:annotation-config>
	<context:component-scan base-package="com.mishal"></context:component-scan>

</beans>
*/



//and to purely make the project annotation based

@Configuration //to declare it a configuration file
@EnableWebMvc
@ComponentScan("com.example.erecruit.controller") //to declare that we need to scan the given base package for annotation so it replaces this line of the xml file:<context:component-scan base-package="com.mishal"></context:component-scan>
public class ProjectConfig
{

    @Bean //annotation to specify that this method will give you an object of IRVR
    public InternalResourceViewResolver viewResolver()  {

        //creating an object of the view resolver and returning it
        InternalResourceViewResolver vr=new InternalResourceViewResolver();

        //specifying the path of our view files
        vr.setPrefix("/view/");
        //specifying the extension of our files
        vr.setSuffix(".jsp");
        //then returning this object
        return vr;

		/*purpose of the resolver:
		1.now we would not have to mention the extension of the view file(html or jsp)
		  and in future if we need to change the file type of the views, we wouldnt have to
		  change anything in our method or controller. it purely its job to find the
		  particular view in a file full of our view files
		2.secondly if we move the for example sample.jsp file from webapp to WEB-INF
		  now it has a restricted access and only through this resolver we can
		  retrieve it.*/
    }


}


