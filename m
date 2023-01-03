Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5974265C398
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 17:11:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ED9CC65048;
	Tue,  3 Jan 2023 16:11:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9F15C64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 16:11:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303FbHpg021161; Tue, 3 Jan 2023 17:10:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=G5Fndgd/TkRJUMUtP93AWBNhdCY98+PWoSbtxOaNFas=;
 b=p3b9awgbuGpMGl9RMh3Ffcds1PqkOwL1ofxukuNvWRGBvwC++YibdqHidKGzUYUonNzk
 rep2PyMIZGFsLAExM9jUzasus17gs+iDppM7K3w3fiKJWWyAW+jKxC13Qg3DgjbT8T2l
 Yt7OAeIGCgswNBOBgtO75vz0ZsUYa3EPhQvQS+SEB6lBPfx8kawW7NU6+3w+pwWyn2cp
 CwJKoB/pVhgAIhobckg16sYwYtfvFFJrPiAYnw4qK5Mrlgy1nDP4NbqNEceSuTuEVA4/
 tLXF8rzl5XV+fZFi7CUfpQuMuIUZU9QbMoWJr8hohGVRBCuqhIqnvbH6E+oEs+bFu6mo 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtb3e63fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 17:10:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D64510002A;
 Tue,  3 Jan 2023 17:10:54 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70BD4229A86;
 Tue,  3 Jan 2023 17:10:54 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 17:10:53 +0100
Message-ID: <71bbd180-331f-8d7a-46a4-7bfe6703a3eb@foss.st.com>
Date: Tue, 3 Jan 2023 17:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 <neil.armstrong@linaro.org>, <u-boot@lists.denx.de>
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <b7e891d1-d134-b489-eb2d-6125d4c7b6c6@theobroma-systems.com>
 <5f67e057-c41a-d4a0-b199-5840ae771e35@linaro.org>
 <f0dd213c-4a34-926d-3f3b-f2ed49bb92c3@linaro.org>
 <5ce0e4ad-b015-3487-614c-a60099dbede9@foss.st.com>
 <9f0641d9-b5f6-ed05-1563-ae96ca873052@linaro.org>
 <90a47202-6f6b-e8e7-521c-9df6a5730a5b@theobroma-systems.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <90a47202-6f6b-e8e7-521c-9df6a5730a5b@theobroma-systems.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_05,2023-01-03_02,2022-06-22_01
Cc: Edoardo Tomelleri <e.tomell@gmail.com>, Peter Hoyes <Peter.Hoyes@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Zhang Ning <zhangn1985@qq.com>, Zhaofeng Li <hello@zhaofeng.li>,
 Ramon Fried <rfried.dev@gmail.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 0/3] cmd: pxe: support INITRD and FDT
	selection with FIT
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

Ck9uIDEyLzEzLzIyIDE1OjQ4LCBRdWVudGluIFNjaHVseiB3cm90ZToKPiBIaSBQYXRyaWNrLAo+
Cj4gT24gMTIvMTMvMjIgMTU6MzQsIG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGU6Cj4+
IE9uIDEzLzEyLzIwMjIgMTU6MzEsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4+PiBIaSwKPj4+
Cj4+PiBPbiAxMS8yMi8yMiAyMDo0MywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4gT24gMjIv
MTEvMjAyMiAyMDoxMSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+
PiBPbiAyMS8xMS8yMDIyIDEzOjIzLCBRdWVudGluIFNjaHVseiB3cm90ZToKPj4+Pj4+IEhpIFBh
dHJpY2ssCj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzIGZvciBsb29raW5nIGF0IGl0Lgo+Pj4+Pj4KPj4+
Pj4+IE9uIDEwLzI4LzIyIDExOjAxLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4+Pj4+Cj4+
Pj4+Pj4gU2luY2UgdGhlIGNvbW1pdCBkNWJhNjE4OGRmYmYgKCJjbWQ6IHB4ZV91dGlsczogQ2hl
Y2sgCj4+Pj4+Pj4gZmR0Y29udHJvbGFkZHIKPj4+Pj4+PiBpbiBsYWJlbF9ib290IikgdGhlIEZE
VCBvciB0aGUgRkRURElSIGxhYmVsIGlzIHJlcXVpcmVkIGluIAo+Pj4+Pj4+IGV4dGxpbnV4LmNv
bmYKPj4+Pj4+PiBhbmQgdGhlIGZhbGxiYWNrIGRvbmUgYnkgYm9vdG0gY29tbWFuZCB3aGVuIG9u
bHkgdGhlIGRldmljZSB0cmVlIAo+Pj4+Pj4+IGlzIHByZXNlbnQKPj4+Pj4+PiBpbiB0aGlzIGNv
bW1hbmQgcGFyYW1ldGVycyBpcyBubyBtb3JlIHBlcmZvcm1lZCB3aGVuIEZJVCBpcyB1c2VkIAo+
Pj4+Pj4+IGZvcgo+Pj4+Pj4+IGtlcm5lbC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoZSBuZXh0IGZpbGUg
ImV4dGxpbnV4LmNvbmYiIG5vIG1vcmUgc2VsZWN0cyB0aGUgZGV2aWNlIHRyZWUgaW4gCj4+Pj4+
Pj4gRklUCj4+Pj4+Pj4gYnV0IHVzZSB0aGUgcHhlIGZhbGxiYWNrIHdpdGggdGhlIGRldmljZSB0
cmVlIG9mIFUtQm9vdC4KPj4+Pj4+Pgo+Pj4+Pj4+IG1lbnUgdGl0bGUgU2VsZWN0IHRoZSBib290
IG1vZGUKPj4+Pj4+PiBERUZBVUxUIHRlc3QKPj4+Pj4+PiBMQUJFTCB0ZXN0Cj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBLRVJORUwgL2ZpdEltYWdlCj4+Pj4+Pj4KPj4+Pj4+PiBUaGlzIHNlcmll
IHJlc3RvcmVzIHRoZSBwb3NzaWJpbGl0eSB0byB1c2UgYSBGSVQgaW4gZXh0bGludXguY29uZgo+
Pj4+Pj4+IGJ5IHVzaW5nIEZEVCBsYWJlbCB3aXRoIHRoZSBzYW1lIHN0cmluZy4KPj4+Pj4+Pgo+
Pj4+Pj4+IG1lbnUgdGl0bGUgU2VsZWN0IHRoZSBib290IG1vZGUKPj4+Pj4+PiBERUZBVUxUIHRl
c3QKPj4+Pj4+PiBMQUJFTCB0ZXN0Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBLRVJORUwgL2Zp
dEltYWdlCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBGRFQgL2ZpdEltYWdlCj4+Pj4+Pj4KPj4+
Pj4+PiBldmVuIHdoZW4gYSBzcGVjaWZpYyBGSVQgY29uZmlnIGlzIHVzZWQ6Cj4+Pj4+Pj4KPj4+
Pj4+PiBtZW51IHRpdGxlIFNlbGVjdCB0aGUgYm9vdCBtb2RlCj4+Pj4+Pj4gREVGQVVMVCB0ZXN0
Cj4+Pj4+Pj4gTEFCRUwgdGVzdAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgS0VSTkVMIC9maXRJ
bWFnZSNjb25maWcKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIEZEVCAvZml0SW1hZ2UjY29uZmln
Cj4+Pj4+Pj4KPj4+Pj4+PiBUaGUgbGFzdCBjb21taXQgb2YgdGhlIHNlcmllcyBpcyBvbmx5IGEg
bWlub3IgaW1wcm92ZW1lbnQuCj4+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBJIHRlc3RlZCB0aGlzIG9u
IG15IFB1bWEgUkszMzk5IGFuZCBpdCBkb2VzIHdvcmsgYWdhaW4sIHRoYW5rcy4KPj4+Pj4+Cj4+
Pj4+PiBIb3dldmVyLCBJJ20gbm90IHN1cmUgdGhpcyBpcyB3aGF0IHdlIHNob3VsZCBnbyBmb3I/
Cj4+Pj4+Pgo+Pj4+Pj4gTXkgd29ycnkgaXMgdGhlIGZvbGxvd2luZzoKPj4+Pj4+IFdoYXQgaGFw
cGVucyBmb3Igb2xkIHJlbGVhc2VzIChwcmUtdjIwMjIuMDQpIHdoZXJlIEtFUk5FTCB3b3JrZWQg
Cj4+Pj4+PiBqdXN0IGZpbmUgd2l0aG91dCB0aGUgRkRUIHRvIGxvYWQgdGhlIGZkdCBmcm9tIHRo
ZSBmaXRpbWFnZSBjb25mIAo+Pj4+Pj4gc3BlY2lmaWVkIGluIEtFUk5FTCBmaWVsZD8gV291bGQg
d2Ugbm93IG5lZWQgdG8ga2VlcCBhbiAKPj4+Pj4+IGV4dGxpbnV4LmNvbmYgZm9yIHByZS0yMDIy
LjA0IHJlbGVhc2VzIHdoZXJlIEZEVCB3b3VsZG4ndCBiZSBzZXQgCj4+Pj4+PiBhbmQgb25lIGZv
ciAyMDIzLjAxIGFuZCBsYXRlciB3aGVyZSBGRFQgd291bGQgYmUgbWVudGlvbmVkPyBUaGF0IAo+
Pj4+Pj4gZG9lcyBub3Qgc2VlbSBsaWtlIGEgZ29vZCB0aGluZyBmb3IgZGlzdHJvcy4KPj4+Pj4+
Cj4+Pj4+PiBJIHVuZm9ydHVuYXRlbHkgY2Fubm90IGFuc3dlciB0aGUgcXVlc3Rpb24gbXlzZWxm
IHdpdGhvdXQgCj4+Pj4+PiBzcGVuZGluZyBzaWduaWZpY2FudCBlZmZvcnQgcGF0Y2hpbmcgdjIw
MjIuMDEgdG8gZ2V0IGl0IHRvIHdvcmsgCj4+Pj4+PiBvbiBvdXIgUHVtYSBtb2R1bGUuIERvZXMg
YW55b25lIGhhdmUgYWNjZXNzIHRvIGEgYm9hcmQgdG8gcXVpY2tseSAKPj4+Pj4+IGNoZWNrIGFu
IGV4dGxpbnV4LmNvbmYgd2l0aCBLRVJORUwgYW5kIEZEVCBzZXQgdG8gL2ZpdEltYWdlIG9uIGEg
Cj4+Pj4+PiB2MjAyMi4wMSByZWxlYXNlPwo+Pj4+Pgo+Pj4+PiBJJ20gYnVpbGRpbmcga2lya3N0
b25lIGltYWdlcyB3aXRoIG1ldGEtbWVzb24gaGF2aW5nIHYyMDIyLjAxLCAKPj4+Pj4gSSdsbCB0
ZXN0IHdpdGggRkRUIHNldCB0byAvZml0SW1hZ2UgdG8gc2VlIGlmIGl0IGJyZWFrcy4KPj4+Pgo+
Pj4+IEl0IGJyZWFrczoKPj4+PiBGb3VuZCAvZXh0bGludXgvZXh0bGludXguY29uZgo+Pj4+IFJl
dHJpZXZpbmcgZmlsZTogL2V4dGxpbnV4L2V4dGxpbnV4LmNvbmYKPj4+PiAxOsKgwqDCoCBZb2N0
bwo+Pj4+IFJldHJpZXZpbmcgZmlsZTogL2ZpdEltYWdlCj4+Pj4gYXBwZW5kOiByb290PVBBUlRV
VUlEPTNlYmMwMDA1LTAyIHJvb3R3YWl0IGNvbnNvbGU9dHR5QU1MMCwxMTUyMDAKPj4+PiBSZXRy
aWV2aW5nIGZpbGU6IC9maXRJbWFnZQo+Pj4+IEJhZCBMaW51eCBBUk02NCBJbWFnZSBtYWdpYyEK
Pj4+PiBTQ1JJUFQgRkFJTEVEOiBjb250aW51aW5nLi4uCj4+Pj4KPj4+Cj4+PiBDYW4geW91IHNo
YXJlIHRoZSBleHRsaW51eCBmaWxlIHVzZWQgZm9yIHlvdXIgdGVzdCA/ZG8geW91IGhhdmUgbXkg
Cj4+PiBwYXRjaCA/Cj4+Cj4+IEl0IHdhcyBleHBsaWNpdGx5IHdpdGhvdXQgeW91ciBwYXRjaCBh
cyBRdWVudGluIGFza2VkLCBoZSBob3BlZCBhZGRpbmdoCj4+ICJGRFQgL2ZpdEltYWdlIiB3b3Vs
ZCBub3QgYnJlYWsgdS1ib290IHByZSBkNWJhNjE4OGRmYmYsIGJ1dCBuby4KPj4KPgo+IFlvdXIg
aW1wbGVtZW50YXRpb24gcmVxdWlyZXMgY2hhbmdlcyBpbiBleHRsaW51eC5jb25mICh3aGljaCBj
b3VsZCBiZSAKPiBmaW5lLCBJJ20gbm90IGFyZ3VpbmcgYWJvdXQgdGhpcyBzcGVjaWZpY2FsbHkp
LiBJIGhvd2V2ZXIgdGhpbmsgd2UgCj4gbmVlZCB0aG9zZSByZXF1aXJlZCBjaGFuZ2VzIHRvIGJl
IGJhY2t3YXJkIGNvbXBhdGlibGUgd2l0aCBvbGRlciBVLUJvb3QuCj4KPiBUaGlzIG1lYW5zLCBh
IG5ldyBleHRsaW51eC5jb25mIHRoYXQgd29ya3Mgb24gbmV3ZXIgVS1Cb290IHNob3VsZCBhbHNv
IAo+IHdvcmsgb24gb2xkZXIgVS1Cb290IHdpdGhvdXQgeW91ciBwYXRjaC4KPgo+IE90aGVyd2lz
ZSwgd2Ugd291bGQgaGF2ZSB0aGUgZm9sbG93aW5nOgo+Cj4gVS1Cb290IFwgZXh0bGludXguY29u
ZiB8fCBvbGQgfCBuZXcKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiBv
bGTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8fCBPS8KgIHwgTk9LCj4g
bmV3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfHwgTk9LIHwgT0sKPgo+
IFdoYXQgSSBhbSBob3BpbmcgZm9yIGlzOgo+IFUtQm9vdCBcIGV4dGxpbnV4LmNvbmYgfHwgb2xk
IHwgbmV3Cj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gb2xkwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfHwgT0vCoCB8IE9LCj4gbmV3wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfHwgTk9LIHwgT0sKPgo+IG9yIGV2ZW4g
Zml4IHRoZSBzdXBwb3J0IGZvciBuZXcgVS1Cb290IHdpdGggb2xkIGV4dGxpbnV4LmNvbmYgKGJ1
dCAKPiB0aGF0IHNlZW1zIG5vdCBwb3NzaWJsZSBiZWNhdXNlIGhvdyBkNWJhNjE4OGRmYmYgKCJj
bWQ6IHB4ZV91dGlsczogCj4gQ2hlY2sgZmR0Y29udHJvbGFkZHIgaW4gbGFiZWxfYm9vdCIpIHdv
cmtzPykuCj4KClllcyBidXQgSSBkb24ndCBzZWUgYW55IHBvc3NpYmxlIHNvbHV0aW9uIHRvIHNv
bHZlIGFsbCB0aGUgY29tYmluYXRpb24gCndpdGggZDViYTYxODhkZmJmIGFuZCB3aXRob3V0IG9y
IHdpdGhvdXQgRklUOgoKdGhlIG9sZCBleHRsaW51eC5jb25mIHdpdGggRklUIGFyZSBhbHJlYWR5
IG5vIG1vcmUgd29ya2luZyBhcyBleHBlY3RlZCAKd2l0aCBjdXJyZW50IFUtQm9vdCAoMSkKCndo
ZW4gRkRUIGFuZCBGRFRESVIgYXJlIGFic2VudAoKCiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleHRs
aW51eC5jb25mIHx8IGtlcm5lbCA9IHVJbWFnZSB8IMKgwqAga2VybmVsPSBGSVQgwqDCoCB8IApr
ZXJuZWwgPSBGSVQKCiDCoMKgwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8fMKgIEZEVCBhYnNlbnTCoMKgwqDCoCB8IEZEVCBhYnNlbnTCoMKgwqDCoMKgwqDCoCB8
IEZEVCA9IApGSVQgKG15IHByb3Bvc2FsKQoKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KClUtQm9vdCA8PSB2MjAyMi4wMS1yYzLCoMKgIHx8IEtPwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCBPSyB1c2luZyBEVCBpbiBGSVTCoMKgIHwgbm90IApzdXBwb3J0ZWQKClUtQm9v
dCA+PSAyMDIyLjAxLXJjM8KgwqAgfHwgT0sgKDEpIMKgwqDCoMKgwqDCoMKgIHwgT0soMil1c2lu
ZyBVLUJvb3QgRFQgfCBub3QgCnN1cHBvcnRlZAoKbmV4dCB3aXRoIG15IHByb3Bvc2FswqDCoMKg
IHx8IE9LICgxKcKgwqDCoMKgwqDCoMKgwqDCoCB8IE9LKDIpdXNpbmcgVS1Cb290IERUIHwgT0sg
Cih1c2luZyBEVCBpbiBGSVQpCgoKKDEpIHdpdGggZDViYTYxODhkZmJmCgooMikgUmlzayB0byBo
YXZlIHVuYWxpZ25lZCBEVCBiZXR3ZWVuIFUtQm9vdCAob2xkKSBhbmQga2VybmVsIChuZXcpCgog
wqDCoMKgID0+IFUtQm9vdCBiZWhhdmlvciBjaGFuZ2Ugd2l0aCAyMDIyLjAxLXJjMygxKQoKCj4g
VGhpcyB3b3VsZCBnaXZlIGFuIGVhc3kgbWlncmF0aW9uIHBhdGggdG8gYW55IGNyZWF0b3Igb2Yg
dGhpcyAKPiBleHRsaW51eC5jb25mIGZpbGUgYnkganVzdCBtaWdyYXRpbmcgdG8gdGhlIG5ldyBm
b3JtYXQgd2hpbGUgbm90IAo+IHJlcXVpcmluZyBpdCB0byBjYXJlIGFib3V0IHRoZSB2ZXJzaW9u
IG9mIFUtQm9vdCBiZWluZyB1c2VkLgoKCkkgYWdyZWUsIGl0IGlzIGJldHRlciB0byBiZSBiYWNr
d2FyZCBjb21wYXRpYmxlLgoKU28gSSBzZWFyY2ggYSBzb2x1dGlvbiB0byBrZWVwIHRoZSBuZXcg
ZmVhdHVyZSBpbnRyb2R1Y2VkIGJ5IApkNWJhNjE4OGRmYmYgKCJjbWQ6IHB4ZV91dGlsczogQ2hl
Y2sgZmR0Y29udHJvbGFkZHIgaW4gbGFiZWxfYm9vdCIpIGJ1dCAKb25seSB3aGVuIEZJVCBpcyBu
b3QgdXNlZCBhbmQgZmFsbGJhY2sgdG8gcHJldmlvdXMgYmVoYXZpb3IgZm9yIEZJVC4uLi4KCgpi
dXQgaXQgaXMgdG9vIGNvbXBsaWNhdGVkOiBweGUgdXRpbHMgbmVlZCB0byBsb2FkIHRoZSAia2Vy
bmVsX2FkZHIiIGFuZCAKdmVyaWZ5IGlmIGl0IGlzIGEgRklUIGJlZm9yZSB0byBjaGVjayBpZiAi
ZmR0Y29udHJvbGFkZHIiIGlzIHByb3ZpZGVkLCAKYnV0IEkgY2FuIHRlc3QgYW4gc29sdXRpb24g
aWYgeW91IGhhdmUgYSBwcm9wb3NhbC4KCgpNb3Jlb3ZlciBJIGFzc3VtZWQgdGhlIEZJVCBmZWF0
dXJlIGlzIG5vdCBsYXJnZWx5IHVzZWQgaW4gZ2VuZXJhdGVkIApleHRsaW51eC5jb25mIGZpbGUg
YXMgdGhlIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBieSAyMDIyLjAxLXJjMndhc24ndCAKZGV0ZWN0
ZWQgdW50aWwgbm93LgoKCgo+Cj4gQ2hlZXJzLAo+IFF1ZW50aW4KCgpyZWdhcmRzCgpQYXRyaWNr
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=
