# CLCustomPresentTransition
a custom present transition,it surport custom animation very esay and surport interactive transition
setup
custom animation
first step:create a class inherit YYBasicCustomPresentAnimation and realize the specific animation that you want
second step: tell aniamtionFactory for class map<key,value>,key is identifier for you class vaule you class's name(you can see demo)
third step:create transiiton and specific the identifier that you aniamton class key
foure step:set last step transtion as you presented ctr's transitionDelegate

interactive transition
if a ctr need interactive transition you should create YYYouYueIndexDismissPercentInteractive on this ctr fire and realize some delegate method.
(you can see demo)


