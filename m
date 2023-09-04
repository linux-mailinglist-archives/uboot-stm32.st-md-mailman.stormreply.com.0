Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F40791B66
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Sep 2023 18:21:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 010CEC6B454;
	Mon,  4 Sep 2023 16:21:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFE3DC6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 16:21:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 384E3k4b004303; Mon, 4 Sep 2023 18:21:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=UWCg6vn68bRz/Tf7ThyNmhsWd7N4odO4piJvPu0eQEU=; b=Vm
 yOHyH4zQrFFBxgovtqAWQct4N9+/FlooBTXrUaUjDaakV8fMx7e7su7boAySk9kC
 xNPmn1mUfvDKV6km39cY7CSy71aae/TL7+RaVhHQwSjp24PkjyJ2rgMR8FZp2s15
 AGuah5BuDbvPDVSRAo/LOQhmdtbTfwGnrgaZ7KfO2srxeyvMxdnc2Q9/dmmzI22D
 6pkYiaZMqWh3BQyjwhT1rSTL7f9YepP8NFnR3MCrhzlYWVCSLwbmeDhw/Eb7gTPL
 FJhkeeAaA13bN6jF8NmgRZX2ebTAlnOiOuPviCK3GW+pYRBvBVnCqnc+9XZmm8mf
 GYpBE8H3D8QSIabqj9Pw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3suvd0fv8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Sep 2023 18:21:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 074C3100058;
 Mon,  4 Sep 2023 18:21:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F119E23695B;
 Mon,  4 Sep 2023 18:21:48 +0200 (CEST)
Received: from [10.201.22.39] (10.201.22.39) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 4 Sep
 2023 18:21:47 +0200
Message-ID: <0ad3304f-c0cf-3c8b-890d-8824b9987afe@foss.st.com>
Date: Mon, 4 Sep 2023 18:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230901095201.3874129-1-fabrice.gasnier@foss.st.com>
 <29d44f7f-ffca-d8cd-ce88-5e2fb6103ff4@denx.de>
 <9c06f5ec-c278-e00d-873f-99ef54098816@foss.st.com>
 <fef0778b-4850-fb73-9d8f-da48a6138e13@denx.de>
 <7b2d0448-d7f0-e5f8-a6eb-beb1746921f1@foss.st.com>
 <cb4278ea-1cf9-a2c5-1310-7e6419315d38@denx.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <cb4278ea-1cf9-a2c5-1310-7e6419315d38@denx.de>
X-Originating-IP: [10.201.22.39]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_10,2023-08-31_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: check for companion controller in
	uclass
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

T24gOS80LzIzIDE1OjU0LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA5LzQvMjMgMTQ6MzQsIEZh
YnJpY2UgR2FzbmllciB3cm90ZToKPj4gT24gOS8xLzIzIDE4OjAwLCBNYXJlayBWYXN1dCB3cm90
ZToKPj4+IE9uIDkvMS8yMyAxNDoxMiwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+Pj4+IE9uIDkv
MS8yMyAxMjo0OCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+Pj4+IE9uIDkvMS8yMyAxMTo1MiwgRmFi
cmljZSBHYXNuaWVyIHdyb3RlOgo+Pj4+Pj4gRUhDSSBpcyB1c3VhbGx5IHVzZWQgd2l0aCBjb21w
YW5pb24gY29udHJvbGxlciAobGlrZSBPSENJKSBhcwo+Pj4+Pj4gY29tcGFuaW9uCj4+Pj4+PiBj
b250cm9sbGVyLiBUaGlzIGluZm9ybWF0aW9uIG9uIHRoZSBjb21wYW5pb24gaXMgbWlzc2luZyBj
dXJyZW50bHkgaW4KPj4+Pj4+IGNvbXBhbmlvbiBkcml2ZXJzLgo+Pj4+Pj4gU28sIGlmIHRoZSB1
c2ItdWNsYXNzIGlzbid0IGF3YXJlLCBpdCBtYXkgc2NhbiBidXNzZXMgaW4gYW55IG9yZGVyOgo+
Pj4+Pj4gT0hDSQo+Pj4+Pj4gZmlyc3QsIHRoZW4gRUhDSS4KPj4+Pj4+IFRoaXMgaXMgc2VlbiBv
biBTVE0zMk1QMSB3aGVyZSBEVCBwcm9iaW5nIG1ha2VzIHRoZSBwcm9iZSBvcmRlciB0bwo+Pj4+
Pj4gb2NjdXIKPj4+Pj4+IGJ5IGluY3JlYXNpbmcgYWRkcmVzcyAoT0hDSSBhZGRyZXNzIDwgRUhD
SSBhZGRyZXNzKS4KPj4+Pj4+Cj4+Pj4+PiBXaGVuIGEgbG93IHNwZWVkIG9yIGZ1bGwtc3BlZWQg
ZGV2aWNlIGlzIHBsdWdnZWQgaW4sIGl0J3Mgbm90Cj4+Pj4+PiBkZXRlY3RlZCBhcwo+Pj4+Pj4g
RUhDSSBzaG91bGQgZmlyc3QgZGV0ZWN0IGl0LCBhbmQgZ2l2ZSBvd25lcnNoaXAgKGhhbmRvdmVy
KSB0byBPSENJLgo+Pj4+Pj4KPj4+Pj4+IEN1cnJlbnQgc2l0dWF0aW9uIG9uIFNUTTMyTVAxICh3
aXRoIGEgbG93IHNwZWVkIGRldmljZSBwbHVnZ2VkLWluKQo+Pj4+Pj4gU1RNMzJNUD4gdXNiIHN0
YXJ0Cj4+Pj4+PiBzdGFydGluZyBVU0IuLi4KPj4+Pj4+IEJ1cyB1c2JANTgwMGMwMDA6IFVTQiBP
SENJIDEuMAo+Pj4+Pj4gQnVzIHVzYkA1ODAwZDAwMDogVVNCIEVIQ0kgMS4wMAo+Pj4+Pj4gc2Nh
bm5pbmcgYnVzIHVzYkA1ODAwYzAwMCBmb3IgZGV2aWNlcy4uLiAxIFVTQiBEZXZpY2UocykgZm91
bmQKPj4+Pj4+IHNjYW5uaW5nIGJ1cyB1c2JANTgwMGQwMDAgZm9yIGRldmljZXMuLi4gMSBVU0Ig
RGV2aWNlKHMpIGZvdW5kCj4+Pj4+PiDCoMKgwqDCoMKgIHNjYW5uaW5nIHVzYiBmb3Igc3RvcmFn
ZSBkZXZpY2VzLi4uIDAgU3RvcmFnZSBEZXZpY2UocykgZm91bmQKPj4+Pj4+Cj4+Pj4+PiBUaGUg
ImNvbXBhbmlvbiIgcHJvcGVydHkgaW4gdGhlIGRldmljZSB0cmVlIGFsbG93IHRvIHJldHJpZXZl
Cj4+Pj4+PiBjb21wYW5pb24KPj4+Pj4+IGNvbnRyb2xsZXIgaW5mb3JtYXRpb24sIGZyb20gdGhl
IEVIQ0kgbm9kZS4gVGhpcyBhbGxvdyBtYXJraW5nIHRoZQo+Pj4+Pj4gY29tcGFuaW9uIGRyaXZl
ciBhcyBzdWNoLgo+Pj4+Pj4KPj4+Pj4+IFdpdGggdGhpcyBwYXRjaCAoc2FtZSBsb3cgc3BlZWQg
ZGV2aWNlIHBsdWdnZWQgaW4pOgo+Pj4+Pj4gU1RNMzJNUD4gdXNiIHN0YXJ0Cj4+Pj4+PiBzdGFy
dGluZyBVU0IuLi4KPj4+Pj4+IEJ1cyB1c2JANTgwMGMwMDA6IFVTQiBPSENJIDEuMAo+Pj4+Pj4g
QnVzIHVzYkA1ODAwZDAwMDogVVNCIEVIQ0kgMS4wMAo+Pj4+Pj4gc2Nhbm5pbmcgYnVzIHVzYkA1
ODAwZDAwMCBmb3IgZGV2aWNlcy4uLiAxIFVTQiBEZXZpY2UocykgZm91bmQKPj4+Pj4+IHNjYW5u
aW5nIGJ1cyB1c2JANTgwMGMwMDAgZm9yIGRldmljZXMuLi4gMiBVU0IgRGV2aWNlKHMpIGZvdW5k
Cj4+Pj4+PiDCoMKgwqDCoMKgIHNjYW5uaW5nIHVzYiBmb3Igc3RvcmFnZSBkZXZpY2VzLi4uIDAg
U3RvcmFnZSBEZXZpY2UocykgZm91bmQKPj4+Pj4+IFNUTTMyTVA+IHVzYiB0cmVlCj4+Pj4+PiBV
U0IgZGV2aWNlIHRyZWU6Cj4+Pj4+PiAxwqAgSHViICgxMiBNYi9zLCAwbUEpCj4+Pj4+PiB8wqDC
oCBVLUJvb3QgUm9vdCBIdWIKPj4+Pj4+IHwKPj4+Pj4+ICstMsKgIEh1bWFuIEludGVyZmFjZSAo
MS41IE1iL3MsIDEwMG1BKQo+Pj4+Pj4gwqDCoMKgwqDCoCBIUCBIUCBVU0IgMTAwMGRwaSBMYXNl
ciBNb3VzZQo+Pj4+Pj4KPj4+Pj4+IDHCoCBIdWIgKDQ4MCBNYi9zLCAwbUEpCj4+Pj4+PiDCoMKg
wqAgdS1ib290IEVIQ0kgSG9zdCBDb250cm9sbGVyCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBhbHNvIG9w
dGltaXplIGJ1cyBzY2FuIHdoZW4gYSBIaWdoIHNwZWVkIGRldmljZSBpcyBwbHVnZ2VkCj4+Pj4+
PiBpbiwgYXMKPj4+Pj4+IHRoZSB1c2ItdWNsYXNzIHNraXBzIE9IQ0kgaW4gdGhpcyBjYXNlOgo+
Pj4+Pj4KPj4+Pj4+IFNUTTMyTVA+IHVzYiByZXNldAo+Pj4+Pj4gcmVzZXR0aW5nIFVTQi4uLgo+
Pj4+Pj4gQnVzIHVzYkA1ODAwYzAwMDogVVNCIE9IQ0kgMS4wCj4+Pj4+PiBCdXMgdXNiQDU4MDBk
MDAwOiBVU0IgRUhDSSAxLjAwCj4+Pj4+PiBzY2FubmluZyBidXMgdXNiQDU4MDBkMDAwIGZvciBk
ZXZpY2VzLi4uIDIgVVNCIERldmljZShzKSBmb3VuZAo+Pj4+Pj4gwqDCoMKgwqDCoCBzY2Fubmlu
ZyB1c2IgZm9yIHN0b3JhZ2UgZGV2aWNlcy4uLiAxIFN0b3JhZ2UgRGV2aWNlKHMpIGZvdW5kCj4+
Pj4+PiBTVE0zMk1QPiB1c2IgdHJlZQo+Pj4+Pj4gVVNCIGRldmljZSB0cmVlOgo+Pj4+Pj4gMcKg
IEh1YiAoNDgwIE1iL3MsIDBtQSkKPj4+Pj4+IHzCoCB1LWJvb3QgRUhDSSBIb3N0IENvbnRyb2xs
ZXIKPj4+Pj4+IHwKPj4+Pj4+ICstMsKgIE1hc3MgU3RvcmFnZSAoNDgwIE1iL3MsIDIwMG1BKQo+
Pj4+Pj4gwqDCoMKgwqDCoCBTYW5EaXNrIENydXplciBCbGFkZSAwMzAwMzQzMjAyMTkyMjAxMTQw
Nwo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5n
YXNuaWVyQGZvc3Muc3QuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+Pgo+Pj4+Pj4gQ2hhbmdlcyBpbiB2
MjoKPj4+Pj4+IC0gbW92ZSBjb21wYW5pb24gcHJvYmluZyBmcm9tIGdlbmVyaWMgZWhjaSBkcml2
ZXIgdG8gdXNiLXVjbGFzcywKPj4+Pj4+IGFmdGVyCj4+Pj4+PiDCoMKgwqDCoCBNYXJlaydzIHF1
ZXN0aW9ucyBvbiBkZXNpZ24gY2hvaWNlLgo+Pj4+Pj4gLSByZW5hbWUgY29tbWl0IHRpdGxlIHRv
IGZvbGxvdyB0aGlzIGNoYW5nZQo+Pj4+Pj4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqDCoMKgIGRyaXZl
cnMvdXNiL2hvc3QvdXNiLXVjbGFzcy5jIHwgMzYKPj4+Pj4+ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4+Pj4+PiDCoMKgwqAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlv
bnMoKykKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC91c2ItdWNs
YXNzLmMKPj4+Pj4+IGIvZHJpdmVycy91c2IvaG9zdC91c2ItdWNsYXNzLmMKPj4+Pj4+IGluZGV4
IDAyYzAxMzhhMjA2NS4uZTIzOGVlZThjODRkIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy91
c2IvaG9zdC91c2ItdWNsYXNzLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QvdXNiLXVj
bGFzcy5jCj4+Pj4+PiBAQCAtMjQ5LDYgKzI0OSwzNyBAQCBzdGF0aWMgdm9pZCByZW1vdmVfaW5h
Y3RpdmVfY2hpbGRyZW4oc3RydWN0Cj4+Pj4+PiB1Y2xhc3MgKnVjLCBzdHJ1Y3QgdWRldmljZSAq
YnVzKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4gwqDCoMKgIH0KPj4+Pj4+IMKgwqDC
oCArc3RhdGljIGludCB1c2JfcHJvYmVfY29tcGFuaW9uKHN0cnVjdCB1ZGV2aWNlICpidXMpCj4+
Pj4+PiArewo+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgdWRldmljZSAqY29tcGFuaW9uX2RldjsKPj4+
Pj4+ICvCoMKgwqAgaW50IHJldDsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqAgLyoKPj4+Pj4+ICvC
oMKgwqDCoCAqIEVuZm9yY2Ugb3B0aW9uYWwgY29tcGFuaW9uIGNvbnRyb2xsZXIgaXMgbWFya2Vk
IGFzIHN1Y2ggaW4KPj4+Pj4+IG9yZGVyIHRvCj4+Pj4+PiArwqDCoMKgwqAgKiAxc3Qgc2NhbiB0
aGUgcHJpbWFyeSBjb250cm9sbGVyLCBiZWZvcmUgdGhlIGNvbXBhbmlvbgo+Pj4+Pj4gY29udHJv
bGxlcgo+Pj4+Pj4gK8KgwqDCoMKgICogKG93bmVyc2hpcCBpcyBnaXZlbiB0byBjb21wYW5pb24g
d2hlbiBsb3cgb3IgZnVsbCBzcGVlZAo+Pj4+Pj4gZGV2aWNlcwo+Pj4+Pj4gK8KgwqDCoMKgICog
aGF2ZSBiZWVuIGRldGVjdGVkKS4KPj4+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+Pj4gK8KgwqDCoCBy
ZXQgPSB1Y2xhc3NfZ2V0X2RldmljZV9ieV9waGFuZGxlKFVDTEFTU19VU0IsIGJ1cywgImNvbXBh
bmlvbiIsCj4+Pj4+PiAmY29tcGFuaW9uX2Rldik7Cj4+Pj4+PiArwqDCoMKgIGlmICghcmV0KSB7
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IHVzYl9idXNfcHJpdiAqY29tcGFuaW9uX2J1
c19wcml2Owo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRlYnVnKCIlcyBpcyB0aGUg
Y29tcGFuaW9uIG9mICVzXG4iLCBjb21wYW5pb25fZGV2LT5uYW1lLAo+Pj4+Pj4gYnVzLT5uYW1l
KTsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjb21wYW5pb25fYnVzX3ByaXYgPSBkZXZfZ2V0X3Vj
bGFzc19wcml2KGNvbXBhbmlvbl9kZXYpOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhbmlv
bl9idXNfcHJpdi0+Y29tcGFuaW9uID0gdHJ1ZTsKPj4+Pj4+ICvCoMKgwqAgfSBlbHNlIGlmIChy
ZXQgJiYgcmV0ICE9IC1FTk9FTlQgJiYgcmV0ICE9IC1FTk9ERVYpIHsKPj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCAvKgo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBUcmVhdCBldmVyeXRoaW5nIGVs
c2UgdGhhbiBubyBjb21wYW5pb24gb3IgZGlzYWJsZWQKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
ICogY29tcGFuaW9uIGFzIGFuIGVycm9yLiAoSXQgbWF5IG5vdCBiZSBlbmFibGVkIG9uIGJvYXJk
cwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiB0aGF0IGhhdmUgYSBIaWdoLVNwZWVkIEhVQiB0
byBoYW5kbGUgRlMgYW5kIExTIHRyYWZmaWMpLgo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8K
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwcmludGYoIkZhaWxlZCB0byBnZXQgY29tcGFuaW9uIChy
ZXQ9JWQpXG4iLCByZXQpOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+
PiArwqDCoMKgIH0KPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4+PiArfQo+
Pj4+Pj4gKwo+Pj4+Pj4gwqDCoMKgIGludCB1c2JfaW5pdCh2b2lkKQo+Pj4+Pj4gwqDCoMKgIHsK
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGludCBjb250cm9sbGVyc19pbml0aWFsaXplZCA9IDA7Cj4+
Pj4+PiBAQCAtMjk5LDYgKzMzMCwxMSBAQCBpbnQgdXNiX2luaXQodm9pZCkKPj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludGYoInByb2JlIGZhaWxlZCwgZXJyb3IgJWRc
biIsIHJldCk7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7
Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXQgPSB1c2JfcHJvYmVfY29tcGFuaW9uKGJ1cyk7Cj4gCj4gT25lIG1vcmUgdGhp
bmcsIHNob3VsZG4ndCB0aGlzIGRvCj4gCj4gaWYgKHJldCkKPiDCoCBjb250aW51ZTsKPiAKPiBm
b3IgbWF4aW11bSBjb21wYXRpYmlsaXR5ID8KCkkgdGhpbmsgaXQgZG9lcyA6LSkgT3IgSSBtaXNz
IHlvdXIgcXVlc3Rpb24gaGVyZSwgY291bGQgeW91IGNsYXJpZnkgPwoKSW4gdGhlIG9yaWdpbmFs
IFBBVENIIHRoZXJlIGlzOgorCisJCXJldCA9IHVzYl9wcm9iZV9jb21wYW5pb24oYnVzKTsKKwkJ
aWYgKHJldCkKKwkJCWNvbnRpbnVlOworCgo+IAo+PiBJJ2QgYmUgZ2xhZCB0byBoYXZlIGl0IGlu
IHRoaXMgcmVsZWFzZS4KPiAKPiBPSwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
