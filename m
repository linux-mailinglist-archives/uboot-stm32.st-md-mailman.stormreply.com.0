Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C05E79B7
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Sep 2022 13:37:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43577C03FE0;
	Fri, 23 Sep 2022 11:37:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71C5CC03FD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 11:37:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NADpBt018740;
 Fri, 23 Sep 2022 13:37:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=38PYPfo4Zuhu3GWhdt6m45rLRFcW1TWuMZaOLtm3c/o=;
 b=lLr2nFu5SVP/GoJx8ElWAYGSuVV1ZnVue/0JrHMLRitPndtch9HMF15mbpEuQ4f3Q10G
 DUr/QGZziG6VAy1dJZnc09bubpUby1jMOa0/yOUlBydiOvNzQchZCKgNLTt+LIqt8pRD
 vm37JCCdLpP9sjZn6H/hNOyDJEdgZ0VV/j35ynLsUP4WN14lg1/Cs1hq15vl1K0apEAe
 u1HleqxkFJeBkvzmpJkymnzELLlCfQwAB7aQz6bSLY40kLBK8jpP9a4LDZ3b8cTYiG6j
 fYJ8Ay0kSmx4KlEvssQuCz5g/nrdLmjCgR4TdcjEyIyj9q5/Uwcxuh3IR2Ph3A/oR3ZK pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jr11xfb9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 13:37:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0401310002A;
 Fri, 23 Sep 2022 13:37:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E67DF226FC7;
 Fri, 23 Sep 2022 13:37:24 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 13:37:24 +0200
Message-ID: <d8716f33-5f24-20ad-c763-0241a202f919@foss.st.com>
Date: Fri, 23 Sep 2022 13:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220907134201.1.I8c8568a1dada00ca09ce1f3d5abaf38e6fdf66d5@changeid>
 <2c0a62c9-ac6d-0507-206d-bb880dde60f7@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <2c0a62c9-ac6d-0507-206d-bb880dde60f7@foss.st.com>
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

SGkgUGF0cmljawoKT24gOS8yMS8yMiAwOTo1MywgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBI
aSwKPiAKPiBPbiA5LzcvMjIgMTM6NDIsIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+IERldmlj
ZSB0cmVlIGFsaWdubWVudCB3aXRoIExpbnV4IGtlcm5lbCB2Ni4wLXJjMzoKPj4gLSBBUk06IGR0
czogc3RtMzI6IGFkZCBzdXBwb3J0IGZvciBVU0IyNTE0QiBvbmJvYXJkIGh1YiBvbiBzdG0zMm1w
MTV4eC1ka3gKPj4gLSBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBS
Q0MgcGluCj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgRENN
SSBwaW5zCj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgU1BJ
MiBwaW5zCj4+IC0gQVJNOiBkdHM6IHN0bTMyOiBGaXggU1BJMiBwaW5tdXggcGluIGNvbW1lbnRz
IG9uIHN0bTMybXAxNQo+PiAtIEFSTTogZHRzOiBzdG0zMjogYWRkIG9wdGVlIHJlc2VydmVkIG1l
bW9yeSBvbiBzdG0zMm1wMTM1Zi1kawo+PiAtIEFSTTogZHRzOiBzdG0zMjogZW5hYmxlIG9wdGVl
IGZpcm13YXJlIGFuZCBTQ01JIHN1cHBvcnQgb24gU1RNMzJNUDEzCj4+IC0gQVJNOiBkdHM6IHN0
bTMyOiByZW1vdmUgdGhlIElQQ0MgIndha2V1cCIgSVJRIG9uIHN0bTMybXAxNTEKPj4KPj4gU2ln
bmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNv
bT4KPj4gLS0tCj4+Cj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTMtdS1ib290LmR0c2nCoCB8
IDEwICsrKy0tCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTMxLmR0c2nCoMKgwqDCoMKgwqDC
oCB8IDI4ICsrKysrKy0tLS0tLS0KPj4gwqAgYXJjaC9hcm0vZHRzL3N0bTMybXAxMzVmLWRrLmR0
c8KgwqDCoMKgIHzCoCA0ICstCj4+IMKgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTUtcGluY3RybC5k
dHNpIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPj4gwqAgYXJjaC9hcm0vZHRz
L3N0bTMybXAxNTEuZHRzacKgwqDCoMKgwqDCoMKgIHzCoCA3ICsrLS0KPj4gwqAgYXJjaC9hcm0v
ZHRzL3N0bTMybXAxNXh4LWRreC5kdHNpwqDCoCB8wqAgOCArKysrCj4+IMKgIDYgZmlsZXMgY2hh
bmdlZCwgOTEgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCj4+Cj4gCj4gLi4uCj4gCj4g
Rm9yIGluZm9ybWF0aW9uIHRoaXMgcGF0Y2ggY2F1c2UgYSB0cmFjZSBkdXJpbmcgYm9vdCBmb3Ig
YSBtaXNzIGFsaWdubWVudCBvZiB0aGUgc2l6ZSBvZiB0aGUKPiAKPiByZXNlcnZlZCBtZW1vcnkg
Zm9yIE9QLVRFRSBpbiB0aGUga2VybmVsIGRldmljZSB0cmVlKG5vdyAweDMwMDAwMDAgdG8gcHJl
cGFyZSB0aGUgc2VjdXJlIFVJIHN1cHBvcnQpCj4gCj4gYW5kIHRoZSBub2RlIGFkZGVkIGR5bmFt
aWNhbGx5IGJ5IE9QLVRFRSBpbiBtYXN0ZXIgYnJhbmNoICgweDIwMDAwMDApLCB3aXRoIDoKPiAK
PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTM1Zi1kay5kdHMgYi9hcmNo
L2FybS9kdHMvc3RtMzJtcDEzNWYtZGsuZHRzCj4+IGluZGV4IGY0MzZmZmFiOTk4Li5lNmI4ZmZk
MzMyYyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vZHRzL3N0bTMybXAxMzVmLWRrLmR0cwo+PiAr
KysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDEzNWYtZGsuZHRzCj4+IEBAIC0zMSw4ICszMSw4IEBA
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwxPjsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJhbmdlczsKPj4gwqAgLcKgwqDCoMKgwqDCoMKgIG9wdGVlQGRlMDAwMDAwIHsKPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4ZGUwMDAwMDAgMHgyMDAwMDAwPjsKPj4g
K8KgwqDCoMKgwqDCoMKgIG9wdGVlQGRkMDAwMDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVnID0gPDB4ZGQwMDAwMDAgMHgzMDAwMDAwPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbm8tbWFwOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gwqDCoMKgwqDCoCB9Owo+
IAo+IC4uLgo+IAo+IAo+IFRoZXNlIDIgZGlmZmVyZW50IG1lbW9yeSBub2RlcyBpbiBVLUJvb3Qg
RFQgY2F1c2Ugb3ZlcmxhcCBhbmQgdGhlIDIgRVJST1IgdHJhY2VzIGZyb20gbG1iOgo+IAo+IHJl
c2VydmluZyBmZHQgbWVtb3J5IHJlZ2lvbiBmYWlsZWQgKGFkZHI9ZGQwMDAwMDAgc2l6ZT0zMDAw
MDAwIGZsYWdzPTQpCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFUtQm9vdCAyMDIyLjEwLXJj
NC0wMDAxMS1nMzUxMzNlZTljYTAgKFNlcCAwNyAyMDIyIC0gMTQ6MDY6NTIgKzAyMDApCj4gCj4g
Q1BVOiBTVE0zMk1QMTM1QyBSZXYuWgo+IE1vZGVsOiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzJN
UDEzNUYtREsgRGlzY292ZXJ5IEJvYXJkCj4gQm9hcmQ6IHN0bTMybXAxIGluIHRydXN0ZWQgbW9k
ZSAoc3Qsc3RtMzJtcDEzNWYtZGspCj4gRFJBTTrCoCBFUlJPUjogcmVzZXJ2aW5nIGZkdCBtZW1v
cnkgcmVnaW9uIGZhaWxlZCAoYWRkcj1kZDAwMDAwMCBzaXplPTMwMDAwMDAgZmxhZ3M9NCkKPiA1
MTIgTWlCCj4gRVJST1I6IHJlc2VydmluZyBmZHQgbWVtb3J5IHJlZ2lvbiBmYWlsZWQgKGFkZHI9
ZGQwMDAwMDAgc2l6ZT0zMDAwMDAwIGZsYWdzPTQpCj4gQ29yZTrCoCA1MyBkZXZpY2VzLCAyMyB1
Y2xhc3NlcywgZGV2aWNldHJlZTogYm9hcmQKPiBNTUM6wqDCoCBTVE0zMiBTRC9NTUM6IDAKPiBM
b2FkaW5nIEVudmlyb25tZW50IGZyb20gTU1DLi4uIE9LCj4gSW46wqDCoMKgIHNlcmlhbEA0MDAx
MDAwMAo+IE91dDrCoMKgIHNlcmlhbEA0MDAxMDAwMAo+IEVycjrCoMKgIHNlcmlhbEA0MDAxMDAw
MAo+IE5ldDrCoMKgIE5vIGV0aGVybmV0IGZvdW5kLgo+IEhpdCBhbnkga2V5IHRvIHN0b3AgYXV0
b2Jvb3Q6wqAgMAo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IFRoZSBMTUIgZG9uJ3QgZ2VuZXJh
dGUgZXJyb3Igd2hlbiAyIHJlZ2lvbnMgYXJlIGlkZW50aWNhbCAoc2FtZSBhZGRyZXNzIGFuZCBz
aXplKS4KPiAKPiAKPiBBIHBlbmRpbmcgT1AtVEVFIHBhdGNoIGFsbG93IHRvIGF2b2lkIHRoZSBV
LUJvb3QgZGV2aWNlIHRlZSBtb2RpZmljYXRpb24gYW5kIHJlbW92ZSB0aGlzIHRyYWNlOgo+IAo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvcHVsbC81NTI3Cj4gCj4gCj4gUmVn
YXJkcwo+IAo+IFBhdHJpY2sKPiAKPiAKUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0
ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
