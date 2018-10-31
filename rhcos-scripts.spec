Name:		rhcos-scripts
Version:	0.0.1
Release:	1%{?dist}
Summary:	collection of system util scripts

License:	ASLv2.0
URL:		https://github.com/yuqi-zhang/rhcos-scripts
Source0:	https://github.com/yuqi-zhang/%{name}/archive/%{version}.tar.gz

%description
A collection of system util scripts for RHCOS systems,
current only includes taint-on-ssh, which notifies the
user and the system that a RHCOS system has been tainted
since an ssh connection was attempted.

%define debug_package %{nil}

%prep
%autosetup

%build
# No building required

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT/%{_libexecdir}
install -m 755 taint-on-ssh.sh $RPM_BUILD_ROOT/%{_libexecdir}/taint-on-ssh

%files
%doc README.md
%{_libexecdir}/taint-on-ssh


%changelog
* Tue Oct 30 2018 Yu Qi Zhang <jerzhang@redhat.com> - 0.0.1
- Initial Specfile for rhcos-scripts
