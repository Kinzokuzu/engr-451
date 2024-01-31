% ENGR 451 - Chapter 1 Laboratory
% Matlab tutorial

clear
x.data = [1 2 3 4 5];
x.offset = 1;
y.data = [5 4 3];
y.offset = 0;

% test add
test_lab1_2024('addit(x, y)')
test_lab1_2024('addit(y, x)')
test_lab1_2024('addit(1, x)')
test_lab1_2024('addit(x, 1)')

y.offset = 2;
test_lab1_2024('addit(x, y)')
test_lab1_2024('addit(y, x)')

y.offset = 7;
% test sub
test_lab1_2024('subit(x, y)')
test_lab1_2024('subit(y, x)')
test_lab1_2024('subit(1, x)')
test_lab1_2024('subit(x, 1)')

% test mult
test_lab1_2024('multit(x, y)')
test_lab1_2024('multit(3, x)')
test_lab1_2024('multit(x, 3)')

% test flip
test_lab1_2024('flipit(x)')

% test shift
test_lab1_2024('shiftit(y, 2)')

% test trim
x.data = [0 0 1 2 3 0];
test_lab1_2024('trimit(x)')

%combinations
test_lab1_2024('flipit(subit(shiftit(addit(x, 2), 4), y))')
test_lab1_2024('addit(flipit(addit(x, y)), shiftit(y, -5))')
test_lab1_2024('subit(addit(multit(shiftit(flipit(x), 4), shiftit(y, 3)), flipit(y)), x)')

% test stem
clf
stemit(y)
grid on
ax = axis;
set(gca, 'XTick', ax(1):ax(2), ...
	'YTick', ax(3):ax(4))
ch = get(gca, 'Child');
ch.MarkerFaceColor = 'b';

% Program Listings
fprintf('\n\n')
disp('--- flipit.m --------------------------------')
type flipit
disp(' ')
disp('--- shiftit.m --------------------------------')
type shiftit
disp(' ')
disp('--- addit.m --------------------------------')
type addit
disp(' ')
disp('--- subit.m --------------------------------')
type subit
disp(' ')
disp('--- multit.m --------------------------------')
type multit
disp(' ')
disp('--- trimit.m --------------------------------')
type trimit
disp(' ')
disp('--- stemit.m --------------------------------')
type stemit
