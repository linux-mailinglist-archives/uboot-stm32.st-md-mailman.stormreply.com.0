Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5810578FB67
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Sep 2023 11:49:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CBE9C6A61D;
	Fri,  1 Sep 2023 09:49:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70897C65E56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 09:49:43 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3814bXKW027990; Fri, 1 Sep 2023 11:49:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=pPARXyNUEmVd8ypw5jf3ifL9Pg6FlwooBwpASuQsFI8=; b=5k
 jBjaQNOHFvHnbN4EmhDfkEO5QXYK4fW6nyrXnHAIUTIRmdpm3PD9lRLksQeQzctC
 pq3QMsG6DhSIxtc2yle7ChxcvPEwLSkUHGOYgS5iGMu4aHlCoH7FFbF5GRm9HMNz
 VPnoLXOUtMGVZLjjGXtxCxnHhw5GgGAtB3BVUGUE0Htm6jIOfigvP3D0m2N37XW4
 zkMARsicIwajYRycr41yYWCDORpTvjnylHtuOkmhOu6k1SITi2B4lilly8zniyme
 IGS/h/9Ks6CBCnApMjTOwd1N/mJeDR46hb2Jz0L16/vEG8Hnj2cjmrHR4D4hi5T7
 YQDdh7Dv7XAyUJvqQ9wQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sqty06tar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Sep 2023 11:49:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 458D8100056;
 Fri,  1 Sep 2023 11:49:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2556821A90A;
 Fri,  1 Sep 2023 11:49:41 +0200 (CEST)
Received: from [10.201.22.39] (10.201.22.39) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 1 Sep
 2023 11:49:40 +0200
Message-ID: <8f54491e-47f8-5e58-5a44-f991dcf66616@foss.st.com>
Date: Fri, 1 Sep 2023 11:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230830080008.455157-1-fabrice.gasnier@foss.st.com>
 <4e4f480f-8f97-cf8a-fb55-8d1ebaffb993@denx.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <4e4f480f-8f97-cf8a-fb55-8d1ebaffb993@denx.de>
X-Originating-IP: [10.201.22.39]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_07,2023-08-31_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: host: ehci-generic: check for
	companion controller
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

CgpPbiA4LzMwLzIzIDE3OjEyLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA4LzMwLzIzIDEwOjAw
LCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4+IEVIQ0kgaXMgdXN1YWxseSB1c2VkIHdpdGggY29t
cGFuaW9uIGNvbnRyb2xsZXIgKGxpa2UgT0hDSSkgYXMgY29tcGFuaW9uCj4+IGNvbnRyb2xsZXIu
IFRoaXMgaW5mb3JtYXRpb24gb24gdGhlIGNvbXBhbmlvbiBpcyBtaXNzaW5nIGN1cnJlbnRseSBp
bgo+PiBjb21wYW5pb24gZHJpdmVycy4KPj4gU28sIGlmIHRoZSB1c2ItdWNsYXNzIGlzbid0IGF3
YXJlLCBpdCBtYXkgc2NhbiBidXNzZXMgaW4gYW55IG9yZGVyOiBPSENJCj4+IGZpcnN0LCB0aGVu
IEVIQ0kuCj4+IFRoaXMgaXMgc2VlbiBvbiBTVE0zMk1QMSB3aGVyZSBEVCBwcm9iaW5nIG1ha2Vz
IHRoZSBwcm9iZSBvcmRlciB0byBvY2N1cgo+PiBieSBpbmNyZWFzaW5nIGFkZHJlc3MgKE9IQ0kg
YWRkcmVzcyA8IEVIQ0kgYWRkcmVzcykuCj4+Cj4+IFdoZW4gYSBsb3cgc3BlZWQgb3IgZnVsbC1z
cGVlZCBkZXZpY2UgaXMgcGx1Z2dlZCBpbiwgaXQncyBub3QgZGV0ZWN0ZWQgYXMKPj4gRUhDSSBz
aG91bGQgZmlyc3QgZGV0ZWN0IGl0LCBhbmQgZ2l2ZSBvd25lcnNoaXAgKGhhbmRvdmVyKSB0byBP
SENJLgo+Pgo+PiBDdXJyZW50IHNpdHVhdGlvbiBvbiBTVE0zMk1QMSAod2l0aCBhIGxvdyBzcGVl
ZCBkZXZpY2UgcGx1Z2dlZC1pbikKPj4gU1RNMzJNUD4gdXNiIHN0YXJ0Cj4+IHN0YXJ0aW5nIFVT
Qi4uLgo+PiBCdXMgdXNiQDU4MDBjMDAwOiBVU0IgT0hDSSAxLjAKPj4gQnVzIHVzYkA1ODAwZDAw
MDogVVNCIEVIQ0kgMS4wMAo+PiBzY2FubmluZyBidXMgdXNiQDU4MDBjMDAwIGZvciBkZXZpY2Vz
Li4uIDEgVVNCIERldmljZShzKSBmb3VuZAo+PiBzY2FubmluZyBidXMgdXNiQDU4MDBkMDAwIGZv
ciBkZXZpY2VzLi4uIDEgVVNCIERldmljZShzKSBmb3VuZAo+PiDCoMKgwqDCoMKgwqDCoCBzY2Fu
bmluZyB1c2IgZm9yIHN0b3JhZ2UgZGV2aWNlcy4uLiAwIFN0b3JhZ2UgRGV2aWNlKHMpIGZvdW5k
Cj4+Cj4+IFRoZSAiY29tcGFuaW9uIiBwcm9wZXJ0eSBpbiB0aGUgZGV2aWNlIHRyZWUgYWxsb3cg
dG8gcmV0cmlldmUgY29tcGFuaW9uCj4+IGNvbnRyb2xsZXIgaW5mb3JtYXRpb24sIGZyb20gdGhl
IEVIQ0kgbm9kZS4gVGhpcyBhbGxvdyBtYXJraW5nIHRoZQo+PiBjb21wYW5pb24gZHJpdmVyIGFz
IHN1Y2guCj4+Cj4+IFdpdGggdGhpcyBwYXRjaCAoc2FtZSBsb3cgc3BlZWQgZGV2aWNlIHBsdWdn
ZWQgaW4pOgo+PiBTVE0zMk1QPiB1c2Igc3RhcnQKPj4gc3RhcnRpbmcgVVNCLi4uCj4+IEJ1cyB1
c2JANTgwMGMwMDA6IFVTQiBPSENJIDEuMAo+PiBCdXMgdXNiQDU4MDBkMDAwOiBVU0IgRUhDSSAx
LjAwCj4+IHNjYW5uaW5nIGJ1cyB1c2JANTgwMGQwMDAgZm9yIGRldmljZXMuLi4gMSBVU0IgRGV2
aWNlKHMpIGZvdW5kCj4+IHNjYW5uaW5nIGJ1cyB1c2JANTgwMGMwMDAgZm9yIGRldmljZXMuLi4g
MiBVU0IgRGV2aWNlKHMpIGZvdW5kCj4+IMKgwqDCoMKgwqDCoMKgIHNjYW5uaW5nIHVzYiBmb3Ig
c3RvcmFnZSBkZXZpY2VzLi4uIDAgU3RvcmFnZSBEZXZpY2UocykgZm91bmQKPj4gU1RNMzJNUD4g
dXNiIHRyZWUKPj4gVVNCIGRldmljZSB0cmVlOgo+PiDCoMKgIDHCoCBIdWIgKDEyIE1iL3MsIDBt
QSkKPj4gwqDCoCB8wqDCoCBVLUJvb3QgUm9vdCBIdWIKPj4gwqDCoCB8Cj4+IMKgwqAgKy0ywqAg
SHVtYW4gSW50ZXJmYWNlICgxLjUgTWIvcywgMTAwbUEpCj4+IMKgwqDCoMKgwqDCoMKgIEhQIEhQ
IFVTQiAxMDAwZHBpIExhc2VyIE1vdXNlCj4+Cj4+IMKgwqAgMcKgIEh1YiAoNDgwIE1iL3MsIDBt
QSkKPj4gwqDCoMKgwqDCoCB1LWJvb3QgRUhDSSBIb3N0IENvbnRyb2xsZXIKPj4KPj4gVGhpcyBh
bHNvIG9wdGltaXplIGJ1cyBzY2FuIHdoZW4gYSBIaWdoIHNwZWVkIGRldmljZSBpcyBwbHVnZ2Vk
IGluLCBhcwo+PiB0aGUgdXNiLXVjbGFzcyBza2lwcyBPSENJIGluIHRoaXMgY2FzZToKPj4KPj4g
U1RNMzJNUD4gdXNiIHJlc2V0Cj4+IHJlc2V0dGluZyBVU0IuLi4KPj4gQnVzIHVzYkA1ODAwYzAw
MDogVVNCIE9IQ0kgMS4wCj4+IEJ1cyB1c2JANTgwMGQwMDA6IFVTQiBFSENJIDEuMDAKPj4gc2Nh
bm5pbmcgYnVzIHVzYkA1ODAwZDAwMCBmb3IgZGV2aWNlcy4uLiAyIFVTQiBEZXZpY2UocykgZm91
bmQKPj4gwqDCoMKgwqDCoMKgwqAgc2Nhbm5pbmcgdXNiIGZvciBzdG9yYWdlIGRldmljZXMuLi4g
MSBTdG9yYWdlIERldmljZShzKSBmb3VuZAo+PiBTVE0zMk1QPiB1c2IgdHJlZQo+PiBVU0IgZGV2
aWNlIHRyZWU6Cj4+IMKgwqAgMcKgIEh1YiAoNDgwIE1iL3MsIDBtQSkKPj4gwqDCoCB8wqAgdS1i
b290IEVIQ0kgSG9zdCBDb250cm9sbGVyCj4+IMKgwqAgfAo+PiDCoMKgICstMsKgIE1hc3MgU3Rv
cmFnZSAoNDgwIE1iL3MsIDIwMG1BKQo+PiDCoMKgwqDCoMKgwqDCoCBTYW5EaXNrIENydXplciBC
bGFkZSAwMzAwMzQzMjAyMTkyMjAxMTQwNwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEdh
c25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGRyaXZl
cnMvdXNiL2hvc3QvZWhjaS1nZW5lcmljLmMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysK
PiAKPiBNb3JlIG9mIGEgZGVzaWduIHF1ZXN0aW9uIC0tIHNob3VsZG4ndCB0aGUgdXNiLXVjbGFz
cyBoYW5kbGUgdGhpcwo+IHByb3BlcnR5IGFkIG1hbmlwdWxhdGUgd2l0aCBwcml2YXRlIGRhdGEg
b2YgInJlbW90ZSIgZGV2aWNlcyBpbnN0ZWFkID8KCkhpIE1hcmVrLAoKVGhhdCdzIGFuIG9wdGlv
biBJIGhhdmVuJ3QgcmVhbGx5IGV4cGxvcmVkIGVhcmxpZXIuIEkgd2FzIGEgYml0IGNvbmZ1c2Vk
CndoZW4gSSBmaWd1cmVkIG91dCB0aGUgdXNiLXVjbGFzcyB3YXMgYWJsZSB0byBtYW5hZ2UgdGhl
IGNvbXBhbmlvbgpjb250cm9sbGVyLCBieSB1c2luZyB0aGUgImNvbXBhbmlvbiIgZmxhZy4gQnV0
IEkgY291bGRuJ3QgZmluZCBhbnkKZHJpdmVyIHRoYXQgd2FzIGFjdHVhbGx5IHVzaW5nIHRoaXMg
ZmxhZyA6LU8uCgpTbyBJIGhhZCBhIGxvb2sgYXQgdGhlIGdpdCBsb2csIGFuZCBJIGZvdW5kIG91
dDoKLSBDb21wYW5pb24gaGFzIGJlZW4gaW50cm9kdWNlZCBpbjoKYjZkZTRkMTA5M2QzIGRtOiB1
c2I6IEFkZCBzdXBwb3J0IGZvciBjb21wYW5pb24gY29udHJvbGxlcnMKCi0gRmlyc3QgdXNlciBm
b3IgdGhpcyBmbGFnIHdhcyBpbnRyb2R1Y2VkIGluIHNhbWUgc2VyaWVzOgo2YTcyZTgwNGEyYjIg
c3VueGk6IG9oY2k6IEFkZCBvaGNpIHVzYiBob3N0IGNvbnRyb2xsZXIgc3VwcG9ydAplLmcuIGRy
aXZlcnMvdXNiL2hvc3Qvb2hjaS1zdW54aS5jCgpTbywgaW4gdGhlIG9yaWdpbmFsIGRlc2lnbiwg
dGhlIGZsYWcgd2FzIHNldCBpbiBPSENJIGNvbnRyb2xsZXIgZHJpdmVyCnNpZGUuIFRoaXMgaXMg
d2h5IEkgaW1wbGVtZW50ZWQgdGhpcyBpbiBjb250cm9sbGVyIGRyaXZlciwgYnV0IGluIEVIQ0kK
Z2VuZXJpYyBkcml2ZXIsIGJlY2F1c2UgaXQgaGFzIHRoZSBjb21wYW5pb24gcHJvcGVydHkgKG5v
dCBpbiBPSENJIG5vZGUpLgoKLSBMYXRlciB0aGlzIGRyaXZlciBoYXMgYmVlbiBkcm9wcGVkIGlu
LCB0byB1c2UgdGhlIGdlbmVyaWMgT0hDSSBkcml2ZXIKaW5zdGVhZDogNTQzMDQ5YWI1OTA2IHVz
YjogaG9zdDogRHJvcCBbZS1vXWhjaS1zdW54aSBkcml2ZXJzCgpJdCBsb29rcyBsaWtlIHRoYXQg
c2V0dGluZyB0aGUgY29tcGFuaW9uIGZsYWcgaGFzIGJlZW4gbWlzc2VkIHdoZW4KbW92aW5nIHRv
IE9IQ0kgZ2VuZXJpYyBkcml2ZXIuIEkgYWRtaXQgdGhlIHN0cmFuZ2UgdGhpbmcgd2l0aCBjdXJy
ZW50CmFwcHJvYWNoIGlzOiBpbXBsZW1lbnRhdGlvbiBpcyBkb25lIGluIEVIQ0kgZHJpdmVyLCB0
byBpbXBhY3QgT0hDSQpwcml2YXRlIHN0cnVjdC4KCkknbGwgc2VuZCBhIHYyLCB0byBoYW5kbGUg
dGhpcyBpbiB1c2ItdWNsYXNzIGFzIHlvdSBzdWdnZXN0LiBUaGlzIG1ha2VzCnNlbnNlLgoKVGhh
bmtzIGZvciByZXZpZXdpbmcsCkJlc3QgUmVnYXJkcywKRmFicmljZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0
ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
