Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3708040F997
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Sep 2021 15:53:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2443C5A4F6;
	Fri, 17 Sep 2021 13:53:09 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC68DC5A4F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Sep 2021 13:53:08 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3614183216;
 Fri, 17 Sep 2021 15:53:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1631886787;
 bh=VavgMm4PgSSx8LkVj8zi8kekyKN6bYvDdHuBXxQuZVc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KxdV9wlC/S3fKcGbjAmwk36VnS3cGQok97rNNdS1znWMwKRnzhhg2Ltin371TMktN
 rAagsxOyCFx/eg57h8Rb7Jh4doh8pECI5kjtL+uQ8j3TrDvZ7tbUP00268d5f2oCLc
 QiK3sm7cMFtxvpbdsWP37amwNBjics/a75Jv0UhFoZ+K5OFtW8MROJa/gzmz5Er0s/
 Fo5LgPEIZEmcncTN+F+TRsAYNNzl3cPO2kcWRhMOrwH1znWL5eKkr6Sl5bPNOUwbDI
 RJCVYqX3LJKxV0B4bVPpFTid0AVMbRdJWEepwUuP5Q7tJnXLQvE3Vj5kFqRyLu/K7L
 K6TeD9+eznU3w==
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
 <20210916155040.v3.1.I81b4f1edfe925b001299e3b7ba0cf602d9268d59@changeid>
 <70b0c139-b384-a2b9-91b1-7addc084eaa1@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <34d4bdb8-6d26-f7df-fa15-6aa986343f14@denx.de>
Date: Fri, 17 Sep 2021 15:36:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <70b0c139-b384-a2b9-91b1-7addc084eaa1@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v3 1/2] mtd: cfi_flash: use
 cfi_flash_num_flash_banks only when supported
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

T24gOS8xNy8yMSAxMjo1NSBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSBNYXJlaywK
PiAKPiAgPiBNYXJlayBWYXN1dFNlcHQuIDE2LCAyMDIxLCA1OjI0IHAubS4gVVRDIHwgIzEKPiAK
PiAgPiBPbiA5LzE2LzIxIDQ6MDEgUE0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4gCj4gID4+
IFdoZW4gQ09ORklHX1NZU19NQVhfRkxBU0hfQkFOS1NfREVURUNUIGlzIGFjdGl2YXRlZCwKPiAg
Pj4gQ09ORklHX1NZU19NQVhfRkxBU0hfQkFOS1MgaXMgcmVwbGFjZWQgYnkgY2ZpX2ZsYXNoX251
bV9mbGFzaF9iYW5rcywKPiAgPj4gYnV0IHRoaXMgdmFyaWFibGUgaXMgZGVmaW5lZCBpbiBkcml2
ZXJzL210ZC9jZmlfZmxhc2guYywgd2hpY2ggaXMKPiAgPj4gY29tcGlsZWQgb25seSB3aGVuIENP
TkZJR19GTEFTSF9DRklfRFJJVkVSIGlzIGFjdGl2YXRlZCwgaW4gVS1Cb290Cj4gID4+IG9yIGlu
IFNQTCB3aGVuIENPTkZJR19TUExfTVREX1NVUFBPUlQgaXMgYWN0aXZhdGVkLgo+ICA+Pgo+ICA+
PiBUaGlzIHBhdGNoIGRlYWN0aXZhdGVzIHRoaXMgZmVhdHVyZSBDT05GSUdfU1lTX01BWF9GTEFT
SF9CQU5LU19ERVRFQ1QKPiAgPj4gd2hlbiBmbGFzaCBjZmkgZHJpdmVyIGlzIG5vdCBhY3RpdmF0
ZWQgdG8gYXZvaWQgY29tcGlsYXRpb24gaXNzdWUgaW4KPiAgPj4gdGhlIG5leHQgcGF0Y2gsIHdo
ZW4gQ09ORklHX1NZU19NQVhfRkxBU0hfQkFOS1MgaXMgdXNlZCBpbiAKPiBzcGlfbm9yX3NjYW4o
KS4KPiAKPiAgPiBNYXliZSBqdXN0IG1pZ3JhdGUgdGhpcyBjb25maWcgb3B0aW9uIHRvIEtjb25m
aWcgYW5kIGxldCBLY29uZmlnIGhhbmRsZQo+ICA+IHRoZSBtYWNybyBtYWdpYyA/Cj4gCj4gCj4g
U29ycnkgZm9yIHRoZSBmb3JtYXTCoCBvZiBteSBhbnN3ZXIgKGl0IGlzIGp1c3QgY29weSBwYXN0
ZSBmcm9tIGFyY2hpdmUpCj4gCj4gYmVjYXVzZSBJIGRvbid0IHJlY2VpdmVkIHRoZSBVLUJvb3Qg
bWFpbHMgb24gbXkgQGZvc3Muc3QuY29tIG1haWxibwo+IAo+IHNpbmNlIHllc3RlcmRheS4KPiAK
PiAKPiBJIHRoaW5rIGFib3V0IG1pZ3JhdGlvbiBidXQgaXMgZGlmZmljdWx0IHRvIGRvbid0IGJy
ZWFrIHRoZSBleGlzdGluZyAKPiBiZWhhdmlvdXIgaW4ga2NvbmZpZwo+IAo+IENPTkZJR19TWVNf
TUFYX0ZMQVNIX0JBTktTIGFuZCBDT05GSUdfU1lTX01BWF9GTEFTSF9CQU5LU19ERVRFQ1QgYXJl
IAo+IGRlZmluZSBhcyAnaW50Jwo+IAo+IGJ1dCBjYW4gYmUgYWJzZW50ID0+IDIgbmV3IGNvbmZp
ZyBDT05GSUdfVVNFIG5lZWQgdG8gYmUgYWRkZWQKPiAKPiBDT05GSUdfVVNFX1NZU19NQVhfRkxB
U0hfQkFOS1MKPiAKPiBDT05GSUdfVVNFX1NZU19NQVhfRkxBU0hfQkFOS1NfREVURUNUCj4gCj4g
Cj4gYW5kIEkgZG9uJ3QgZnVsbHkgdW5kZXJzdG9vZCB0aGUgbWl4IGJldHdlZW4gdGhlIDIgb3B0
aW9ucyBhbmQgCj4gQ0ZJX01BWF9GTEFTSF9CQU5LUwo+IAo+IGluIHNvbWUgcGFydCBvZiBjb2Rl
IEkgdGhpbmsgQ09ORklHX1NZU19NQVhfRkxBU0hfQkFOS1Mgc2hvdWxkIGJlIAo+IHJlcGxhY2Vk
IGJ5IENGSV9NQVhfRkxBU0hfQkFOS1MKPiAKPiB0byBhdm9pZCB0byBkZWZpbmUgQ09ORklHX1NZ
U19NQVhfRkxBU0hfQkFOS1MgPSAKPiBjZmlfZmxhc2hfbnVtX2ZsYXNoX2JhbmtzIChhcyBpdCBp
cyBub3QgcG9zc2libGUgaW4gS2NvbmZpZykKPiAKPiAKPiA9PiB0b28gaHVnZSB0YXNrIGp1c3Qg
dG8gc29sdmUgY29tcGlsYXRpb24gaXNzdWVzLgo+IAo+IAo+IGFuZCBJIGFsc28gdGhpbmsgdG8g
dXNlIENPTkZJR19JU19FTkFCTEVEKE1URF9TVVBQT1JUKQo+IAo+IGJ1dCBpdCBub3QgcG9zc2li
bGUgYmVjYXVzZSB0b2RheQo+IAo+IC0gQ09ORklHX1NQTF9NVERfU1VQUE9SVCBleGlzdAo+IAo+
IC0gQ09ORklHX01URF9TVVBQT1JUIGRvbid0IGV4aXQgKCB0ZXN0IG9uICQobXRkLXkpIGluIE1h
a2VmaWxlKQo+IAo+IAo+ID0+IHRoZSBjcmVhdGlvbiBvZiB0aGlzIGNvbmZpZyBpcyBhIGh1Z2Ug
dGFzayBqdXN0IHRvIHNvbHZlIGNvbXBpbGF0aW9uIAo+IGlzc3VlLgoKQWxsIHJpZ2h0LCB3ZWxs
LCBldy4KCkNhbiB5b3Ugc2VuZCBhIHN1YnNlcXVlbnQgcGF0Y2hzZXQgX2FmdGVyXyB0aGlzIG9u
ZSB0byBmaXggdGhpcyBmbGFzaCAKYmFua3MgbWVzcyA/Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
