class U8 extends num {
	U8 operator +(U8 b) {
		super+=b;
		super%=256;
		return this;
	}
}

typedef Bytes = List<U8>;

class Hash<T extends Bytes> extends Bytes {
	Hash(T);
}

class PublicKey {
	Bytes encrypt(Bytes);
}

class Signed<T extends Bytes> {
	T msg;
	Hash<T>? hash;
	Bytes? sgn;
	bool check(PublicKey) {
		return hash==PublicKey.encrypt(sgn);
	}
}

typedef UserID = Hash<PublicKey>;

class User {
	UserID id;
	PublicKey key;
	String name;
}

class UserData {
	// trust chains track changes in a user's public key, allowing users to change their username and/or password
	static Map<Hash<PublicKey>, Signed<PublicKey>> trustchains;
	
	// the map of known users:
	static Map<Hash<PublicKey>, User> users;

}

class WireMessage {
	UserID usr; // user id
	Signed<Bytes> body; // signature
	bool check() {
		return body.check(Storage.users[usr]);
	}
}