Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE38A4201
	for <lists+uboot-stm32@lfdr.de>; Sun, 14 Apr 2024 13:10:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1482DC6B444;
	Sun, 14 Apr 2024 11:10:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6114FC69063
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Apr 2024 11:10:26 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43EBAEoo075474;
 Sun, 14 Apr 2024 06:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1713093014;
 bh=zFnGkalkfKCzoN+QaM6zTv/mP9hne0nYR7cW7EYaMdE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=ZuzgZGkuaEFjbeohZwcfAiVBvDbWC2IcgQLyGMerr1hnuJs06sCmcT4Gn46Xp0Dul
 /Xbyk9Yp9LjWJks/OdjToL3dvyTg2r1uEWPVLyq1laFZU5e96xNkkC0VZK3iLj4BsA
 7swX2aHplI1WlFI2WIubb5f0XsXCA8OWMC9SCTqo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43EBAEPB022691
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 14 Apr 2024 06:10:14 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 14
 Apr 2024 06:10:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 14 Apr 2024 06:10:14 -0500
Received: from [10.249.141.75] ([10.249.141.75])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43EBABxV059006;
 Sun, 14 Apr 2024 06:10:11 -0500
Message-ID: <8c825b9d-7bb6-47e4-915d-a852df60bbc5@ti.com>
Date: Sun, 14 Apr 2024 16:40:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>, tom
 Rini <trini@konsulko.com>
References: <20240412155307.735631-1-patrice.chotard@foss.st.com>
 <20240412155307.735631-2-patrice.chotard@foss.st.com>
 <fc509f7b-78ba-425b-8a33-7768a4f58bd0@foss.st.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <fc509f7b-78ba-425b-8a33-7768a4f58bd0@foss.st.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Kumar Gala <galak@kernel.crashing.org>,
 u-kumar1@ti.com
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] lmb: Fix adjacent region merge in
 lmb_add_region_flags()
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

SGVsbG8gUGF0cmljZSwKCk9uIDQvMTMvMjAyNCAxOjU0IFBNLCBQYXRyaWNlIENIT1RBUkQgd3Jv
dGU6Cj4KPiBPbiA0LzEyLzI0IDE3OjUzLCBQYXRyaWNlIENob3RhcmQgd3JvdGU6Cj4+IEluIGNh
c2UgYSBuZXcgcmVnaW9uIGlzIGFkamFjZW50IHRvIGEgcHJldmlvdXMgcmVnaW9uIHdpdGgKPj4g
c2ltaWxhciBmbGFnLCB0aGlzIHJlZ2lvbiBpcyBtZXJnZWQgd2l0aCBpdHMgcHJlZGVjZXNzb3Is
IGJ1dCBubwo+PiBjaGVjayBhcmUgZG9uZSBpZiB0aGlzIG5ldyBhZGRlZCByZWdpb24gaXMgb3Zl
cmxhcHBpbmcgYW5vdGhlciByZWdpb24KPj4gcHJlc2VudCBpbiBsbWIgKHNlZSByZXNlcnZlZFsz
XSB3aGljaCBvdmVybGFwcyByZXNlcnZlZFs0XSkuCj4+Cj4+IFsuLl0KPj4gcGh5c19hZGRyX3Qg
bG1iX2FsbG9jKHN0cnVjdCBsbWIgKmxtYiwgcGh5c19zaXplX3Qgc2l6ZSwgdWxvbmcgYWxpZ24p
Cj4+ICAgewo+PiAgIAlyZXR1cm4gbG1iX2FsbG9jX2Jhc2UobG1iLCBzaXplLCBhbGlnbiwgTE1C
X0FMTE9DX0FOWVdIRVJFKTsKPgo+IEkgdGhpbmsgdGhpcyBzZXJpZXMgKHYyKSBpcyBub3QgY29y
cmVjdCBldmVuIGlmIG5vdyB0aGUgQ0kgdGVzdHMgYXJlIE9LLgo+IEFmdGVyIHJlLXJlYWRpbmcg
Y2FyZWZ1bGx5IHRoZSBsaWJfdGVzdF9sbWJfb3ZlcmxhcHBpbmdfcmVzZXJ2ZSgpIHRlc3QKPiBp
dCBhcHBlYXJzIHRvIG1lIHRoZXJlIGlzIGEgY29udHJhZGljdGlvbi4KPgo+IEl0J3MgaW5kaWNh
dGluZyB0aGF0ICJjaGVjayB0aGF0IGNhbGxpbmcgbG1iX3Jlc2VydmUgd2l0aCBvdmVybGFwcGlu
ZyByZWdpb25zIGZhaWxzIgo+Cj4gYnV0IHRoZSB2ZXJ5IGxhc3QgdGVzdCBvZiBsaWJfdGVzdF9s
bWJfb3ZlcmxhcHBpbmdfcmVzZXJ2ZSgpIGhhcyB0aGlzIGNvbW1lbnQgOgo+IC8qIGFsbG9jYXRl
IDNyZCByZWdpb24sIGNvYWxlc2NlIHdpdGggZmlyc3QgYW5kIG92ZXJsYXAgd2l0aCBzZWNvbmQg
Ki8KPiBhbmQgdGhpcyB0ZXN0IGFsbG93cyB0aGlzIG92ZXJsYXAgY2FzZS4KPgo+IEl0J3Mgbm90
IGNsZWFyIGlmIExNQiByZWdpb24gY2FuIG92ZXJsYXAgZWFjaCBvdGhlciBvciBub3QgPwoKCkkg
d291bGQgc2F5IHBhcnRpYWwgb3ZlcmxhcCBhbmQgY29hbGVzY2luZyB3aXRoIGJlZm9yZSBvbmUK
Ck1heSBiZSBCZWxvdyBjYW4gaGVscAoKLyogYWxsb2NhdGUgMm5kIHJlZ2lvbiAsIFRoaXMgc2hv
dWxkIGNvYWxlc2NlZCBhbGwgcmVnaW9uIGludG8gb25lCgp5b3Ugd2lsbCBnZXQgb25lIHJlZ2lv
biBhcwoKQWRkcmVzcyAtLS0gU2l6ZQoKMHg0MDAxMDAwMCAtLS0gMHgzMDAwMAoKTmV4dCBhZnRl
ciB0aGlzIMKgLyogYWxsb2NhdGUgMm5kIHJlZ2lvbiwgd2hpY2ggc2hvdWxkIGJlIGFkZGVkIGFz
IGZpcnN0IApyZWdpb24gKi8KCndlIHdpbGwgaGF2ZSB0d28gcmVnaW9uIGxpa2UKCkFkZHJlc3Mg
LS0tIFNpemUKCigweDQwMDAwMDAwIC0tIDB4ODAwMCkKCigweDQwMDEwMDAwIC0tLSAweDMwMDAw
KQoKTm93IHRoaXJkIHJlcXVlc3QgY29tZXMgaW4KCi8qIGFsbG9jYXRlIDNyZCByZWdpb24sIGNv
YWxlc2NlIHdpdGggZmlyc3QgYW5kIG92ZXJsYXAgd2l0aCBzZWNvbmQgKi8KCndoaWNoIGlzIGFk
ZHJlc3Mgb2YgwqAweDQwMDA4MDAwIGFuZCBzaXplIG9mIMKgMHgxMDAwMCwgTm93IHRoaXMgcmVn
aW9uIHRvIApiZSBhZGRlZAoKaXMgY29hbGVzY2luZyB3aXRoIGZpcnN0ICgweDQwMDAwMDAwIC0t
IDB4ODAwMCkgYW5kIHBhcnQgb2YgdGhpcyBvdmVybGFwIAp3aXRoICgweDQwMDEwMDAwIC0tLSAw
eDMwMDAwKS4KClNvLCB3aGF0IHRoaXMgcGF0Y2ggZG9lcyAsIG1lcmdlIGFsbCB0aGVzZSBpbnRv
IG9uZSByZWdpb24KCmFzICgweDQwMDAwMDAwIC0tIDB4NDAwMDApCgo+IFVkaXQsIHlvdXIgcGF0
Y2ggZWRiNTgyNGJlMTdmICgibG1iOiByZW1vdmUgb3ZlcmxhcHBpbmcgcmVnaW9uIHdpdGggbmV4
dCByYW5nZSIpCj4gaXMgYXV0aG9yaXppbmcgTE1CIG92ZXJsYXBwaW5nIHJpZ2h0ID8KCkFzIHNh
aWQgYmVmb3JlIHRoaXMgaXMgY2hlY2tpbmcgb3ZlcmxhcCBhbmQgY29hbGVzY2luZyBhbmQgYWN0
aW5nIAphY2NvcmRpbmdseS4KCj4gUGF0cmljZQo+Cj4KPgo+Cj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVi
b290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
