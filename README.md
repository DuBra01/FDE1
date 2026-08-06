<div align="center">
  <img
    src="https://github.com/AI-Maker-Space/LLM-Dev-101/assets/37101144/d1343317-fa2f-41e1-8af1-1dbb18399719"
    width="200"
    alt="AI Makerspace logo"
  />
  <h1>The Enterprise FDE Challenge</h1>
  <p><strong>🧰 Get your machine ready. Get your problem concrete.</strong></p>
</div>

Pre-work for
[The AI Forward-Deployed Engineering Certification](https://maven.com/aimakerspace/ai-fde-certification).

> 🎯 **Engage with your own company as a world-class AI Forward-Deployed
> Engineer.** Not a sample dataset, not a demo use case — the actual problem you
> have at the actual place you work.

---

## Three tasks

Do them in this order. The first is the one that matters, and the second is what
lets you act on it.

| # | Deliverable | What it produces | Time |
| --- | --- | --- | --- |
| 1 | [**Getting to Concreteness**](https://bit.ly/fde-concreteness) | An external form to help you find a problem worth solving, for one specific person, with a measurable definition of success and the smallest product that addresses it | 30-60 minutes |
| 2 | [**Set up your machine**](./00_Prerequisites/README.md) | A working environment — tooling, Claude Code, your own repo, a model you can reach — and a measured record of what your network allows | 45-90 minutes |
| 3 | [**First Steps**](./01_First_Steps/S1_Enterprise_Dev_Environment.ipynb) | A notebook to test your environement and identify limitations | 40 minutes |


Note: On a managed work laptop the task #2 always takes longer, and the long pole is almost always approvals
rather than installation — which is exactly why you want to start now.

---

## Why this exists

Two things go wrong at the start of work like this, and both are avoidable.

**People start with nothing installed.** Then the first real session is spent
installing things instead of building, and the interesting question — *what does
my employer's network actually let me do?* — never gets asked.

**People start with a vague idea.** "We should use AI for support tickets" is not
a problem statement. It has no user, no success measure, and no input or output —
so there is nothing to build, and nothing to tell you whether the build worked.

> **Pick one problem and stay with it.** Choose something you actually own and
> actually find annoying. The most common way this goes wrong is switching
> halfway.

---

## Start here

Set up **your own repository** and pull this material into it — you do not fork,
and you do not push to ours. [Guide 3](./00_Prerequisites/3_Your_Repo/README.md)
walks through it, and it is the same workflow you will use throughout the course:

```
  upstream (ours)  ──pull──►  your laptop  ──push──►  origin (yours)
```

Once you have it locally:

```bash
./00_Prerequisites/scripts/setup_check.sh        # macOS / Linux / WSL
```
```powershell
.\00_Prerequisites\scripts\setup_check.ps1       # Windows PowerShell
```

It reports what is missing and names the guide that fixes it. It never installs
anything.

---

## The environment check

The setup script tells you *what* is missing. The notebook tells you what your
**network** does to you, which is the part nobody documents:

```bash
make nb F=01_First_Steps/S1_Enterprise_Dev_Environment.py
```

That runs in its own sandbox from the dependencies declared inside the file, so
it works even before `make setup`. It probes six hosts — PyPI, OpenAI, jsDelivr,
Hugging Face, Docker Hub, GitHub — and reports **who signed each certificate**.

On a managed laptop that column often names your own employer rather than a
public CA. That is TLS interception, stated as a fact rather than a suspicion,
and it is the single most useful thing to put in front of an infrastructure team
because it is measured rather than assumed.

> **If a host is blocked, that is a policy, not a fault.** Record the policy in
> [`NETWORK.md`](./NETWORK.md), commit it, and continue — we'll need it later.
> That file is the one artifact here that outlives the setup, and it answers
> questions you will be asked every time you try to deploy anything.

> **Prefer Jupyter?** There is an `.ipynb` next to the notebook. It is
> **generated** from the `.py` — read or run it freely, but make edits in the
> `.py`.

---

## 🔑 You bring the model

There is no shared server. Bring **either** an API key from a provider (OpenAI,
Anthropic, Azure) **or** an endpoint you can reach — your firm's internal
gateway, a server you run, or a model on your own laptop.

[`.env.template`](./.env.template) has a worked example of each. Everything
routes through LiteLLM, so switching between them is one line and no code
changes.

This is deliberate. Plenty of you cannot reach `api.openai.com` from a work
machine at all, and finding that out now is much better than finding it out
under deadline.

---

## What's in here

| Path | What it is |
| --- | --- |
| [`00_Prerequisites/`](./00_Prerequisites/README.md) | Four guides: your machine, Claude Code, your repo, your model |
| [`01_First_Stepo/`](./01_First_Steps) | The environment-check notebook, and its `.ipynb` |
| [`NETWORK.md`](./01_First_Steps/NETWORK.md) | Where your findings go |
| `helpers/` | The small library the notebook imports |

> **🔒 Never commit real company data**, hostnames, or internal architecture.
> Describe the *shape* of an answer, not its specifics. If in doubt, leave it out.

---

## 🧑‍🤝‍🧑 Your team

- [Dr. Greg Loughnane](https://www.linkedin.com/in/gregloughnane/), Owner/CEO @ AI Makerspace
- [Chris Brousseau](https://www.linkedin.com/in/chris-brousseau/), Instructor — co-author of *LLMs in Production*
- [Jacob Kilpatrick](https://www.linkedin.com/in/jacobkilpatrickai/), Course Operations Lead @ AI Makerspace
- ["Coach Mark" Walker](https://www.linkedin.com/in/mark-l-walker/), Student Success Manager @ AI Makerspace

Questions? Reach out to `jacob@aimakerspace.io`.

Keep building, shipping, and sharing 🏗️🚢🚀
