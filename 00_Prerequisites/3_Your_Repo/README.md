# 3 · Your repo

You are going to work in **your own repository**, not in a copy of ours.

> **"How do I make changes to the repo I am reading right now?"**
>
> You don't. You create your own, pull this material into it, and push your work
> to yours. Your repository is then genuinely yours — private if you want it, on
> your own account, with your own history.

This is the same workflow you will use for the course itself, so it is worth
getting right once. Ten minutes.

---

## 0 · Before you start

- **[Set up an SSH key on GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).**
  HTTPS works too, but SSH stops you retyping credentials all week.
- Confirm it works:
  ```bash
  ssh -T git@github.com
  ```
  You should get `Hi <your-username>! You've successfully authenticated`.

> **SSH blocked at your firm?** Outbound port 22 is a common block. Use HTTPS
> addresses everywhere below instead — everything else is identical — and record
> the block. It is a real constraint.

---

## 1 · Create your own empty repo

On GitHub, create a **new, empty** repository.

| Setting | Value |
| --- | --- |
| **Name** | Something short you will not regret typing. `FDE1` is fine |
| **Visibility** | Your call. **Private is a perfectly good answer** if work-related material will end up in it |
| **Add a README** | **Deselect it.** You want a genuinely empty repo |
| **.gitignore / licence** | Add neither, for the same reason |

An empty repository is the point. Anything GitHub creates for you is something
you have to merge around in step 4.

---

## 2 · Clone your empty repo

Copy the SSH address from the green **Code** button, then:

```bash
git clone git@github.com:<YOUR_USERNAME>/FDE1.git
cd FDE1
```

> `warning: You appear to have cloned an empty repository` means you did it
> right.

---

## 3 · Add this repository as `upstream`

`origin` is yours, and you push to it. `upstream` is ours, and you only ever pull
from it.

```bash
git remote add upstream git@github.com:AI-Maker-Space/The-Enterprise-FDE-Challenge.git
git remote -v
```

You should see four lines — two for `origin`, two for `upstream`:

```
origin    git@github.com:<YOUR_USERNAME>/FDE1.git (fetch)
origin    git@github.com:<YOUR_USERNAME>/FDE1.git (push)
upstream  git@github.com:AI-Maker-Space/The-Enterprise-FDE-Challenge.git (fetch)
upstream  git@github.com:AI-Maker-Space/The-Enterprise-FDE-Challenge.git (push)
```

---

## 4 · Pull the material down

```bash
git pull upstream main --allow-unrelated-histories
```

`--allow-unrelated-histories` is needed exactly once, because your empty repo and
this one share no common commit. After this, a plain `git pull upstream main`
brings down anything new.

---

## 5 · Push it to your own remote

```bash
git push origin main
```

That is the loop, and it is the whole workflow:

```
  upstream (ours)  ──pull──►  your laptop  ──push──►  origin (yours)
```

You never push to `upstream`. You never pull from `origin` unless you are working
across two machines.

---

## 6 · Set up the environment

From the root of your repo:

```bash
make setup
```

That is `uv sync` — it reads `pyproject.toml` and builds the environment. One
command, and it is reproducible, which is why this uses `uv` rather than pip or
conda.

> **`make` not found on Windows?** You do not need it. Every `make` target is a
> one-line shortcut; run `uv sync` directly instead. The `Makefile` shows what
> each target actually does.

---

## 7 · Run the environment check

This is a [marimo](https://marimo.io/) notebook — a `.py` file, not `.ipynb`,
which means it diffs properly and deploys as an app.

```bash
make nb F=01_Product_Engineering/sessions/S1_Enterprise_Dev_Environment.py
```

That runs it in its own sandbox from the dependencies declared inside the file,
so it works even if `make setup` failed.

Work through Tasks 1 to 3. They need no model and no key:

| Task | What it tells you |
| --- | --- |
| **1** | What is actually installed, and at what version |
| **2** | **What your network allows** — six hosts, and who signed each certificate |
| **3** | Why configuration should fail at startup rather than forty minutes in |

**Task 2 is the one that matters.** Record what it shows you in
[`NETWORK.md`](../../NETWORK.md), then commit it to your own repo:

```bash
git add NETWORK.md
git commit -m "My network findings"
git push origin main
```

Task 4 makes one real model call, so come back to it after
[guide 4](../4_Your_Model/README.md).

> **Prefer Jupyter?** There is an `.ipynb` next to the notebook. It is
> **generated** from the `.py` — read or run it freely, but make edits in the
> `.py` or your changes get overwritten.

---

## 🧯 If it's blocked

### `ssh -T git@github.com` hangs or is refused

Outbound port 22 is blocked. Use HTTPS addresses instead:

```bash
git clone https://github.com/<YOUR_USERNAME>/FDE1.git
git remote add upstream https://github.com/AI-Maker-Space/The-Enterprise-FDE-Challenge.git
```

You will be asked for a
[personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
rather than a password.

### `uv sync` or `uv run` fails with a certificate error

Same cause and same fix as in [guide 1](../1_Your_Machine/README.md) — set
`REQUESTS_CA_BUNDLE` and `SSL_CERT_FILE` to your firm's CA bundle. If PyPI itself
is blocked, set `UV_DEFAULT_INDEX` to your internal mirror.

### The notebook opens but a cell hangs

The network probe resolves DNS, and a system resolver that is being filtered can
take a while to give up. Let it finish — a slow answer is itself a result worth
recording.

### `cdn.jsdelivr.net` shows as blocked

Record it. A blocked CDN is **the single most common way a demo that worked on
your laptop dies on contact with a corporate network** — anything that loads
JavaScript at runtime stops working, and the page renders perfectly while doing
nothing.

### You cannot reach GitHub at all

Some firms block it outright, or allow only an internal mirror. Work from a
personal machine and record the block. "We cannot reach github.com" shapes how
anything you build gets delivered, and it is exactly the kind of thing worth
knowing before you promise anyone a delivery date.

---

## ➡️ Next

[**4 · Your model**](../4_Your_Model/README.md) — the key or endpoint that makes
the environment check's Task 4 answer.
