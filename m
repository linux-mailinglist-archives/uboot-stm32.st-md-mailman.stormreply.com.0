Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172A64B763
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Dec 2022 15:31:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C0C8C65E61;
	Tue, 13 Dec 2022 14:31:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9A79C03FC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 14:31:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDDtxDs021357; Tue, 13 Dec 2022 15:31:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5a9CVPA7OQfyBMUnzp6ZqNqPYzCfIjwvu+KOIR2YznA=;
 b=ENh1ZIwo9YuzTAnr6kLXi4Q8w3xhpVtrEjd7n6uYWgMHmSukk1zrVhL8Hz0r353pcQB/
 dSj9NUrujwbkBqdrb7rThiGIvulJNDFaVnL5zJDbPwWgtEmLw6K4qDxijHIGQfFVTIyT
 nPPzMNaRXKTVXQAFsRRL/Y7UdJjD/tgS+y7W8h8TfTo0Vbf0C2+zyE6nyl8O15wbBexD
 qJNhe0BbeKPQ5AC9sKY+EU3KHIy5qXVhQRtM7hmqU4/bPNpqMRntvzdhK9xFVZlme55+
 8ASZmKeISA6rrMR9rN5VyxKVCQitGMz1VleHffaQVRBWy3jYTy/paXAHHqK49DKbAUaX Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mepxx1vn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 15:31:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F01210002A;
 Tue, 13 Dec 2022 15:31:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E75AE229A8B;
 Tue, 13 Dec 2022 15:31:30 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 13 Dec
 2022 15:31:29 +0100
Message-ID: <5ce0e4ad-b015-3487-614c-a60099dbede9@foss.st.com>
Date: Tue, 13 Dec 2022 15:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Quentin Schulz
 <quentin.schulz@theobroma-systems.com>, <u-boot@lists.denx.de>
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <b7e891d1-d134-b489-eb2d-6125d4c7b6c6@theobroma-systems.com>
 <5f67e057-c41a-d4a0-b199-5840ae771e35@linaro.org>
 <f0dd213c-4a34-926d-3f3b-f2ed49bb92c3@linaro.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <f0dd213c-4a34-926d-3f3b-f2ed49bb92c3@linaro.org>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
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

SGksCgpPbiAxMS8yMi8yMiAyMDo0MywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMjIvMTEv
MjAyMiAyMDoxMSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAyMS8xMS8y
MDIyIDEzOjIzLCBRdWVudGluIFNjaHVseiB3cm90ZToKPj4+IEhpIFBhdHJpY2ssCj4+Pgo+Pj4g
VGhhbmtzIGZvciBsb29raW5nIGF0IGl0Lgo+Pj4KPj4+IE9uIDEwLzI4LzIyIDExOjAxLCBQYXRy
aWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4+Cj4+Pj4gU2luY2UgdGhlIGNvbW1pdCBkNWJhNjE4OGRm
YmYgKCJjbWQ6IHB4ZV91dGlsczogQ2hlY2sgZmR0Y29udHJvbGFkZHIKPj4+PiBpbiBsYWJlbF9i
b290IikgdGhlIEZEVCBvciB0aGUgRkRURElSIGxhYmVsIGlzIHJlcXVpcmVkIGluIAo+Pj4+IGV4
dGxpbnV4LmNvbmYKPj4+PiBhbmQgdGhlIGZhbGxiYWNrIGRvbmUgYnkgYm9vdG0gY29tbWFuZCB3
aGVuIG9ubHkgdGhlIGRldmljZSB0cmVlIGlzIAo+Pj4+IHByZXNlbnQKPj4+PiBpbiB0aGlzIGNv
bW1hbmQgcGFyYW1ldGVycyBpcyBubyBtb3JlIHBlcmZvcm1lZCB3aGVuIEZJVCBpcyB1c2VkIGZv
cgo+Pj4+IGtlcm5lbC4KPj4+Pgo+Pj4+IFRoZSBuZXh0IGZpbGUgImV4dGxpbnV4LmNvbmYiIG5v
IG1vcmUgc2VsZWN0cyB0aGUgZGV2aWNlIHRyZWUgaW4gRklUCj4+Pj4gYnV0IHVzZSB0aGUgcHhl
IGZhbGxiYWNrIHdpdGggdGhlIGRldmljZSB0cmVlIG9mIFUtQm9vdC4KPj4+Pgo+Pj4+IG1lbnUg
dGl0bGUgU2VsZWN0IHRoZSBib290IG1vZGUKPj4+PiBERUZBVUxUIHRlc3QKPj4+PiBMQUJFTCB0
ZXN0Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBLRVJORUwgL2ZpdEltYWdlCj4+Pj4KPj4+PiBUaGlz
IHNlcmllIHJlc3RvcmVzIHRoZSBwb3NzaWJpbGl0eSB0byB1c2UgYSBGSVQgaW4gZXh0bGludXgu
Y29uZgo+Pj4+IGJ5IHVzaW5nIEZEVCBsYWJlbCB3aXRoIHRoZSBzYW1lIHN0cmluZy4KPj4+Pgo+
Pj4+IG1lbnUgdGl0bGUgU2VsZWN0IHRoZSBib290IG1vZGUKPj4+PiBERUZBVUxUIHRlc3QKPj4+
PiBMQUJFTCB0ZXN0Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBLRVJORUwgL2ZpdEltYWdlCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoCBGRFQgL2ZpdEltYWdlCj4+Pj4KPj4+PiBldmVuIHdoZW4gYSBzcGVj
aWZpYyBGSVQgY29uZmlnIGlzIHVzZWQ6Cj4+Pj4KPj4+PiBtZW51IHRpdGxlIFNlbGVjdCB0aGUg
Ym9vdCBtb2RlCj4+Pj4gREVGQVVMVCB0ZXN0Cj4+Pj4gTEFCRUwgdGVzdAo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqAgS0VSTkVMIC9maXRJbWFnZSNjb25maWcKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIEZE
VCAvZml0SW1hZ2UjY29uZmlnCj4+Pj4KPj4+PiBUaGUgbGFzdCBjb21taXQgb2YgdGhlIHNlcmll
cyBpcyBvbmx5IGEgbWlub3IgaW1wcm92ZW1lbnQuCj4+Pj4KPj4+Cj4+PiBJIHRlc3RlZCB0aGlz
IG9uIG15IFB1bWEgUkszMzk5IGFuZCBpdCBkb2VzIHdvcmsgYWdhaW4sIHRoYW5rcy4KPj4+Cj4+
PiBIb3dldmVyLCBJJ20gbm90IHN1cmUgdGhpcyBpcyB3aGF0IHdlIHNob3VsZCBnbyBmb3I/Cj4+
Pgo+Pj4gTXkgd29ycnkgaXMgdGhlIGZvbGxvd2luZzoKPj4+IFdoYXQgaGFwcGVucyBmb3Igb2xk
IHJlbGVhc2VzIChwcmUtdjIwMjIuMDQpIHdoZXJlIEtFUk5FTCB3b3JrZWQgCj4+PiBqdXN0IGZp
bmUgd2l0aG91dCB0aGUgRkRUIHRvIGxvYWQgdGhlIGZkdCBmcm9tIHRoZSBmaXRpbWFnZSBjb25m
IAo+Pj4gc3BlY2lmaWVkIGluIEtFUk5FTCBmaWVsZD8gV291bGQgd2Ugbm93IG5lZWQgdG8ga2Vl
cCBhbiAKPj4+IGV4dGxpbnV4LmNvbmYgZm9yIHByZS0yMDIyLjA0IHJlbGVhc2VzIHdoZXJlIEZE
VCB3b3VsZG4ndCBiZSBzZXQgYW5kIAo+Pj4gb25lIGZvciAyMDIzLjAxIGFuZCBsYXRlciB3aGVy
ZSBGRFQgd291bGQgYmUgbWVudGlvbmVkPyBUaGF0IGRvZXMgCj4+PiBub3Qgc2VlbSBsaWtlIGEg
Z29vZCB0aGluZyBmb3IgZGlzdHJvcy4KPj4+Cj4+PiBJIHVuZm9ydHVuYXRlbHkgY2Fubm90IGFu
c3dlciB0aGUgcXVlc3Rpb24gbXlzZWxmIHdpdGhvdXQgc3BlbmRpbmcgCj4+PiBzaWduaWZpY2Fu
dCBlZmZvcnQgcGF0Y2hpbmcgdjIwMjIuMDEgdG8gZ2V0IGl0IHRvIHdvcmsgb24gb3VyIFB1bWEg
Cj4+PiBtb2R1bGUuIERvZXMgYW55b25lIGhhdmUgYWNjZXNzIHRvIGEgYm9hcmQgdG8gcXVpY2ts
eSBjaGVjayBhbiAKPj4+IGV4dGxpbnV4LmNvbmYgd2l0aCBLRVJORUwgYW5kIEZEVCBzZXQgdG8g
L2ZpdEltYWdlIG9uIGEgdjIwMjIuMDEgCj4+PiByZWxlYXNlPwo+Pgo+PiBJJ20gYnVpbGRpbmcg
a2lya3N0b25lIGltYWdlcyB3aXRoIG1ldGEtbWVzb24gaGF2aW5nIHYyMDIyLjAxLCBJJ2xsIAo+
PiB0ZXN0IHdpdGggRkRUIHNldCB0byAvZml0SW1hZ2UgdG8gc2VlIGlmIGl0IGJyZWFrcy4KPgo+
IEl0IGJyZWFrczoKPiBGb3VuZCAvZXh0bGludXgvZXh0bGludXguY29uZgo+IFJldHJpZXZpbmcg
ZmlsZTogL2V4dGxpbnV4L2V4dGxpbnV4LmNvbmYKPiAxOsKgwqDCoCBZb2N0bwo+IFJldHJpZXZp
bmcgZmlsZTogL2ZpdEltYWdlCj4gYXBwZW5kOiByb290PVBBUlRVVUlEPTNlYmMwMDA1LTAyIHJv
b3R3YWl0IGNvbnNvbGU9dHR5QU1MMCwxMTUyMDAKPiBSZXRyaWV2aW5nIGZpbGU6IC9maXRJbWFn
ZQo+IEJhZCBMaW51eCBBUk02NCBJbWFnZSBtYWdpYyEKPiBTQ1JJUFQgRkFJTEVEOiBjb250aW51
aW5nLi4uCj4KCkNhbiB5b3Ugc2hhcmUgdGhlIGV4dGxpbnV4IGZpbGUgdXNlZCBmb3IgeW91ciB0
ZXN0ID9kbyB5b3UgaGF2ZSBteSBwYXRjaCA/CgoKYmVjYXVzZSBJIHRlc3QgdGhlIGNvbmZpZyBv
biBteSBib2FyZCAoU1RNMzJNUDE1eCAvIGFybXY3KSB0aGUgMiBjYXNlcyA6CgoKREVGQVVMVCB0
ZXN0CkxBQkVMIHRlc3QKIMKgwqDCoMKgwqDCoMKgwqAgS0VSTkVMIC9maXRJbWFnZQogwqDCoMKg
wqDCoMKgwqDCoCBGRFQgL2ZpdEltYWdlCgoKQW5kCgoKREVGQVVMVCB0ZXN0CkxBQkVMIHRlc3QK
IMKgwqDCoMKgwqDCoMKgwqAgS0VSTkVMIC9maXRJbWFnZSNjb25maWcKIMKgwqDCoMKgwqDCoMKg
wqAgRkRUIC9maXRJbWFnZSNjb25maWcKCgphbmQgbm9ybWFsbHkgdGhlIGZpbGUgaXMgcmV0cmll
dmVkIG9uZSB0aW1lID0+ICIvZml0SW1hZ2UiCgphbmQgaW4gdGhlIHRyYWNlIGl0IGlzIHJldHJp
ZXZpbmcgMiB0aW1lcyA9ICJSZXRyaWV2aW5nIGZpbGU6IC9maXRJbWFnZSIgCmFuZCBpdCBpcyBz
dGFuZ2UKCgpJIGtub3cgSSBoYXZlIGxpbWl0YXRpb24gZm9yIG1peGVkIGNvbmZpZzoKCkRFRkFV
TFQgdGVzdApMQUJFTCB0ZXN0CiDCoMKgwqDCoMKgwqDCoMKgIEtFUk5FTCAvZml0SW1hZ2UKIMKg
wqDCoMKgwqDCoMKgwqAgRkRUIC9maXRJbWFnI2NvbmZpZwoKCkRvIHlvdSBoYXZlIHRoaXMgdHlw
ZSBvZiBleHRsaW51eC5jb25mID8KCgo+Pgo+PiBOZWlsCj4+Cj4+Pgo+Pj4gSXMgdGhlcmUgcmVh
bGx5IG5vIG90aGVyIHdheSB0aGFuIGFkZGluZyB0aGlzIG5ldyByZXF1aXJlbWVudD8gCj4+PiAo
Tm90aGluZyBhZ2FpbnN0IGl0IGlmIGl0IGRvZXMgbm90IGJyZWFrIG9sZGVyIHJlbGVhc2VzIHdp
dGggdGhlIAo+Pj4gIm5ldyIgZXh0bGludXguY29uZiB0aG91Z2gpLgoKClRoZSBjb21taXQgZDVi
YTYxODhkZmJmICgiY21kOiBweGVfdXRpbHM6IENoZWNrIGZkdGNvbnRyb2xhZGRyIGluIApsYWJl
bF9ib290IikgYXJlYWR5IGJyZWFrIHRoZSBleHRsaW51eC5jb25mIHN1cHBvcnQuLi4uLgoKPT4g
RlREIG9yIEZEVERJUiBpcyBub3cgbWFuZGF0b3J5IHNvIHBvdGVudGlhbGx5LCBzb21lIHdvcmtp
bmcgCmV4dGxpbnV4LmNvbmYgaXMgb3QgbW9yZSB3b3JraW5nCgogwqAgwqAgwqAgc2luY2XCoCB2
MjAyMi4wMS1yYzIKCgpGb3IgZXhhbXBsZToKCgptZW51IHRpdGxlIFNlbGVjdCB0aGUgYm9vdCBt
b2RlCkRFRkFVTFQgdGVzdApMQUJFTCB0ZXN0CiDCoMKgwqDCoMKgwqDCoMKgIEtFUk5FTCAvZml0
SW1hZ2UKCgpCdXQgdGhpcyBpc3N1ZSBpcyBub3QgbGlua2VkIHRvIHRoaXMgc2VyaWUsCgpJIGp1
c3QgdHJ5IHRvIGNvcnJlY3QgdGhlIHJlZ3Jlc3Npb24KCi0ga2VlcCB0aGUgbmV3IGJlaGF2aW9y
ICh1c2VmdWxsIHdoZW4gRklUIGlzIG5vdCB1c2VkKQoKLSBhZGQgYSB3YXkgdG8gaGF2ZSBhIGZ1
bmN0aW9uYWwgZXh0bGludXguY29uZiBmb3IgRklUCgogwqDCoCAoZXZlbiBpZiBleHRsaW51eC5j
b25mIGZpbGVzIG5lZWQgdG8gYmUgbW9kaWZpZWQgYW5kIGl0IGlzIGRpZmZpY3VsdCAKZm9yICdk
aXN0cm9zJykKCgo+Pj4KPj4+IENoZWVycywKPj4+IFF1ZW50aW4KPj4KPgoKSSBkb24ndCBmb3Vu
ZCBhIG90aGVyIHNvbHV0aW9uIC8gYmV0dGVyIHNvbHV0aW9uIGZvciB2MjAyLjAxID0+IHYyMDIz
LjAxLi4uCgpSZWdhcmRzCgoKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
