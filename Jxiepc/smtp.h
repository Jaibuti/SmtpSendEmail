#ifndef __JXIEPC_SMTP_H__
#define __JXIEPC_SMTP_H__

#include <iostream>
#include <string>
#include <memory>
#include <unistd.h>
#include <cerrno>
#include <utility>
#include <sys/fcntl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <cstring>

namespace Jxiepc {

class Smtp {

public:
    Smtp(int port, std::string domain, std::string user, std::string pwd, 
            std::string t_mail, std::string title, std::string content, std::string type);
    ~Smtp();

    int init();
    int make_connect();

private:
    void Connect(int fd, const struct sockaddr *sa, socklen_t salen);
    int Socket(int family, int type, int protocol);
    ssize_t Send(const std::string& str);
    ssize_t Recv();

    static std::string enBase64(const std::string& src);
private:
    int m_port;
    int m_sockfd;
    std::string m_domain;
    std::string m_user;
    std::string m_password;
    std::string m_tmail;
    std::string m_title;
    std::string m_content;
    std::string m_type;
    char m_buf[0xFFF];
};

}

#endif 

