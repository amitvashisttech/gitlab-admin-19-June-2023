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
gitlab_rails['registry_api_url'] = "http://127.0.0.1:5000"
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

4. Now Manually Deploy Docker Registry: 
```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
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
docker tag ubuntu:latest registry.gitlab.example.com:5005/development-group/dataplatform/my-dp-project-uat:v1

```

10. Docker Push 
```
docker push registry.gitlab.example.com:5005/development-group/dataplatform/my-dp-project-uat:v1
```

11. Now your newly pushed image should be avaliable under the Container Registry Section:  ( GitLab -> Project -> Left Hand Menu ( Packages & Registry ) -> Container Registry ) 







## Setting with Defualt Registry & Have Auth Issue & Nginx 
```
root@gitlabdemovm1:~# grep -i registry /etc/gitlab/gitlab.rb  | grep -v "^#"
gitlab_rails['gitlab_default_projects_features_container_registry'] = true
gitlab_rails['registry_enabled'] = true
gitlab_rails['registry_host'] = "registry.gitlab.example.com"
gitlab_rails['registry_port'] = "5005"
gitlab_rails['registry_path'] = "/var/opt/gitlab/gitlab-rails/shared/registry"
gitlab_rails['registry_api_url'] = "http://127.0.0.1:5000"
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
root@gitlabdemovm1:~#
```