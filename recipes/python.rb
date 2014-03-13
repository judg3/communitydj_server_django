# install latest gunicorn into system path

# create a 2.6 virtualenv owned by ubuntu user
python_virtualenv "/the_app/server/" do
  owner "vagrant"
  group "vagrant"
  action :create
end

python_pip "gunicorn"

# target a virtualenv
python_pip "gunicorn" do
  virtualenv "/the_app/server/"
end

python_pip "django" do
  version "1.6"
end

package "django" do
  provider Chef::Provider::PythonPip
end

cookbook_file "/the_app/server/bin/gunicorn_start.bash" do
  source "gunicorn_start.bash"
  mode 0777
  owner "vagrant"
  group "vagrant"
  action :create
end

cookbook_file "/etc/init.d/communitydj.bash" do
  source "communitydj.bash"
  mode 0777
  owner "vagrant"
  group "vagrant"
  action :create
end