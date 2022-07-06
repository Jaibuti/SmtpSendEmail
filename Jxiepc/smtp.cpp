#include "smtp.h"
#include <iostream>

namespace Jxiepc {


Smtp::Smtp(int port, std::string domain, std::string user, std::string pwd, 
        std::string t_mail, std::string title, std::string content, std::string type)
    : m_port(port), m_domain(domain), m_user(user), m_password(pwd), m_tmail(t_mail),
    m_title(title), m_content(content), m_type(type) {

    if(init() < 0) {
        perror("init error");
    }
}

Smtp::~Smtp() {
    close(m_sockfd);    
}

int Smtp::init() {
    if(make_connect() == -1) {
        return -1;
    }
    std::string str;

    Recv();
    if(strstr(m_buf, "220") == nullptr) { return -1; } 
    std::cout << "****: " << m_buf << std::endl;

    Send("HELO " + m_user + "\r\n");
    Recv();
    if(strstr(m_buf, "250") == nullptr) { return -1; }


    Send("AUTH LOGIN\r\n");
    Recv();
    if(strstr(m_buf, "334") == nullptr) { return -1; }

    str = m_user.substr(0, m_user.find('@', 0));
    str = enBase64(str.c_str());
    str += "\r\n";
    Send(str);
    Recv();
    if(strstr(m_buf, "334") == nullptr) { return -1; }

    Send(enBase64(m_password.c_str()) + "\r\n");
    Recv();
    if(strstr(m_buf, "235") == nullptr) { return -1; }
    std::cout << "AUTH SUCCESS..." << std::endl;

    Send("MAIL FROM: <" + m_user + ">\r\n");
    Recv();
    if(strstr(m_buf, "250") == nullptr) { return -1; }

    Send("RCPT TO: <" + m_tmail+ ">\r\n");
    Recv();
    if(strstr(m_buf, "250") == nullptr) { return -1; }

    Send("DATA\r\n");
    Recv();

    str = "From: " + m_user + "\r\n";
    str += "To: " + m_tmail + "\r\n";
    str += "Subject: " + m_title + "\r\n";
    str += "Content-Type: multipart/mixed;boundary=qwertyuiop\r\n"; 
    str += "\r\n--qwertyuiop\r\n";

    if(m_type == "html"){
        str += "content-type:text/html;charset=utf-8\r\n"; //html类型
    }else{
        str += "Content-Type: text/plain;charset=utf-8\r\n"; //文本类型
    }

    Send(str);
    str = "\r\n" + m_content + "\r\n";
    str += "\r\n--qwertyuiop--\r\n.\r\n";
    Send(str);
    Recv();
    if(strstr(m_buf, "250") == nullptr) { return -1; }
    std::cout << "send success..." << std::endl;


    Send("QUIT\r\n");

    return 0;
}

int Smtp::make_connect() {
    m_sockfd = Socket(AF_INET, SOCK_STREAM, 0);
    
    hostent *host_info = gethostbyname(m_domain.c_str());
    if(host_info == nullptr){
        perror("gethostbyname error");
        return -1;
    }

    if(host_info->h_addrtype != AF_INET) {
        perror("AF_INET error");
        return -1;
    }
    char buf[128];

    struct sockaddr_in addr;
    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = *((unsigned long*)host_info->h_addr_list[0]);
    addr.sin_port = htons(m_port);
   
    Connect(m_sockfd, (struct sockaddr*)&addr, sizeof(addr));

    return 0;
}

void Smtp::Connect(int fd, const struct sockaddr *sa, socklen_t salen) {
    if(connect(fd, sa, salen)  == -1) {
        perror("connect error");
        exit(-1);
    }
}

int Smtp::Socket(int family, int type, int protocol) {
    int sockfd;
    if((sockfd = socket(family, type, protocol)) == -1) {
        perror("socket error");
        exit(-1);
    }

    return sockfd;
}

ssize_t Smtp::Send(const std::string& str) {
   ssize_t n;
   std::cout << str;
   if((n = send(m_sockfd, str.c_str(), str.length(), 0)) == -1) {
        perror("write error");
        exit(-1);
   }

    return n;
}

ssize_t Smtp::Recv() {
    ssize_t n;
    m_buf[0] = '\0';
    if((n == recv(m_sockfd, m_buf, 0xFFF, 0)) == -1) {
        perror("recv error");
        exit(-1);
    }

    return n;
}

std::string Smtp::enBase64(const std::string& str)   
{
    std::string base64_table="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    int str_len = str.length();
    std::string res="";
    for (int strp=0; strp<str_len/3*3; strp+=3)
    {
        res+=base64_table[str[strp]>>2];
        res+=base64_table[(str[strp]&0x3)<<4 | (str[strp+1])>>4];
        res+=base64_table[(str[strp+1]&0xf)<<2 | (str[strp+2])>>6];
        res+=base64_table[(str[strp+2])&0x3f];
    }
    if (str_len%3==1)
    {
        int pos=str_len/3 * 3;
        res += base64_table[str[pos]>>2];
        res += base64_table[(str[pos]&0x3)<<4];
        res += "=";
        res += "=";
    }
    else if (str_len%3==2)
    {
        int pos=str_len/3 * 3;
        res += base64_table[str[pos]>>2];
        res += base64_table[(str[pos]&0x3)<<4 | (str[pos+1])>>4];
        res += base64_table[(str[pos+1]&0xf)<<2];
        res += "=";
    }
    return res;
}

}
