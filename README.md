# CLCustomPresentTransition
a custom present transition,it surport custom animation very esay and surport interactive transition
___
### custom animation
* first step:create a class inherit YYBasicCustomPresentAnimation and realize the specific animation that you want
* second step: tell aniamtionFactory for class map<key,value>,key is identifier for you class vaule you class's name(you can see demo)
* third step:create transiiton and specific the identifier that you aniamton class key
* foure step:set last step transtion as you presented ctr's transitionDelegate

___
### interactive transition
if a ctr need interactive transition you should create YYYouYueIndexDismissPercentInteractive on this ctr fire and realize some delegate method.
(you can see demo)

___
下个版本对手势驱动类重新设计，按照动画类似设计，让其符合开闭原作。


