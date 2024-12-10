# hetzner_devcontainer
Just a devcontainer on a Hetzner box

Don't get me wrong.
Codespaces, codesandobx, etc are AWESOME.

But.

(yes, there is a but)

I just DON'T want to use a free tier... or looking at how much I am spending in credits.
All I need is a _disposable_ machine from time to time to randomly hack some stuff.
And all will be in gitgub anyway...
So...

Why don't just get a devcontainer inside a vm in Hetzner?

The plan is to do:
```bash
terraform init
```
and some time later (no too much)
```
git push
```
and
```
terraform destroy
```

Next time I need a hacking box for... 2-3h it will cost pennies.
Which should, btw.
