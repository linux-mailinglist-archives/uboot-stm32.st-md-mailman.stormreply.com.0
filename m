Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E179B15FA9
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Jul 2025 13:47:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6235BC30883;
	Wed, 30 Jul 2025 11:47:34 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A245CC36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 10:15:34 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bsSlS2r0jz9sVt;
 Wed, 30 Jul 2025 12:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1753870532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjWsjpXxtYk9oxzcxMZMAXNjN6khyiKbMS1X1CHr2tQ=;
 b=hcVrWG0FQAzQp+TqpzXKqnl6xk3jISTIPJb7hC5j2BEjZeCCy/JMxvQAiGn7tV4M/jvomk
 2hPG81hEhyVOx5Jtw0NUZSDhePv9/I298Gw3Sd0d8Ah1Ccm9iaPUd8iNLBquX2UlZSFyjO
 1sKLnGk/hNWIoAXbPSlEkj1FlVr5Emn6Umrs87pWvZqY6pt8AyHnI/Ng4ys/i3/ipRAWib
 eouDCYDe8e2wfgXINlAFiGvrKirrCdFkiuKolbqXYH6geBmipypPOfjXegWT0Mm6tt5aVi
 2LmOpPJrF/uHds5Uap1R7SrT2b/Eqiuc+0VHNeWHAOpOg5AMTFcJHN/JRuzO1A==
Message-ID: <aecc4d69-3b7a-44b2-9f7f-a0376505bdec@mailbox.org>
Date: Wed, 30 Jul 2025 12:15:30 +0200
MIME-Version: 1.0
To: Antonio Borneo <antonio.borneo@foss.st.com>, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20250521122755.265760-1-antonio.borneo@foss.st.com>
 <20250523094658.299730-1-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <20250523094658.299730-1-antonio.borneo@foss.st.com>
X-MBO-RS-ID: 2fd5a40bd343ebfc96d
X-MBO-RS-META: 3i9qyf5zw6srob4obwep4eg8ehhanaza
X-Mailman-Approved-At: Wed, 30 Jul 2025 11:47:33 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/4] watchdog for STM32MP family
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

T24gMjMuMDUuMjUgMTE6NDYsIEFudG9uaW8gQm9ybmVvIHdyb3RlOgo+IFRoaXMgc2VyaWVzIGFk
ZHJlc3NlcyB0aGUgdHdvIHdhdGNoZG9nIGRyaXZlcnMgdXNlZCBvbiBTVE0zMk1QeHgKPiBmYW1p
bHkgcGxhdGZvcm1zLgo+IAo+IE9uIHRoZSBnZW5lcmljIHdhdGNoZG9nIGZyYW1ld29yaywgaXQg
YWRkcyBhIG5ldyBtZXRob2QKPiB3ZHRfc2V0X2ZvcmNlX2F1dG9zdGFydCgpIHVzZWQgYnkgdGhl
IHdhdGNoZG9nIGRyaXZlcnMgdG8gZm9yY2UKPiB0aGUgYXV0b3N0YXJ0IHN0YXR1cyBvZiB0aGUg
d2F0Y2hkb2cuCj4gVGhpcyBpcyB1c2VkIHdoZW4gdGhlIGRyaXZlciBkZXRlY3RzIHRoYXQgdGhl
IHdhdGNoZG9nIGhhcyBhbHJlYWR5Cj4gYmVlbiBzdGFydGVkIGJ5IGEgcHJldmlvdXMgYm9vdCBz
dGFnZSAoZS5nLiBIVywgYm9vdHJvbSwgU2VjdXJlCj4gT1MsIC4uLikgYW5kIG5lZWRzIHRvIGJl
IGtpY2tlZCBieSBVLUJvb3QgcmVnYXJkbGVzcyBvZiB0aGUKPiBhdXRvc3RhcnQgZmxhZyBzZXQg
aW4gRFQgb3IgaW4gY29uZmlnLgo+IAo+IE9uIHRoZSBkcml2ZXIgYXJtX3NtY193ZHQsIGl0IGFk
ZHMgdGhlIEFQSSB0byBxdWVyeSB0aGUgU2VjdXJlIE9TCj4gYWJvdXQgdGhlIHN0YXRlIG9mIHRo
ZSB3YXRjaGRvZywgYW5kIGlmIGF0IHByb2JlIHRoZSB3YXRjaGRvZyBpcwo+IGFscmVhZHkgc3Rh
cnRlZCBpdCBpbnZva2VzIHdkdF9zZXRfZm9yY2VfYXV0b3N0YXJ0KCkuCj4gCj4gT24gdGhlIGRy
aXZlciBzdG0zMm1wX3dkdCwgaXQgYWRkcyB0aGUgY29kZSB0byBkZXRlY3QgdGhlIHN0YXRlIG9m
Cj4gdGhlIHdhdGNoZG9nLCBhbmQgaWYgYXQgcHJvYmUgdGhlIHdhdGNoZG9nIGlzIGFscmVhZHkg
c3RhcnRlZCBpdAo+IGludm9rZXMgd2R0X3NldF9mb3JjZV9hdXRvc3RhcnQoKS4KPiAKPiBBdCBs
YXN0LCBzaW5jZSBhbGwgdGhlIHdhdGNoZG9nIGRyaXZlcnMgdXNlZCBvbiBTVE0zMk1QeHggZmFt
aWx5Cj4gcGxhdGZvcm1zIGNhbiBxdWVyeSB0aGUgc3RhdHVzIG9mIHRoZSB3YXRjaGRvZyBhbmQg
dXNlIGl0Cj4gY29uc2VxdWVudGx5LCBzZXQgV0FUQ0hET0dfQVVUT1NUQVJUIGRlZmF1bHQgdG8g
J24nIG9uIHN1Y2gKPiBwbGF0Zm9ybXMuIFRoaXMgaW1wbGllcyB0aGF0IFUtQm9vdCwgYnkgZGVm
YXVsdCwgd2lsbCByZXNwZWN0IHRoZQo+IHN0YXR1cyBvZiB0aGUgd2F0Y2hkb2cgc2V0IGJ5IGEg
cHJldmlvdXMgYm9vdCBzdGFnZS4KPiBGb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBvbiBwbGF0
Zm9ybXMgdXNpbmcgU1BMLCBzdGlsbCBsZXQKPiBVLUJvb3QgdG8gYXV0b3N0YXJ0IHRoZSB3YXRj
aGRvZy4KPiAKPiBWMSA9PT4gVjIKPiAtIEZpeCBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IG9uIGRl
ZmNvbmZpZyBiYXNlZCBvbiBTUEwKPiAtIEZpeCBpbmNvbnNpc3RlbmN5IGluIHRoZSBjb21taXQg
bWVzc2FnZQo+IC0gUmViYXNlIG9uIGN1cnJlbnQgYnJhbmNoIG5leHQKPiAKPiBBbnRvbmlvIEJv
cm5lbyAoMik6Cj4gICAgd2F0Y2hkb2c6IHdkdC11Y2xhc3MuYzogYWRkIHdkdF9zZXRfZm9yY2Vf
YXV0b3N0YXJ0KCkgaGVscGVyCj4gICAgd2F0Y2hkb2c6IGFybV9zbWNfd2R0OiBnZXQgd2R0IHN0
YXR1cyB0aHJvdWdoIFNNQ1dEX0dFVF9USU1FTEVGVAo+IAo+IENsw6ltZW50IExlIEdvZmZpYyAo
MSk6Cj4gICAgd2F0Y2hkb2c6IHN0bTMybXA6IGNoZWNrIHRoZSB3YXRjaGRvZyBzdGF0dXMKPiAK
PiBQYXRyaWNlIENob3RhcmQgKDEpOgo+ICAgIHdhdGNoZG9nOiBkb24ndCBhdXRvc3RhcnQgd2F0
Y2hkb2cgb24gU1RNMzJNUCBhcmNoaXRlY3R1cmUKPiAKPiAgIC4uLnN0bTMybXAxNS1pY29yZS1z
dG0zMm1wMS1jdG91Y2gyX2RlZmNvbmZpZyB8ICAxICsKPiAgIC4uLnRtMzJtcDE1LWljb3JlLXN0
bTMybXAxLWVkaW1tMi4yX2RlZmNvbmZpZyB8ICAxICsKPiAgIC4uLi1taWNyb2dlYS1zdG0zMm1w
MS1taWNyb2RldjItb2Y3X2RlZmNvbmZpZyB8ICAxICsKPiAgIC4uLm1wMTUtbWljcm9nZWEtc3Rt
MzJtcDEtbWljcm9kZXYyX2RlZmNvbmZpZyB8ICAxICsKPiAgIGNvbmZpZ3Mvc3RtMzJtcDE1X2Jh
c2ljX2RlZmNvbmZpZyAgICAgICAgICAgICB8ICAxICsKPiAgIGNvbmZpZ3Mvc3RtMzJtcDE1X2Ro
c29tLmNvbmZpZyAgICAgICAgICAgICAgICB8ICAxICsKPiAgIGRyaXZlcnMvd2F0Y2hkb2cvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgIGRyaXZlcnMvd2F0Y2hkb2cvYXJt
X3NtY193ZHQuYyAgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysKPiAgIGRyaXZlcnMvd2F0
Y2hkb2cvc3RtMzJtcF93ZHQuYyAgICAgICAgICAgICAgICB8IDMzICsrKysrKysrKysrKysrKysr
KysKPiAgIGRyaXZlcnMvd2F0Y2hkb2cvd2R0LXVjbGFzcy5jICAgICAgICAgICAgICAgICB8ICA5
ICsrKysrCj4gICBpbmNsdWRlL3dkdC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgOSArKysrKwo+ICAgMTEgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKQoKQXBwbGll
ZCB0byB1LWJvb3Qtd2F0Y2hkb2cvbWFzdGVyCgpUaGFua3MsClN0ZWZhbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
