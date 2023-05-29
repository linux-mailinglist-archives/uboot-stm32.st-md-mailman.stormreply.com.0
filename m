Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A707141CB
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 May 2023 03:58:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4504C6904B;
	Mon, 29 May 2023 01:57:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BFA2C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 01:57:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4C16F801CE;
 Mon, 29 May 2023 03:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685325477;
 bh=REGbHrEUGTjU3yytnuBkFZ2ilYy6b/AmusG195GsXNo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Px9XVyR84Hgp91PoB5Ld3cAqaMDlUFQyFRuB9tZYdj6iQSPLS372vmDdMWrzZboqW
 HMOS0j6FGoYvHMgGIpCglgoECSRyVvrJ6ztrjfKcV2Rv6S92/lU5HLGOzLS34zzhZz
 lUWXBxW73FY9yzjAVSRz4vUfcNj5OrnN5m+D5umRM36IAlVhLql/XPn/pMuMQiGDSS
 E++Vl01Yb4g+7yk3y8//HcR++kxk5L9nBIHwr30I78xHpTQY7nReZAi3HW89euV18y
 YeeCEdRONk33PNPmWWlY7rIbDEwityD4aQvsujyRn4eNhMcIbR+j8xIt4TqR/S2rJ3
 q28Kczqi6F1hQ==
Message-ID: <607a112c-4320-5a5f-b988-98e5ea8e3267@denx.de>
Date: Mon, 29 May 2023 03:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20230517220239.329807-1-marex@denx.de>
 <e171b09d-0e7d-1815-6133-0946212a08d9@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <e171b09d-0e7d-1815-6133-0946212a08d9@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Power cycle Buck3 in reset on
	DHSOM
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

T24gNS8yNS8yMyAxMDowOCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSBNYXJlaywKCkhl
bGxvIFBhdHJpY2ssCgpzb3JyeSBmb3IgdGhlIGFieXNtYWwgZGVsYXkuCgo+IE9uIDUvMTgvMjMg
MDA6MDIsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBJbiBjYXNlIHRoZSBESFNPTSBpcyBpbiBzdXNw
ZW5kIHN0YXRlIGFuZCBlaXRoZXIgcmVzZXQgYnV0dG9uIGlzIHB1c2hlZAo+PiBvciBJV0RHMiB0
cmlnZ2VycyBhIHdhdGNoZG9nIHJlc2V0LCB0aGVuIERSQU0gaW5pdGlhbGl6YXRpb24gY291bGQg
ZmFpbAo+PiBhcyBmb2xsb3dzOgo+Pgo+PiDCoMKgICIKPj4gwqDCoCBSQU06IEREUjNMIDMyYml0
cyAyeDRHYiA1MzNNSHoKPj4gwqDCoCBERFIgaW52YWxpZCBzaXplIDogMHg0LCBleHBlY3RlZCAw
eDQwMDAwMDAwCj4+IMKgwqAgRFJBTSBpbml0IGZhaWxlZDogLTIyCj4+IMKgwqAgIyMjIEVSUk9S
ICMjIyBQbGVhc2UgUkVTRVQgdGhlIGJvYXJkICMjIwo+PiDCoMKgICIKPj4KPj4gQXZvaWQgdGhp
cyBmYWlsdXJlIGJ5IG5vdCBrZWVwaW5nIGFueSBCdWNrIHJlZ3VsYXRvcnMgZW5hYmxlZCBkdXJp
bmcgCj4+IHJlc2V0LAo+PiBsZXQgdGhlIFNvQyBhbmQgRFJBTXMgcG93ZXIgY3ljbGUgZnVsbHku
IFNpbmNlIHRoZSBjaGFuZ2Ugd2hpY2gga2VlcHMgCj4+IEJ1Y2szCj4+IFZERCBlbmFibGVkIGR1
cmluZyByZXNldCBpcyBTVCBzcGVjaWZpYywgbW92ZSB0aGlzIGFkZGl0aW9uIHRvIFNUIAo+PiBz
cGVjaWZpYwo+PiBTUEwgYm9hcmQgaW5pdGlhbGl6YXRpb24gc28gdGhhdCBpdCB3b3VsZG4ndCBh
ZmZlY3QgdGhlIERIU09NIC4KPiAKPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4
QGRlbnguZGU+Cj4+IC0tLQo+PiBOT1RFOiBUaGlzIGlzIDIwMjMuMDcgbWF0ZXJpYWwKPj4gTk9U
RTogZDFhNGIwOWRlNjQgKCJib2FyZDogc3Q6IHN0cG1pYzE6IGFkZCBmdW5jdGlvbiBzdHBtaWMx
X2luaXQiKQo+PiDCoMKgwqDCoMKgwqAgbWVudGlvbnMgJ2tlZXAgdmRkIG9uIGR1cmluZyB0aGUg
cmVzZXQgY3ljbGUgKHRvIGF2b2lkIGlzc3VlCj4+IMKgwqDCoMKgwqDCoCB3aGVuIGJhY2t1cCBi
YXR0ZXJ5IGlzIGFic2VudCknLCBidXQgdGhlcmUgaXMgbm8gZnVydGhlcgo+PiDCoMKgwqDCoMKg
wqAgZGVzY3JpcHRpb24gb2YgdGhlICdpc3N1ZScuIENhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSA/
Cj4gCj4gCj4gCj4gSW4gdGhlIGNvbW1pdCBtZXNzYWdlIG9mIGQxYTRiMDlkZTY0MyAoImJvYXJk
OiBzdDogc3RwbWljMToKPiAKPiBhZGQgZnVuY3Rpb24gc3RwbWljMV9pbml0IiksIEkgaW5kaWNh
dGVkCj4gCj4gIMKgIC0ga2VlcCB2ZGQgb24gZHVyaW5nIHRoZSByZXNldCBjeWNsZSAodG8gYXZv
aWQgaXNzdWUgd2hlbiBiYWNrdXAgYmF0dGVyeQo+ICDCoMKgwqDCoMKgIGlzIGFic2VudCkKPiAK
PiAKPiBPbiBTVCBib2FyZHMgd2UgaGF2ZSBzdXBwb3J0IG9mIGNlbGwgY29pbiB0byBhbGxvdyBz
dXBwb3J0IG9mIGJhY2t1cCAKPiBkb21haW4sCj4gCj4gYnV0IGJ5IGRlZmF1bHQgdGhpcyBjZWxs
IGFyZSBhYnNlbnQgYW5kIHRoZSBiYWNrdXAgZG9tYWluIGlzIGRpcmVjdGx5IAo+IHBvd2VyZWQK
PiAKPiBieSBWREQgKGRpcmVjdGx5IGNvbm5lY3RlZCBieSByZXNpc3RvcikuCj4gCj4gCj4gV2Ug
a2VlcCBwb3dlcmVkIHRoaXMgZG9tYWluIHRvIGRvbid0IGxvc3MgdGhlIGJhY2t1cCBkb21haW4g
c3VwcG9ydCwKPiAKPiB0byBhdm9pZCB0byBsb3NzIHRoZSBpbmZvcm1hdGlvbiBzYXZlZCBpbiBi
YWNrdXAgUkFNIC8gcmVnaXN0ZXJzLAo+IAo+IGFuZCB0byBiZSBhYmJsZSB0byBrZWVwIERFQlVH
IHBhcnQgcG93ZXJlZCBhbHNvLgo+IAo+IAo+IE9uIHRoaXMgU1QgYm9hcmQsIGlmIHRoZSBWREQg
aXMgc2h1dCBkb3duIHdpdGggcmVzZXQsIHRoZSBiYWNrdXAgZG9tYWluIAo+IGNhbid0IGJlCj4g
Cj4gY29ycmVjdGx5IG1hbmFnZWQgZm9yIHJlYm9vdC4KPiAKPiAKPiBBbmQgdG8gaGFuZGxlIGNv
cnJlY3RseSBwb3dlciBPRkYgb24gU1QgYm9hcmRzIHdpdGggUE1JQywgd2Ugd2lsbCBkb24ndCAK
PiBzaHV0IGRvd24KPiAKPiB0aGUgVkREIChmdWxsIFBNSUMgc2h1dCBkb3duKSBidXQgd2Uga2Vl
cCBpdC4KPiAKPiAKPiBTbyB0aGUgYmFja3VwIGRvbWFpbiBpcyBsb29zZWQgb24gU1QgYm9hcmQg
d2l0aCBTVFBNSUMxIG9ubHkgd2hlbiB0aGUgcG93ZXIKPiAKPiBpcyByZW1vdmVkIGFuZCBub3Qg
Zm9yIHJlc2V0IG9yIGZvciBwb3dlciBvZmYuCgpUaGFuayB5b3UgZm9yIHRoZSBjbGFyaWZpY2F0
aW9uLgoKSSBzaG91bGQgY2hlY2sgc3VzcGVuZC9yZXN1bWUgb24gRVYxIHNvb24gLi4uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
