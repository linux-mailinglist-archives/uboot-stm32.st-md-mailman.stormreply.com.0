Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AEA5BF853
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Sep 2022 09:54:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA79BC0D2BF;
	Wed, 21 Sep 2022 07:54:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28C74C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 07:54:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6LJYQ020934;
 Wed, 21 Sep 2022 09:54:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bjJOPANytmOF/Ps7AM+TIki/BWQbbawy8FWIPDF99/0=;
 b=1yCwZcmdqWweDZ2V0ADCaOIG8QxeDUCge+pI2E4adtXwqCmd0n+Bn+1G881y9RViK48/
 IX0ENyPUze9mEZluJSHghlNnX7RZQ6Q6WSeXUHtZmaG23Z95MlNDqHv1MVveP3cXorC5
 4igbfc/MSOKMBdBETVMCsBvuvmFT/FxaWkWKKciwt7IjPmLyMYDJ+C5C5qZFAJWtcqva
 M/6EzjKTEdEemdM7mLs3shZPB7RxxgvYmQ4EJ+HKqFC8IM1ig/uEdeAYtkchSmUt62my
 HrL6Padf0AR8GDTX+Pr9ZLW9RlGQLxeH+srx6ZojwY2bN5ufBKZUdJYJxeEjwAOShlAm kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6ckrcf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Sep 2022 09:54:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 805BA10002A;
 Wed, 21 Sep 2022 09:54:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77723217B91;
 Wed, 21 Sep 2022 09:54:10 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.121) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 09:54:10 +0200
Message-ID: <2c0a62c9-ac6d-0507-206d-bb880dde60f7@foss.st.com>
Date: Wed, 21 Sep 2022 09:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220907134201.1.I8c8568a1dada00ca09ce1f3d5abaf38e6fdf66d5@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220907134201.1.I8c8568a1dada00ca09ce1f3d5abaf38e6fdf66d5@changeid>
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_04,2022-09-20_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32mp: alignment with v6.0-rc3
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

SGksCgpPbiA5LzcvMjIgMTM6NDIsIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4gRGV2aWNlIHRy
ZWUgYWxpZ25tZW50IHdpdGggTGludXgga2VybmVsIHY2LjAtcmMzOgo+IC0gQVJNOiBkdHM6IHN0
bTMyOiBhZGQgc3VwcG9ydCBmb3IgVVNCMjUxNEIgb25ib2FyZCBodWIgb24gc3RtMzJtcDE1eHgt
ZGt4Cj4gLSBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBSQ0MgcGlu
Cj4gLSBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBEQ01JIHBpbnMK
PiAtIEFSTTogZHRzOiBzdG0zMjogQWRkIGFsdGVybmF0ZSBwaW5tdXggZm9yIFNQSTIgcGlucwo+
IC0gQVJNOiBkdHM6IHN0bTMyOiBGaXggU1BJMiBwaW5tdXggcGluIGNvbW1lbnRzIG9uIHN0bTMy
bXAxNQo+IC0gQVJNOiBkdHM6IHN0bTMyOiBhZGQgb3B0ZWUgcmVzZXJ2ZWQgbWVtb3J5IG9uIHN0
bTMybXAxMzVmLWRrCj4gLSBBUk06IGR0czogc3RtMzI6IGVuYWJsZSBvcHRlZSBmaXJtd2FyZSBh
bmQgU0NNSSBzdXBwb3J0IG9uIFNUTTMyTVAxMwo+IC0gQVJNOiBkdHM6IHN0bTMyOiByZW1vdmUg
dGhlIElQQ0MgIndha2V1cCIgSVJRIG9uIHN0bTMybXAxNTEKPgo+IFNpZ25lZC1vZmYtYnk6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gLS0tCj4KPiAg
IGFyY2gvYXJtL2R0cy9zdG0zMm1wMTMtdS1ib290LmR0c2kgIHwgMTAgKysrLS0KPiAgIGFyY2gv
YXJtL2R0cy9zdG0zMm1wMTMxLmR0c2kgICAgICAgIHwgMjggKysrKysrLS0tLS0tLQo+ICAgYXJj
aC9hcm0vZHRzL3N0bTMybXAxMzVmLWRrLmR0cyAgICAgfCAgNCArLQo+ICAgYXJjaC9hcm0vZHRz
L3N0bTMybXAxNS1waW5jdHJsLmR0c2kgfCA2NCArKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LQo+ICAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTEuZHRzaSAgICAgICAgfCAgNyArKy0tCj4gICBh
cmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2kgICB8ICA4ICsrKysKPiAgIDYgZmlsZXMg
Y2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCj4KCi4uLgoKRm9yIGlu
Zm9ybWF0aW9uIHRoaXMgcGF0Y2ggY2F1c2UgYSB0cmFjZSBkdXJpbmcgYm9vdCBmb3IgYSBtaXNz
IAphbGlnbm1lbnQgb2YgdGhlIHNpemUgb2YgdGhlCgpyZXNlcnZlZCBtZW1vcnkgZm9yIE9QLVRF
RSBpbiB0aGUga2VybmVsIGRldmljZSB0cmVlKG5vdyAweDMwMDAwMDAgdG8gCnByZXBhcmUgdGhl
IHNlY3VyZSBVSSBzdXBwb3J0KQoKYW5kIHRoZSBub2RlIGFkZGVkIGR5bmFtaWNhbGx5IGJ5IE9Q
LVRFRSBpbiBtYXN0ZXIgYnJhbmNoICgweDIwMDAwMDApLCAKd2l0aCA6CgoKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxMzVmLWRrLmR0cyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1w
MTM1Zi1kay5kdHMKPiBpbmRleCBmNDM2ZmZhYjk5OC4uZTZiOGZmZDMzMmMgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxMzVmLWRrLmR0cwo+ICsrKyBiL2FyY2gvYXJtL2R0cy9z
dG0zMm1wMTM1Zi1kay5kdHMKPiBAQCAtMzEsOCArMzEsOCBAQAo+ICAgCQkjc2l6ZS1jZWxscyA9
IDwxPjsKPiAgIAkJcmFuZ2VzOwo+ICAgCj4gLQkJb3B0ZWVAZGUwMDAwMDAgewo+IC0JCQlyZWcg
PSA8MHhkZTAwMDAwMCAweDIwMDAwMDA+Owo+ICsJCW9wdGVlQGRkMDAwMDAwIHsKPiArCQkJcmVn
ID0gPDB4ZGQwMDAwMDAgMHgzMDAwMDAwPjsKPiAgIAkJCW5vLW1hcDsKPiAgIAkJfTsKPiAgIAl9
OwoKLi4uCgoKVGhlc2UgMiBkaWZmZXJlbnQgbWVtb3J5IG5vZGVzIGluIFUtQm9vdCBEVCBjYXVz
ZSBvdmVybGFwIGFuZCB0aGUgMiAKRVJST1IgdHJhY2VzIGZyb20gbG1iOgoKcmVzZXJ2aW5nIGZk
dCBtZW1vcnkgcmVnaW9uIGZhaWxlZCAoYWRkcj1kZDAwMDAwMCBzaXplPTMwMDAwMDAgZmxhZ3M9
NCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KVS1Cb290IDIwMjIuMTAtcmM0LTAwMDExLWczNTEzM2Vl
OWNhMCAoU2VwIDA3IDIwMjIgLSAxNDowNjo1MiArMDIwMCkKCkNQVTogU1RNMzJNUDEzNUMgUmV2
LloKTW9kZWw6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMTM1Ri1ESyBEaXNjb3ZlcnkgQm9h
cmQKQm9hcmQ6IHN0bTMybXAxIGluIHRydXN0ZWQgbW9kZSAoc3Qsc3RtMzJtcDEzNWYtZGspCkRS
QU06wqAgRVJST1I6IHJlc2VydmluZyBmZHQgbWVtb3J5IHJlZ2lvbiBmYWlsZWQgKGFkZHI9ZGQw
MDAwMDAgCnNpemU9MzAwMDAwMCBmbGFncz00KQo1MTIgTWlCCkVSUk9SOiByZXNlcnZpbmcgZmR0
IG1lbW9yeSByZWdpb24gZmFpbGVkIChhZGRyPWRkMDAwMDAwIHNpemU9MzAwMDAwMCAKZmxhZ3M9
NCkKQ29yZTrCoCA1MyBkZXZpY2VzLCAyMyB1Y2xhc3NlcywgZGV2aWNldHJlZTogYm9hcmQKTU1D
OsKgwqAgU1RNMzIgU0QvTU1DOiAwCkxvYWRpbmcgRW52aXJvbm1lbnQgZnJvbSBNTUMuLi4gT0sK
SW46wqDCoMKgIHNlcmlhbEA0MDAxMDAwMApPdXQ6wqDCoCBzZXJpYWxANDAwMTAwMDAKRXJyOsKg
wqAgc2VyaWFsQDQwMDEwMDAwCk5ldDrCoMKgIE5vIGV0aGVybmV0IGZvdW5kLgpIaXQgYW55IGtl
eSB0byBzdG9wIGF1dG9ib290OsKgIDAKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKVGhlIExNQiBkb24ndCBn
ZW5lcmF0ZSBlcnJvciB3aGVuIDIgcmVnaW9ucyBhcmUgaWRlbnRpY2FsIChzYW1lIGFkZHJlc3Mg
CmFuZCBzaXplKS4KCgpBIHBlbmRpbmcgT1AtVEVFIHBhdGNoIGFsbG93IHRvIGF2b2lkIHRoZSBV
LUJvb3QgZGV2aWNlIHRlZSBtb2RpZmljYXRpb24gCmFuZCByZW1vdmUgdGhpcyB0cmFjZToKCmh0
dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvcHVsbC81NTI3CgoKUmVnYXJkcwoKUGF0
cmljawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
