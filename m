Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 683385E7A9B
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Sep 2022 14:24:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04F12C0D2C2;
	Fri, 23 Sep 2022 12:24:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E556C0D2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 12:24:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NAAgPD018175;
 Fri, 23 Sep 2022 14:24:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=z1xn/AWKlZ8cjXSK2Sic4/pRD2Or9Y0zP74H1YxSCPo=;
 b=OfmiakFMNkh47gTfo+AJsu50QUo/i2ousZJuj43R8r3Kp9UD6M0SvASe67gYfa1k/MQs
 R7VSSR5fPOdUX3EUYecbc/YPhASYVFvRFQAqN3kjVP2Ikphmd3hKEo2EXwEhzCeiDRaK
 VQ82qe4OOefwMfRrVZbLOveJgresiJ5yC9z0yxmwhJiQhveXnHGgoMbkV4P1ihbEYHOY
 Zr0B8MvtkHWpuNnD2NOGA3A1+zaai0TN4+nLF3y8OsqCHsA36zkeNbd2VIJDMaX4/35m
 +qUcDIRX4ydp6oAruvbO7lHcJpiPpkpJ6Vot9Ly7K3R3AU+uZoyWcVRKv779TKcYvH6Q DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jr11xfjng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 14:24:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D67E210002A;
 Fri, 23 Sep 2022 14:24:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB5F62291A7;
 Fri, 23 Sep 2022 14:24:03 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 14:24:03 +0200
Message-ID: <c199fe8a-deec-5989-44f6-2464d1b456b4@foss.st.com>
Date: Fri, 23 Sep 2022 14:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220907134201.1.I8c8568a1dada00ca09ce1f3d5abaf38e6fdf66d5@changeid>
 <2c0a62c9-ac6d-0507-206d-bb880dde60f7@foss.st.com>
 <d8716f33-5f24-20ad-c763-0241a202f919@foss.st.com>
In-Reply-To: <d8716f33-5f24-20ad-c763-0241a202f919@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_04,2022-09-22_02,2022-06-22_01
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUGF0cmljawoKT24gOS8yMy8yMiAxMzozNywgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IEhp
IFBhdHJpY2sKPiAKPiBPbiA5LzIxLzIyIDA5OjUzLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+
PiBIaSwKPj4KPj4gT24gOS83LzIyIDEzOjQyLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4g
RGV2aWNlIHRyZWUgYWxpZ25tZW50IHdpdGggTGludXgga2VybmVsIHY2LjAtcmMzOgo+Pj4gLSBB
Uk06IGR0czogc3RtMzI6IGFkZCBzdXBwb3J0IGZvciBVU0IyNTE0QiBvbmJvYXJkIGh1YiBvbiBz
dG0zMm1wMTV4eC1ka3gKPj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11
eCBmb3IgUkNDIHBpbgo+Pj4gLSBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4
IGZvciBEQ01JIHBpbnMKPj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11
eCBmb3IgU1BJMiBwaW5zCj4+PiAtIEFSTTogZHRzOiBzdG0zMjogRml4IFNQSTIgcGlubXV4IHBp
biBjb21tZW50cyBvbiBzdG0zMm1wMTUKPj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBhZGQgb3B0ZWUg
cmVzZXJ2ZWQgbWVtb3J5IG9uIHN0bTMybXAxMzVmLWRrCj4+PiAtIEFSTTogZHRzOiBzdG0zMjog
ZW5hYmxlIG9wdGVlIGZpcm13YXJlIGFuZCBTQ01JIHN1cHBvcnQgb24gU1RNMzJNUDEzCj4+PiAt
IEFSTTogZHRzOiBzdG0zMjogcmVtb3ZlIHRoZSBJUENDICJ3YWtldXAiIElSUSBvbiBzdG0zMm1w
MTUxCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBmb3NzLnN0LmNvbT4KPj4+IC0tLQo+Pj4KPj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1w
MTMtdS1ib290LmR0c2nCoCB8IDEwICsrKy0tCj4+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDEz
MS5kdHNpwqDCoMKgwqDCoMKgwqAgfCAyOCArKysrKystLS0tLS0tCj4+PiDCoCBhcmNoL2FybS9k
dHMvc3RtMzJtcDEzNWYtZGsuZHRzwqDCoMKgwqAgfMKgIDQgKy0KPj4+IMKgIGFyY2gvYXJtL2R0
cy9zdG0zMm1wMTUtcGluY3RybC5kdHNpIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0KPj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTUxLmR0c2nCoMKgwqDCoMKgwqDCoCB8wqAg
NyArKy0tCj4+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2nCoMKgIHzCoCA4
ICsrKysKPj4+IMKgIDYgZmlsZXMgY2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRp
b25zKC0pCj4+Pgo+Pgo+PiAuLi4KPj4KPj4gRm9yIGluZm9ybWF0aW9uIHRoaXMgcGF0Y2ggY2F1
c2UgYSB0cmFjZSBkdXJpbmcgYm9vdCBmb3IgYSBtaXNzIGFsaWdubWVudCBvZiB0aGUgc2l6ZSBv
ZiB0aGUKPj4KPj4gcmVzZXJ2ZWQgbWVtb3J5IGZvciBPUC1URUUgaW4gdGhlIGtlcm5lbCBkZXZp
Y2UgdHJlZShub3cgMHgzMDAwMDAwIHRvIHByZXBhcmUgdGhlIHNlY3VyZSBVSSBzdXBwb3J0KQo+
Pgo+PiBhbmQgdGhlIG5vZGUgYWRkZWQgZHluYW1pY2FsbHkgYnkgT1AtVEVFIGluIG1hc3RlciBi
cmFuY2ggKDB4MjAwMDAwMCksIHdpdGggOgo+Pgo+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDEzNWYtZGsuZHRz
Cj4+PiBpbmRleCBmNDM2ZmZhYjk5OC4uZTZiOGZmZDMzMmMgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNo
L2FybS9kdHMvc3RtMzJtcDEzNWYtZGsuZHRzCj4+PiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJt
cDEzNWYtZGsuZHRzCj4+PiBAQCAtMzEsOCArMzEsOCBAQAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
ICNzaXplLWNlbGxzID0gPDE+Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJhbmdlczsKPj4+IMKg
IC3CoMKgwqDCoMKgwqDCoCBvcHRlZUBkZTAwMDAwMCB7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWcgPSA8MHhkZTAwMDAwMCAweDIwMDAwMDA+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIG9w
dGVlQGRkMDAwMDAwIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweGRkMDAw
MDAwIDB4MzAwMDAwMD47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuby1tYXA7Cj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+IMKgwqDCoMKgwqAgfTsKPj4KPj4gLi4uCj4+Cj4+
Cj4+IFRoZXNlIDIgZGlmZmVyZW50IG1lbW9yeSBub2RlcyBpbiBVLUJvb3QgRFQgY2F1c2Ugb3Zl
cmxhcCBhbmQgdGhlIDIgRVJST1IgdHJhY2VzIGZyb20gbG1iOgo+Pgo+PiByZXNlcnZpbmcgZmR0
IG1lbW9yeSByZWdpb24gZmFpbGVkIChhZGRyPWRkMDAwMDAwIHNpemU9MzAwMDAwMCBmbGFncz00
KQo+Pgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IFUtQm9vdCAyMDIyLjEwLXJjNC0wMDAxMS1n
MzUxMzNlZTljYTAgKFNlcCAwNyAyMDIyIC0gMTQ6MDY6NTIgKzAyMDApCj4+Cj4+IENQVTogU1RN
MzJNUDEzNUMgUmV2LloKPj4gTW9kZWw6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMTM1Ri1E
SyBEaXNjb3ZlcnkgQm9hcmQKPj4gQm9hcmQ6IHN0bTMybXAxIGluIHRydXN0ZWQgbW9kZSAoc3Qs
c3RtMzJtcDEzNWYtZGspCj4+IERSQU06wqAgRVJST1I6IHJlc2VydmluZyBmZHQgbWVtb3J5IHJl
Z2lvbiBmYWlsZWQgKGFkZHI9ZGQwMDAwMDAgc2l6ZT0zMDAwMDAwIGZsYWdzPTQpCj4+IDUxMiBN
aUIKPj4gRVJST1I6IHJlc2VydmluZyBmZHQgbWVtb3J5IHJlZ2lvbiBmYWlsZWQgKGFkZHI9ZGQw
MDAwMDAgc2l6ZT0zMDAwMDAwIGZsYWdzPTQpCj4+IENvcmU6wqAgNTMgZGV2aWNlcywgMjMgdWNs
YXNzZXMsIGRldmljZXRyZWU6IGJvYXJkCj4+IE1NQzrCoMKgIFNUTTMyIFNEL01NQzogMAo+PiBM
b2FkaW5nIEVudmlyb25tZW50IGZyb20gTU1DLi4uIE9LCj4+IEluOsKgwqDCoCBzZXJpYWxANDAw
MTAwMDAKPj4gT3V0OsKgwqAgc2VyaWFsQDQwMDEwMDAwCj4+IEVycjrCoMKgIHNlcmlhbEA0MDAx
MDAwMAo+PiBOZXQ6wqDCoCBObyBldGhlcm5ldCBmb3VuZC4KPj4gSGl0IGFueSBrZXkgdG8gc3Rv
cCBhdXRvYm9vdDrCoCAwCj4+Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pgo+PiBUaGUgTE1CIGRvbid0
IGdlbmVyYXRlIGVycm9yIHdoZW4gMiByZWdpb25zIGFyZSBpZGVudGljYWwgKHNhbWUgYWRkcmVz
cyBhbmQgc2l6ZSkuCj4+Cj4+Cj4+IEEgcGVuZGluZyBPUC1URUUgcGF0Y2ggYWxsb3cgdG8gYXZv
aWQgdGhlIFUtQm9vdCBkZXZpY2UgdGVlIG1vZGlmaWNhdGlvbiBhbmQgcmVtb3ZlIHRoaXMgdHJh
Y2U6Cj4+Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvcHVsbC81NTI3Cj4+
Cj4+Cj4+IFJlZ2FyZHMKPj4KPj4gUGF0cmljawo+Pgo+Pgo+IFJldmlld2VkLWJ5OiBQYXRyaWNl
IENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRy
aWNlCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBV
Ym9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKPiBVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCj4gaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vdWJvb3Qtc3RtMzIKCmFwcGxpZWQgb24gdS1ib290LXN0bTMyL25leHQKClRoYW5r
cwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL3Vib290LXN0bTMyCg==
