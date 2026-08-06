# What my network does

Fill this in from Task 2 of the environment check, then commit it to your own
repo. It takes five minutes and it is the most portable thing you will produce
this week — every question below gets asked again the first time you try to
deploy anything, anywhere.

> **🔒 Do not put real internal hostnames, IP ranges, or architecture in here.**
> Describe the *shape* of an answer — "an internal PyPI mirror", not its address.
> If in doubt, leave it out.

---

## The probe

Paste the table the notebook produced:

<!-- your answer here -->

| Host | Reachable? | Signed by |
| --- | --- | --- |
| `pypi.org` | | |
| `api.openai.com` | | |
| `cdn.jsdelivr.net` | | |
| `huggingface.co` | | |
| `registry-1.docker.io` | | |
| `github.com` | | |

---

## What it means

**Which of the three did you get?**

- [ ] Everything reachable, public certificate authorities. Nothing here will bite you.
- [ ] Reachable, but signed by my employer — TLS is being intercepted.
- [ ] Some hosts fail — I am behind an allowlist.

**If TLS is intercepted**, the thing to know is that it works in your terminal
because your operating system trusts that certificate authority. A container does
not. Anything you ship will need that CA baked in or mounted.

Where does your CA bundle live?

<!-- your answer here -->

**If something is blocked**, which hosts, and is there an internal mirror instead?

<!-- your answer here -->

---

## Proxy and certificate variables

The notebook lists which of these are set on your machine. Note any that are:

<!-- your answer here -->

`HTTP_PROXY` · `HTTPS_PROXY` · `NO_PROXY` · `REQUESTS_CA_BUNDLE` ·
`SSL_CERT_FILE` · `CURL_CA_BUNDLE` · `NODE_EXTRA_CA_CERTS` · `PIP_INDEX_URL` ·
`UV_DEFAULT_INDEX`

---

## Who owns this

Most people cannot answer this, which is the point of asking. Find out who runs
the proxy, who approves an allowlist entry, and who you would ask for a
certificate.

| Question | Who answers it |
| --- | --- |
| Who runs the outbound proxy? | <!-- your answer here --> |
| Who approves adding a host to the allowlist? | <!-- your answer here --> |
| Is there an internal package mirror, and who owns it? | <!-- your answer here --> |
| Is there an approved internal LLM endpoint? | <!-- your answer here --> |

> **A block is a policy, not a fault.** Record the policy and continue — we'll
> need it later. An engineer who says "it doesn't work" is stuck. An engineer who
> says "outbound TLS to that host is intercepted by our own CA, here is who owns
> the exception process, and here is what it means for anything we containerize"
> is doing the job.