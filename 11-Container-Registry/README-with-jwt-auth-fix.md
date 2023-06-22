# GitLab Container Registry 

### Setting Registry configuration in /etc/gitlab/gitlab.rb. 
1. We need to enable the following parameters: 

```
root@gitlabdemovm1:/var/opt/gitlab/nginx/conf# grep -i registry /etc/gitlab/gitlab.rb  | grep -v "^#"
gitlab_rails['gitlab_default_projects_features_container_registry'] = true
gitlab_rails['registry_enabled'] = true
gitlab_rails['registry_host'] = "registry.gitlab.example.com"
gitlab_rails['registry_port'] = "5005"
gitlab_rails['registry_path'] = "/var/opt/gitlab/gitlab-rails/shared/registry"
registry['token_realm'] = "http://registry.gitlab.example.com"
gitlab_rails['registry_api_url'] = "http://127.0.0.1:5000"
gitlab_rails['registry_key_path'] = "/var/opt/gitlab/gitlab-rails/certificate.key"
gitlab_rails['registry_issuer'] = "omnibus-gitlab-issuer"
registry['enable'] = true
registry['username'] = "registry"
registry['group'] = "registry"
registry['uid'] = nil
registry['gid'] = nil
registry['dir'] = "/var/opt/gitlab/registry"
registry['registry_http_addr'] = "127.0.0.1:5000"
registry['debug_addr'] = "localhost:5001"
registry['log_directory'] = "/var/log/gitlab/registry"
registry['env_directory'] = "/opt/gitlab/etc/registry/env"
registry['env'] = {
registry['log_level'] = "info"
registry['log_formatter'] = "text"
root@gitlabdemovm1:/var/opt/gitlab/nginx/conf# 

```
2. GitLab Reconfigure 
```
gitlab-ctl reconfigure
```

3. Now check the Service Status 
```
gitlab-ctl status 
```

4. You might find Nginx down, is a config error, we need to fix it manually, by edit nginx gitlab-registry config file & update the listen entry ( Line No. 14) : "listen 5005;"

```
root@gitlabdemovm1:~# grep -i listen /var/opt/gitlab/nginx/conf/gitlab-registry.conf
  listen 5005;
root@gitlabdemovm1:~# 
```

5. Manully Bring up Nginx
```
gitlab-ctl restart nginx
gitlab-ctl status nginx
```



5. Go to GitLab -> Project -> Left Hand Menu ( Packages & Registry ) -> Container Registry:

6. Update the /etc/hosts for local resolutions: 
```
127.0.0.1 registry.gitlab.example.com
```

7. Docker Login: 
```
docker login registry.gitlab.example.com:5005
```

8. Pull any image from hub.docker.com
```
docker pull ubuntu:latest
```

9. Re-Tag your image with your project specific paths:
```
docker tag ubuntu:latest registry.gitlab.example.com:5005/development-group/dataplatform/my-dp-project-uat:ubuntu-latest

```

10. Docker Push 
```
docker push registry.gitlab.example.com:5005/development-group/dataplatform/my-dp-project-uat:ubuntu-latest
```

11. Now your newly pushed image should be avaliable under the Container Registry Section:  ( GitLab -> Project -> Left Hand Menu ( Packages & Registry ) -> Container Registry ) 







