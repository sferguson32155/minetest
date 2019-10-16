function square(a) {
	return a*a
};

var result = () => {
	return 'result of square(2): ' + square(2);
};

var date = () => {
	return new Date();
};

result() + '\n' + date();

