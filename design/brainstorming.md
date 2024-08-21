users identified by pubkey
shown in the interface as username (if available) + first N hex digits of a SHA256 hash of the pubkey
user data:
```c++
struct user {
	key pubkey;
	string username;
};
map<hash<key>,hash<key>> trustchains;
map<hash<key>,user> users;

struct message {
	hash<key> u; // user
	bytes m; // message body
	signature s; // signature
};
```


message types:
