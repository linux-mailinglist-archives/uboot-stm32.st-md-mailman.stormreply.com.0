Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9422D2D3E
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Dec 2020 15:30:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B480C3FADB;
	Tue,  8 Dec 2020 14:30:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA129C3FADA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Dec 2020 14:30:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B8ES1kQ016810; Tue, 8 Dec 2020 15:30:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3HnWAqmMV721X1ChMXzpEWyMTAbPxo/Qv8YBroFddV4=;
 b=Wp4e2tRTB29GZaLdttDYAfNaH2XKneDrWSpJz03+HJ4ptub8h2WARl+Xy+AXMoSZ75QC
 ejqPDwwhceQpBaprRemi+E5ggdgbhLZi6iUaWAoqd6NVLsXGz+vls3fwMq/QRWVEvEia
 fR3ct8W0xIN3VL/ccCahtj9EQUAUHRAqNsmX5X6HDJa4whHqvgvEFzq4ecbeG6oSyJH3
 0i/huW6ofHWapWmECiCFvcI8gd2WznmSAgJQI9Pu5XLAWpwBqhuu0/Y04/X0iAHMX383
 hBzorROEIEAAfzVsRQJPf2a3ZgnzPIjheK65rp+Tgai09U0NGxMH0Jr9J7il7rTDQzgr EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3583n6991g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 15:30:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32B0710002A;
 Tue,  8 Dec 2020 15:30:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E0012AD2CC;
 Tue,  8 Dec 2020 15:30:46 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Dec
 2020 15:30:45 +0100
To: <smoch@web.de>, <u-boot@lists.denx.de>
References: <20201203091549.7031-1-patrick.delaunay@st.com>
 <9d8e34fa-cd69-f2ac-7d63-0b2da2e382f5@web.de>
 <f0bd0043f95b4364bde19d21902e09bd@SFHDAG2NODE3.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <27f75682-4527-ffeb-24d3-420e7ff3bd35@foss.st.com>
Date: Tue, 8 Dec 2020 15:30:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f0bd0043f95b4364bde19d21902e09bd@SFHDAG2NODE3.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Akshay Saraswat <akshay.s@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yannick FERTRE <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] FW: [PATCH 0/6] video: remove VIDCONSOLE_AS_LCD
 and VIDCONSOLE_AS_NAME
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

SGkgU29lcmVuLAoKPiBGcm9tOiBTb2VyZW4gTW9jaCA8c21vY2hAd2ViLmRlPiBTZW50OiBkaW1h
bmNoZSA2IGTDqWNlbWJyZSAyMDIwIDIwOjU5IAo+IE9uIDAzLjEyLjIwIDEwOjE1LCBQYXRyaWNr
IERlbGF1bmF5IHdyb3RlOgo+Cj4+IEkgcHJvcG9zZSB0aGlzIHNlcmllIHRvIHJlbW92ZSB0aGUg
dmlkY29uc29sZSB3b3JrLWFyb3VuZCwgYWN0aXZhdGVkIAo+PiB3aXRoIHRoZSAyIG9wdGlvbnMg
VklEQ09OU09MRV9BU19MQ0QgYW5kIFZJRENPTlNPTEVfQVNfTkFNRSBhbmQgCj4+IGNsZWFudXAg
dGhlIGFzc29jaWF0ZWQgY29kZSBpbiBjb25zb2xlLmMgKHVuZGVyICNpZmRlZiAKPj4gQ09ORklH
X1ZJRENPTlNPTEVfQVNfTENEKSBUaGlzIG9wdGlvbnMgYXJlIG5vdyBvYnNvbGV0ZSBhbmQgdGhl
eSB3YXMgCj4+IHBsYW5uZWQgdG8gYmUgcmVtb3ZlZCBhcm91bmQgdGhlIGVuZCBvZiAyMDIwLiBJ
IHByb3Bvc2UgdGhpcyBwYXRjaHNldCAKPj4gZm9yIHYyMDIxLjA0IGV2ZW4gaWYgSSBkb24ndCB0
ZXN0IHRoaXMgc2VyaWUgb24gcmVhbCBib2FyZHMuCj4+Cj4gSSByZWFsbHkgd291bGQgbGlrZSB0
byBrZWVwIHRoaXMgY29kZSBmb3Igbm93Lgo+CkkgcHJvcG9zZSB0byByZW1vdmUgdGhlc2Ugb3B0
aW9ucyBiZWNhdXNlIHRoZXkgYXJlIGluZGljYXRlZCBvYnNvbGV0ZSBpbiAKdGhlIGNvbmZpZyBk
ZXNjcmlwdGlvbgoKaW4gZHJpdmVycy92aWRlby9LY29uZmlnIChJIHNlZSBpdCBkdXJpbmcgY29k
ZSByZXZpZXcpOgoKIlRoaXMgb3B0aW9uIHdpbGwgYmUgcmVtb3ZlZCBhcm91bmQgdGhlIGVuZCBv
ZiAyMDIwIgoKQnV0IEkgaGF2ZSBubyBpc3N1ZSB0byBrZXB0IGl0LgoKPiBPbiB0aGUgdGJzMjkx
MCBib2FyZCB0aGlzIHdvcmthcm91bmQgd2FzIGludHJvZHVjZWQgaW4gdGhlIGxhc3QgdS1ib290
IAo+IHJlbGVhc2UgKHYyMDIwLjEwKSwgc28gdGhlcmUgd2FzIGFsbW9zdCBubyB0aW1lIGZvciBl
bmQgdXNlcnMgdG8gCj4gbm90aWNlIHRoZSB3YXJuaW5nIGFuZCB0byB1cGRhdGUgdGhlcmUgZW52
aXJvbm1lbnQuIE5vdCBldmVyeSBlbmQgdXNlciAKPiBpbnN0YWxscyBldmVyeSBuZXcgdS1ib290
IHJlbGVhc2UsIHNvIHdlIHJlYWxseSBzaG91bGQgZ2l2ZSBtb3JlIHRpbWUgCj4gZm9yIHRoaXMg
Y2hhbmdlLgo+CkkgYWdyZWUgdGhhdCBmb3IgeW91ciBwcm9qZWN0LCB3aXRoIG1pZ3JhdGlvbiB0
byBETV9WSURFTyBpdCBpcyBhIHJlYWxseSAKc2hvcnQgbm90aWNlLgoKIMKgwqDCoCBjb21taXQg
NjQ1ZDM5YWVhMzY3MDY0ODY4ZGNkZDMwYzQxMTgwNmY0NDAzYjY3YgoKIMKgwqDCoCBib2FyZDog
dGJzMjkxMDogRml4IHZpZGVvIG91dHB1dCB3aXRoIGV4aXN0aW5nIGVudmlyb25tZW50cwoKPT4g
b25seSBpbnRlZ3JhdGVkIGluIHYyMDIwLjEwLXJjMiwgc29ycnkgdG8gbWlzcyBpdAoKPiBUaGlz
IHdvcmthcm91bmQgaXMgc2VsZi1jb250YWluZWQsIHNtYWxsLCBlYXN5IHRvIG1haW50YWluLCBh
bmQgCj4gc3RyaWN0bHkgb3B0LWluLiBTbyB0aGlzIHdvcmthcm91bmQgaHVydHMgbm9ib2R5LCBi
dXQgcmVtb3ZpbmcgdGhpcyAKPiB3aWxsIGxldCB1c2VycyBhbG9uZSB3aXRob3V0IGFueSBIRE1J
IG91dHB1dC4gU28gb24gdGhpcyBib2FyZCAKPiAod2l0aG91dCBpbmNsdWRlZCBzZXJpYWwgY29u
c29sZSBwb3J0KSwgdGhpcyB3aWxsIHJlc3VsdCBpbiB1bmhhcHB5IAo+IHVzZXJzLCBlc3BlY2lh
bGx5IHNpbmNlIHdpdGhvdXQgYW55IGNvbnNvbGUgb3V0cHV0IHRoZXJlIGlzIG5vIGNoYW5jZSAK
PiB0byBnZXQgYW55IGlkZWEgd2hhdCBpcyBnb2luZyB3cm9uZy4KPgpJbml0aWFsbHksIEkgcHJv
cG9zZWQgdGhpcyBwYXRjaCB0byBjbGVhbnVwIHRoZSBjb25zb2xlLmMgY29kZSB3aXRoIDIgCm90
aGVyIHNlcmllczoKCjEpIGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290
L2xpc3QvP3Nlcmllcz0yMTgzMDkKCiDCoMKgwqAgImNvbnNvbGU6IHJlbW92ZSAjaWZkZWYgQ09O
RklHIHdoZW4gaXQgaXMgcG9zc2libGUiCgoyKSBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC91Ym9vdC9saXN0Lz9zZXJpZXM9MjE4MDg5CgogwqDCoMKgICJjb25zb2xlOiBjb3Nt
ZXRpY3M6IHJlbW92ZSAjaWYgMCIKCgpBbmQgSSBqdXN0IHdhbnQganVzdCB0byByZW1vdmUgdGhl
IHJlbWFpbmluZyAiI2lmZGVmIENPTkZJR18uLi4uIsKgIGluIApjb25zb2xlLmMKCgpCdXQgSSBh
Z3JlZSB0aGF0IEkgbmVlZCB0byBjaGFuZ2UgbXkgcHJvcG9zYWwgdG8gcmVtb3ZlIHRoaXMgd29y
a2Fyb3VuZCBjb2RlCgooaXQgaXMgb25seSB1c2UgdG8gaGVscCB0aGUgRE0gVklERU8gbWlncmF0
aW9uIGZvciBleGlzdGluZyBib2FyZCkKCmFuZCBjaGFuZ2UgdGhlIHJlbGVhc2UgdGFyZ2V0LgoK
CkkgcHJvcG9zZSB0byA6CgotIHJlbW92ZSBwYXRjaCAxLzYgb2YgdGhlIHNlcmllIGZvciB5b3Vy
IGJvYXJkCgotIG5vIG1vcmUgcmVtb3ZlIHRoZSBvcHRpb25zIGluIDYvNiBidXQgYWRkIHdhcm5p
bmcgaW4gTWFrZWZpbGUgd2hlbiB0aGUgCm9wdGlvbiBpcyBhY3RpdmF0ZWQKCiDCoCBhbmQgY2hh
bmdlIHRhcmdldCBpbiBjb25maWcgZGVzY2lwdGlvbgoKCmlmZXEgKCQoQ09ORklHX1ZJRENPTlNP
TEVfQVNfTENEKSx5KQogwqDCoMKgIEBlY2hvID4mMiAiPT09PT09PT09PT09PT09PT09PT09IFdB
Uk5JTkcgPT09PT09PT09PT09PT09PT09PT09PSIKIMKgwqDCoCBAZWNobyA+JjIgIlRoaXMgYm9h
cmQgZG9lcyB1c2UgQ09ORklHX1ZJRENPTlNPTEVfQVNfTENEIHdvcmthcm91bmQuIgogwqDCoMKg
IEBlY2hvID4mMiAiUGxlYXNlIHVwZGF0ZSB0aGUgZXhpc3RpbmcgdXNlciBkZWZpbmVkIGVudmly
b25tZW50cyAKYmVmb3JlICIKIMKgwqDCoCBAZWNobyA+JjIgInYyMDIyLjAxIHJlbGVhc2UuIgog
wqDCoMKgIEBlY2hvID4mMiAiRmFpbHVyZSB0byB1cGRhdGUgYnkgdGhlIGRlYWRsaW5lIG1heSBy
ZXN1bHQgaW4gdmlkZW8gCmNvbnNvbGUiCgpAZWNobyA+JjIgImlzc3VlIHdoZW4gdGhpcyB3b2Fy
a2Fyb3VuZCB3aWxsIGJlIHJlbW92ZWQuIgogwqDCoMKgIEBlY2hvID4mMiAiPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSIKZW5kaWYKCj0+IG9wZW4g
cG9pbnQ6IHdoaWNoIGFjY2VwdGFibGUgdGFyZ2V0IHRvIHJlbW92ZSB0aGlzIGZlYXR1cmUgPyB2
MjAyMi4wMSA/CgpBbnl3YXksIGlmIHRoZSB0aGUgbWFpbnRhaW5lcnMgKHZpZGVvIG9yIGNvbnNv
bGUpIHRoaW5rIHRoaXMgY29kZSBzaG91bGQgCmJlIGtlcHQsIEkgY2FuIGFsc28gZHJvcCB0aGlz
IHNlcmllLgoKVGhhbmtzLgoKUGF0cmljawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
