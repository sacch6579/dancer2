FROM centos:centos7
MAINTAINER Chi-Hsiu Liang <alvyn.liang@gmail.com>

RUN yum groupinstall -y "Development Tools"
RUN yum install -y  perl-devel perl-CPAN perl-App-cpanminus && yum clean all
RUN cpanm --force ExtUtils::MakeMaker && cpanm Dancer2
RUN groupadd -r dancer2 -g 433
RUN mkdir /home/dancer2
RUN useradd -u 431 -r -g dancer2 -d /home/dancer2 -s /sbin/nologin -c "Dancer2 user" dancer2
RUN cd /home/dancer2;dancer2 gen -a test_app
RUN chown -R dancer2:dancer2 /home/dancer2/test_app

USER dancer2
WORKDIR  /home/dancer2/test_app
 
