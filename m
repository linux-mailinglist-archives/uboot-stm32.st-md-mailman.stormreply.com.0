Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gOVbHi48T2pecgIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Jul 2026 08:14:06 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F020072D037
	for <lists+uboot-stm32@lfdr.de>; Thu, 09 Jul 2026 08:14:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=nabladev.com header.s=dkim header.b=LLujyATk;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nabladev.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 986BDC8F274;
	Thu,  9 Jul 2026 06:14:05 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D57E4C56600
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 06:14:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E9EF1193E2; Thu,  9 Jul 2026 08:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1783577643;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=6AXguDBiGw3s0e2XnqyVSwnUB4gL+cDfOp33ntC92/E=;
 b=LLujyATkBXgoA0r7qQQC3mrpSiiGNuEUvJciynoiiZ7Xh8v15dU76wf9iq/3H66SIaVqW+
 eB7iF04K3ki+xHiFPlVuxDjx1SE5uOUmYeEMMPzVD4LKilrgyu8j7E0oXUDBGoc+qnST2V
 +LHhSRISRG0Q//+EJbXq3H30YGvxl0yr0yZXWl06oFWxvz51pwrXazk2wyrOQ9fsJqrXs/
 o9khw+Jx12JtaITugtgsiODcoQr1RJC6rpDv3/OOZNUrkes2Y9cOc9ZTtzKJY7E/JBFF3Z
 aSvMTHs/ORODj7swIhm5XBFtLNtWoSkY8iDRqY4wgykKOdeuLOTPLzGlzOqeJQ==
Message-ID: <429e58bc-741a-59ac-bd42-6d96483b2010@nabladev.com>
Date: Thu, 9 Jul 2026 08:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20260609110040.1.Id466ecfe12f609ef0b8a6296fbc5d866a6bdac9e@changeid>
From: Heiko Schocher <hs@nabladev.com>
In-Reply-To: <20260609110040.1.Id466ecfe12f609ef0b8a6296fbc5d866a6bdac9e@changeid>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Peter Collingbourne <peter@pcc.me.uk>, Peng Fan <peng.fan@nxp.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] fs: ubifs: fix ubifs_finddir() result
	check
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:u-boot@lists.denx.de,m:peter@pcc.me.uk,m:peng.fan@nxp.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:andrew.goodbody@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hs@nabladev.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hs@nabladev.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[nabladev.com:-];
	TAGGED_RCPT(0.00)[uboot-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:from_mime,nabladev.com:email,nabladev.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F020072D037

SGVsbG8gUGF0cmljaywKCk9uIDA5LjA2LjI2IDExOjAwLCBQYXRyaWNrIERlbGF1bmF5IHdyb3Rl
Ogo+IHViaWZzX2ZpbmRkaXIoKSBjYW4gcmV0dXJuIGEgbmVnYXRpdmUgZXJyb3IgY29kZSAoLUVO
T01FTSBvcgo+IFBUUl9FUlIoZGVudCkpIGFuZCByZXR1cm5zIDEgd2hlbiB0aGUgbmFtZSBpcyBm
b3VuZCBpbiB0aGUgZGlyZWN0b3J5Lgo+IEZpeCB0aGUgcmVzdWx0IGNoZWNrIGFjY29yZGluZ2x5
Lgo+IAo+IFRoaXMgZml4ZXMgZmlsZSBleGlzdGVuY2UgZGV0ZWN0aW9uIChmb3IgInRlc3QgLWUi
KSB3aGVuIFUtQm9vdCB1c2VzCj4gVUJJRlMgdGhyb3VnaCBvcHMgdWJpZnNfZXhpc3RzKCkuIFNp
bmNlIHRoaXMgZnVuY3Rpb24gaXMgYWxzbyBjYWxsZWQKPiBiZWZvcmUgb3RoZXIgZmlsZSBvcGVy
YXRpb25zLCBjb21tYW5kcyBzdWNoIGFzICJsb2FkIiBjb3VsZCBiZSBleGVjdXRlZAo+IG9uIGEg
bm9uLWV4aXN0aW5nIGZpbGUgd2l0aG91dCByZXBvcnRpbmcgYW4gZXJyb3IuCj4gCj4gRml4ZXM6
IDBjYWIyOWZmNDY3ZSAoImZzOiB1YmlmczogRml4IGFuZCByZXdvcmsgZXJyb3IgaGFuZGxpbmcg
aW4gdWJpZnNfZmluZGRpciIpCj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0
cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAtLS0KPiAKPiAgIGZzL3ViaWZzL3ViaWZzLmMg
fCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CkFwcGxpZWQgdG8gdS1ib290LXViaS5naXQKClRoYW5rcyEKCmJ5ZSwKSGVpa28KLS0gCk5hYmxh
IFNvZnR3YXJlIEVuZ2luZWVyaW5nCkhSQiA0MDUyMiBBdWdzYnVyZwpQaG9uZTogKzQ5IDgyMSA0
NTU5MjU5NgpFLU1haWw6IG9mZmljZUBuYWJsYWRldi5jb20KR2VzY2jDpGZ0c2bDvGhyZXIgOiBT
dGVmYW5vIEJhYmljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
