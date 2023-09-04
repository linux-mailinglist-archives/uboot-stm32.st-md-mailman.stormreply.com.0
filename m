Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB04B79172E
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Sep 2023 14:34:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 562EEC6B455;
	Mon,  4 Sep 2023 12:34:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB026C6A615
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 12:34:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3848RsmG020316; Mon, 4 Sep 2023 14:34:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ddg71ncooKUM9VO9IAnSHVFnAR2UKzGnswHAeqTpASQ=; b=zF
 kw7bUvZp7JH5G7Ai3gQP0rK64th+RYQEAiGqEPAfZ6vhvEhcsuSvU7fZvPo6SAPA
 6x5Au4GOUkrkDvKwducSzAes9y3G3ZU6KBjMmifdBgnMQdUps2gknEJQJUtOHTTT
 N/GC+ZP8aff7rzK+nZc8/NSVcIQOLafHsKKUUPU9gi88AEhHKF+rXxbUah7R9csO
 vxm8b8SxZYYTWm+KUA1LOEOFZZRCueqPNmqTaTtFLsYrDiGQLljFQsps0IbXQhKo
 G7gy4noRJL63sNCD362SboC6hVSlleZqTnwFXgRBPOhgVNaheYltx56MBSFnIfMv
 RCNy3H1y01mxhjvABLsA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sutff75nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Sep 2023 14:34:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D66F8100058;
 Mon,  4 Sep 2023 14:34:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD4AA228A22;
 Mon,  4 Sep 2023 14:34:36 +0200 (CEST)
Received: from [10.201.22.39] (10.201.22.39) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 4 Sep
 2023 14:34:36 +0200
Message-ID: <7b2d0448-d7f0-e5f8-a6eb-beb1746921f1@foss.st.com>
Date: Mon, 4 Sep 2023 14:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230901095201.3874129-1-fabrice.gasnier@foss.st.com>
 <29d44f7f-ffca-d8cd-ce88-5e2fb6103ff4@denx.de>
 <9c06f5ec-c278-e00d-873f-99ef54098816@foss.st.com>
 <fef0778b-4850-fb73-9d8f-da48a6138e13@denx.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <fef0778b-4850-fb73-9d8f-da48a6138e13@denx.de>
X-Originating-IP: [10.201.22.39]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_07,2023-08-31_01,2023-05-22_02
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

T24gOS8xLzIzIDE4OjAwLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA5LzEvMjMgMTQ6MTIsIEZh
YnJpY2UgR2FzbmllciB3cm90ZToKPj4gT24gOS8xLzIzIDEyOjQ4LCBNYXJlayBWYXN1dCB3cm90
ZToKPj4+IE9uIDkvMS8yMyAxMTo1MiwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+Pj4+IEVIQ0kg
aXMgdXN1YWxseSB1c2VkIHdpdGggY29tcGFuaW9uIGNvbnRyb2xsZXIgKGxpa2UgT0hDSSkgYXMg
Y29tcGFuaW9uCj4+Pj4gY29udHJvbGxlci4gVGhpcyBpbmZvcm1hdGlvbiBvbiB0aGUgY29tcGFu
aW9uIGlzIG1pc3NpbmcgY3VycmVudGx5IGluCj4+Pj4gY29tcGFuaW9uIGRyaXZlcnMuCj4+Pj4g
U28sIGlmIHRoZSB1c2ItdWNsYXNzIGlzbid0IGF3YXJlLCBpdCBtYXkgc2NhbiBidXNzZXMgaW4g
YW55IG9yZGVyOgo+Pj4+IE9IQ0kKPj4+PiBmaXJzdCwgdGhlbiBFSENJLgo+Pj4+IFRoaXMgaXMg
c2VlbiBvbiBTVE0zMk1QMSB3aGVyZSBEVCBwcm9iaW5nIG1ha2VzIHRoZSBwcm9iZSBvcmRlciB0
bwo+Pj4+IG9jY3VyCj4+Pj4gYnkgaW5jcmVhc2luZyBhZGRyZXNzIChPSENJIGFkZHJlc3MgPCBF
SENJIGFkZHJlc3MpLgo+Pj4+Cj4+Pj4gV2hlbiBhIGxvdyBzcGVlZCBvciBmdWxsLXNwZWVkIGRl
dmljZSBpcyBwbHVnZ2VkIGluLCBpdCdzIG5vdAo+Pj4+IGRldGVjdGVkIGFzCj4+Pj4gRUhDSSBz
aG91bGQgZmlyc3QgZGV0ZWN0IGl0LCBhbmQgZ2l2ZSBvd25lcnNoaXAgKGhhbmRvdmVyKSB0byBP
SENJLgo+Pj4+Cj4+Pj4gQ3VycmVudCBzaXR1YXRpb24gb24gU1RNMzJNUDEgKHdpdGggYSBsb3cg
c3BlZWQgZGV2aWNlIHBsdWdnZWQtaW4pCj4+Pj4gU1RNMzJNUD4gdXNiIHN0YXJ0Cj4+Pj4gc3Rh
cnRpbmcgVVNCLi4uCj4+Pj4gQnVzIHVzYkA1ODAwYzAwMDogVVNCIE9IQ0kgMS4wCj4+Pj4gQnVz
IHVzYkA1ODAwZDAwMDogVVNCIEVIQ0kgMS4wMAo+Pj4+IHNjYW5uaW5nIGJ1cyB1c2JANTgwMGMw
MDAgZm9yIGRldmljZXMuLi4gMSBVU0IgRGV2aWNlKHMpIGZvdW5kCj4+Pj4gc2Nhbm5pbmcgYnVz
IHVzYkA1ODAwZDAwMCBmb3IgZGV2aWNlcy4uLiAxIFVTQiBEZXZpY2UocykgZm91bmQKPj4+PiDC
oMKgwqDCoCBzY2FubmluZyB1c2IgZm9yIHN0b3JhZ2UgZGV2aWNlcy4uLiAwIFN0b3JhZ2UgRGV2
aWNlKHMpIGZvdW5kCj4+Pj4KPj4+PiBUaGUgImNvbXBhbmlvbiIgcHJvcGVydHkgaW4gdGhlIGRl
dmljZSB0cmVlIGFsbG93IHRvIHJldHJpZXZlIGNvbXBhbmlvbgo+Pj4+IGNvbnRyb2xsZXIgaW5m
b3JtYXRpb24sIGZyb20gdGhlIEVIQ0kgbm9kZS4gVGhpcyBhbGxvdyBtYXJraW5nIHRoZQo+Pj4+
IGNvbXBhbmlvbiBkcml2ZXIgYXMgc3VjaC4KPj4+Pgo+Pj4+IFdpdGggdGhpcyBwYXRjaCAoc2Ft
ZSBsb3cgc3BlZWQgZGV2aWNlIHBsdWdnZWQgaW4pOgo+Pj4+IFNUTTMyTVA+IHVzYiBzdGFydAo+
Pj4+IHN0YXJ0aW5nIFVTQi4uLgo+Pj4+IEJ1cyB1c2JANTgwMGMwMDA6IFVTQiBPSENJIDEuMAo+
Pj4+IEJ1cyB1c2JANTgwMGQwMDA6IFVTQiBFSENJIDEuMDAKPj4+PiBzY2FubmluZyBidXMgdXNi
QDU4MDBkMDAwIGZvciBkZXZpY2VzLi4uIDEgVVNCIERldmljZShzKSBmb3VuZAo+Pj4+IHNjYW5u
aW5nIGJ1cyB1c2JANTgwMGMwMDAgZm9yIGRldmljZXMuLi4gMiBVU0IgRGV2aWNlKHMpIGZvdW5k
Cj4+Pj4gwqDCoMKgwqAgc2Nhbm5pbmcgdXNiIGZvciBzdG9yYWdlIGRldmljZXMuLi4gMCBTdG9y
YWdlIERldmljZShzKSBmb3VuZAo+Pj4+IFNUTTMyTVA+IHVzYiB0cmVlCj4+Pj4gVVNCIGRldmlj
ZSB0cmVlOgo+Pj4+IDHCoCBIdWIgKDEyIE1iL3MsIDBtQSkKPj4+PiB8wqDCoCBVLUJvb3QgUm9v
dCBIdWIKPj4+PiB8Cj4+Pj4gKy0ywqAgSHVtYW4gSW50ZXJmYWNlICgxLjUgTWIvcywgMTAwbUEp
Cj4+Pj4gwqDCoMKgwqAgSFAgSFAgVVNCIDEwMDBkcGkgTGFzZXIgTW91c2UKPj4+Pgo+Pj4+IDHC
oCBIdWIgKDQ4MCBNYi9zLCAwbUEpCj4+Pj4gwqDCoCB1LWJvb3QgRUhDSSBIb3N0IENvbnRyb2xs
ZXIKPj4+Pgo+Pj4+IFRoaXMgYWxzbyBvcHRpbWl6ZSBidXMgc2NhbiB3aGVuIGEgSGlnaCBzcGVl
ZCBkZXZpY2UgaXMgcGx1Z2dlZCBpbiwgYXMKPj4+PiB0aGUgdXNiLXVjbGFzcyBza2lwcyBPSENJ
IGluIHRoaXMgY2FzZToKPj4+Pgo+Pj4+IFNUTTMyTVA+IHVzYiByZXNldAo+Pj4+IHJlc2V0dGlu
ZyBVU0IuLi4KPj4+PiBCdXMgdXNiQDU4MDBjMDAwOiBVU0IgT0hDSSAxLjAKPj4+PiBCdXMgdXNi
QDU4MDBkMDAwOiBVU0IgRUhDSSAxLjAwCj4+Pj4gc2Nhbm5pbmcgYnVzIHVzYkA1ODAwZDAwMCBm
b3IgZGV2aWNlcy4uLiAyIFVTQiBEZXZpY2UocykgZm91bmQKPj4+PiDCoMKgwqDCoCBzY2Fubmlu
ZyB1c2IgZm9yIHN0b3JhZ2UgZGV2aWNlcy4uLiAxIFN0b3JhZ2UgRGV2aWNlKHMpIGZvdW5kCj4+
Pj4gU1RNMzJNUD4gdXNiIHRyZWUKPj4+PiBVU0IgZGV2aWNlIHRyZWU6Cj4+Pj4gMcKgIEh1YiAo
NDgwIE1iL3MsIDBtQSkKPj4+PiB8wqAgdS1ib290IEVIQ0kgSG9zdCBDb250cm9sbGVyCj4+Pj4g
fAo+Pj4+ICstMsKgIE1hc3MgU3RvcmFnZSAoNDgwIE1iL3MsIDIwMG1BKQo+Pj4+IMKgwqDCoMKg
IFNhbkRpc2sgQ3J1emVyIEJsYWRlIDAzMDAzNDMyMDIxOTIyMDExNDA3Cj4+Pj4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4K
Pj4+PiAtLS0KPj4+Pgo+Pj4+IENoYW5nZXMgaW4gdjI6Cj4+Pj4gLSBtb3ZlIGNvbXBhbmlvbiBw
cm9iaW5nIGZyb20gZ2VuZXJpYyBlaGNpIGRyaXZlciB0byB1c2ItdWNsYXNzLCBhZnRlcgo+Pj4+
IMKgwqDCoCBNYXJlaydzIHF1ZXN0aW9ucyBvbiBkZXNpZ24gY2hvaWNlLgo+Pj4+IC0gcmVuYW1l
IGNvbW1pdCB0aXRsZSB0byBmb2xsb3cgdGhpcyBjaGFuZ2UKPj4+Pgo+Pj4+IC0tLQo+Pj4+IMKg
wqAgZHJpdmVycy91c2IvaG9zdC91c2ItdWNsYXNzLmMgfCAzNgo+Pj4+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0
aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QvdXNiLXVjbGFz
cy5jCj4+Pj4gYi9kcml2ZXJzL3VzYi9ob3N0L3VzYi11Y2xhc3MuYwo+Pj4+IGluZGV4IDAyYzAx
MzhhMjA2NS4uZTIzOGVlZThjODRkIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3Qv
dXNiLXVjbGFzcy5jCj4+Pj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC91c2ItdWNsYXNzLmMKPj4+
PiBAQCAtMjQ5LDYgKzI0OSwzNyBAQCBzdGF0aWMgdm9pZCByZW1vdmVfaW5hY3RpdmVfY2hpbGRy
ZW4oc3RydWN0Cj4+Pj4gdWNsYXNzICp1Yywgc3RydWN0IHVkZXZpY2UgKmJ1cykKPj4+PiDCoMKg
wqDCoMKgwqAgfQo+Pj4+IMKgwqAgfQo+Pj4+IMKgwqAgK3N0YXRpYyBpbnQgdXNiX3Byb2JlX2Nv
bXBhbmlvbihzdHJ1Y3QgdWRldmljZSAqYnVzKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qg
dWRldmljZSAqY29tcGFuaW9uX2RldjsKPj4+PiArwqDCoMKgIGludCByZXQ7Cj4+Pj4gKwo+Pj4+
ICvCoMKgwqAgLyoKPj4+PiArwqDCoMKgwqAgKiBFbmZvcmNlIG9wdGlvbmFsIGNvbXBhbmlvbiBj
b250cm9sbGVyIGlzIG1hcmtlZCBhcyBzdWNoIGluCj4+Pj4gb3JkZXIgdG8KPj4+PiArwqDCoMKg
wqAgKiAxc3Qgc2NhbiB0aGUgcHJpbWFyeSBjb250cm9sbGVyLCBiZWZvcmUgdGhlIGNvbXBhbmlv
bgo+Pj4+IGNvbnRyb2xsZXIKPj4+PiArwqDCoMKgwqAgKiAob3duZXJzaGlwIGlzIGdpdmVuIHRv
IGNvbXBhbmlvbiB3aGVuIGxvdyBvciBmdWxsIHNwZWVkIGRldmljZXMKPj4+PiArwqDCoMKgwqAg
KiBoYXZlIGJlZW4gZGV0ZWN0ZWQpLgo+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+ICvCoMKgwqAgcmV0
ID0gdWNsYXNzX2dldF9kZXZpY2VfYnlfcGhhbmRsZShVQ0xBU1NfVVNCLCBidXMsICJjb21wYW5p
b24iLAo+Pj4+ICZjb21wYW5pb25fZGV2KTsKPj4+PiArwqDCoMKgIGlmICghcmV0KSB7Cj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHN0cnVjdCB1c2JfYnVzX3ByaXYgKmNvbXBhbmlvbl9idXNfcHJpdjsK
Pj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRlYnVnKCIlcyBpcyB0aGUgY29tcGFuaW9uIG9m
ICVzXG4iLCBjb21wYW5pb25fZGV2LT5uYW1lLAo+Pj4+IGJ1cy0+bmFtZSk7Cj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGNvbXBhbmlvbl9idXNfcHJpdiA9IGRldl9nZXRfdWNsYXNzX3ByaXYoY29tcGFu
aW9uX2Rldik7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhbmlvbl9idXNfcHJpdi0+Y29tcGFu
aW9uID0gdHJ1ZTsKPj4+PiArwqDCoMKgIH0gZWxzZSBpZiAocmV0ICYmIHJldCAhPSAtRU5PRU5U
ICYmIHJldCAhPSAtRU5PREVWKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqAgKiBUcmVhdCBldmVyeXRoaW5nIGVsc2UgdGhhbiBubyBjb21wYW5pb24gb3Ig
ZGlzYWJsZWQKPj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGNvbXBhbmlvbiBhcyBhbiBlcnJvci4g
KEl0IG1heSBub3QgYmUgZW5hYmxlZCBvbiBib2FyZHMKPj4+PiArwqDCoMKgwqDCoMKgwqDCoCAq
IHRoYXQgaGF2ZSBhIEhpZ2gtU3BlZWQgSFVCIHRvIGhhbmRsZSBGUyBhbmQgTFMgdHJhZmZpYyku
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJG
YWlsZWQgdG8gZ2V0IGNvbXBhbmlvbiAocmV0PSVkKVxuIiwgcmV0KTsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHJldDsKPj4+PiArwqDCoMKgIH0KPj4+PiArCj4+Pj4gK8KgwqDCoCByZXR1
cm4gMDsKPj4+PiArfQo+Pj4+ICsKPj4+PiDCoMKgIGludCB1c2JfaW5pdCh2b2lkKQo+Pj4+IMKg
wqAgewo+Pj4+IMKgwqDCoMKgwqDCoCBpbnQgY29udHJvbGxlcnNfaW5pdGlhbGl6ZWQgPSAwOwo+
Pj4+IEBAIC0yOTksNiArMzMwLDExIEBAIGludCB1c2JfaW5pdCh2b2lkKQo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJwcm9iZSBmYWlsZWQsIGVycm9yICVkXG4iLCBy
ZXQpOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gdXNi
X3Byb2JlX2NvbXBhbmlvbihidXMpOwo+Pj4KPj4+IFNob3VsZG4ndCB0aGlzIF4gYmUgaW4gc2Vw
YXJhdGUgdWNsYXNzX2ZvcmVhY2hfZGV2KGJ1cywgdWMpIHt9IGxvb3AKPj4+IGJlZm9yZSB0aGlz
IGRldmljZV9wcm9iZSgpIGxvb3AgLCBzbyB0aGF0IHdoZW4gdGhlIHByb2JlIG9mIHRoZQo+Pj4g
Y29udHJvbGxlciBpcyBjYWxsZWQsIGl0cyAtPmNvbXBhbmlvbiBpcyBhbHJlYWR5IHNldCA/Cj4+
Cj4+IFRoZSBwb2ludCBpcyB0byBoYXZlIHRoZSBjb21wYW5pb24gZmxhZyBzZXQgYmVmb3JlIHNj
YW5uaW5nIHRoZSBidXMuCj4+IEdlbmVyaWMgT0hDSSBvciBFSENJIGRyaXZlcnMgZG9uJ3QgY2Fy
ZSBhYm91dCB0aGlzIGZsYWcuCj4+Cj4+IFNjYW5uaW5nIGlzIHBlcmZvcm1lZCByaWdodCBhZnRl
ciB0aGlzIGZpcnN0IGxvb3AgKGxvdy1sZXZlbCksIGluIHR3bwo+PiBzdWJzZXF1ZW50IHN0ZXBz
OiBwcmltYXJ5IGNvbnRyb2xsZXJzICgybmQgc3RlcCksIHRoZW4gY29tcGFuaW9ucyBpZgo+PiBu
ZWNlc3NhcnkgKDNyZCBzdGVwKS4KPiAKPiBUaGFua3MgZm9yIGNsYXJpZnlpbmcsIGluIHRoYXQg
Y2FzZToKPiAKPiBSZXZpZXdlZC1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gCj4g
SXMgdGhpcyBhIGZpeCBmb3IgdGhpcyByZWxlYXNlIChjdXJyZW50bHkgcmMzKSBvciBuZXh0IHJl
bGVhc2UgPwoKCkhpIE1hcmVrLAoKSSdkIGJlIGdsYWQgdG8gaGF2ZSBpdCBpbiB0aGlzIHJlbGVh
c2UuCgpUaGFua3MsCkZhYnJpY2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
