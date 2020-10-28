package com.roland;

import org.yaml.snakeyaml.Yaml;

import java.io.InputStream;
import java.util.Map;

public class YamlProcessor {
    private Yaml yaml;
    public YamlProcessor(){
        Yaml yaml = new Yaml();
    }
    public void printYaml(String filename){
        InputStream inputStream = this.getClass()
                .getClassLoader()
                .getResourceAsStream(filename);
        Map<String, Object> obj = yaml.load(inputStream);
        System.out.println(obj);
    };
}
