Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 519AE4E620A
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Mar 2022 12:03:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A36BC60496;
	Thu, 24 Mar 2022 11:03:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EBA9C60469
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 11:03:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22O7sfc1010580;
 Thu, 24 Mar 2022 12:03:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PaLZGcjSINaWnioQCyXsMXKzHbA4EF/xeMIpHu9F3q4=;
 b=D5OR4EXdET2RmzjTWqd7VlmFzYAxyRqVwNLkNKCxSbVyxk5hcVa+Mse77cLS5P0YDa+l
 KPMAiQ3G+rT8gK3pe01NgNgVp4ljhqOBbA/nZWGypB3zBlJCNyB8SBDwmgZIg+V73LEb
 lGQ+jLIL8kQgeo3HJJHy4FJOozoz6LovIzSsB8a+4Zzdbp+k3KX3CQcCTA7jZXvk09Gu
 rq/zlkmT2dEYMB2tn071uHiCJN936Us1udoGIrUavYSwMgllG8nldYA/ZT/iAHn6G5TV
 LtvNAVwNapw3kQoJWrnA6EMBoWXN+XX/3ys6HOVnrnl3HoVGnt80SrqkC+Gz92u/FF1U 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew5fppng5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 12:03:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E829610002A;
 Thu, 24 Mar 2022 12:03:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CDC4B227886;
 Thu, 24 Mar 2022 12:03:25 +0100 (CET)
Received: from [10.48.0.213] (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 24 Mar
 2022 12:03:25 +0100
Message-ID: <3250c951-7a01-c2f6-e25c-ef65cbe3deae@foss.st.com>
Date: Thu, 24 Mar 2022 12:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20220322150558.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
 <30f14c6e-bc88-40cf-49b8-d2beecbf0ee8@gmx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <30f14c6e-bc88-40cf-49b8-d2beecbf0ee8@gmx.de>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_03,2022-03-24_01,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/3] rng: add OP-TEE based Random Number
	Generator
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

SGksCgpPbiAzLzIyLzIyIDE1OjM4LCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+IE9uIDMv
MjIvMjIgMTU6MDYsIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+IEFkZCBkcml2ZXIgZm9yIE9Q
LVRFRSBiYXNlZCBSYW5kb20gTnVtYmVyIEdlbmVyYXRvciBvbiBBUk0gU29Dcwo+PiB3aGVyZSBo
YXJkd2FyZSBlbnRyb3B5IHNvdXJjZXMgYXJlIG5vdCBhY2Nlc3NpYmxlIHRvIG5vcm1hbCB3b3Js
ZAo+PiBhbmQgdGhlIFJORyBzZXJ2aWNlIGlzIHByb3ZpZGVkIGJ5IGEgSFdSTkcgVHJ1c3RlZCBB
cHBsaWNhdGlvbiAoVEEpLgo+Pgo+PiBUaGlzIGRyaXZlciBpcyBiYXNlZCBvbiB0aGUgbGludXgg
ZHJpdmVyOiBjaGFyL2h3X3JhbmRvbS9vcHRlZS1ybmcuYwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4K
Pj4gwqAgTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+IMKg
IGRyaXZlcnMvcm5nL0tjb25maWfCoMKgwqDCoCB8wqDCoCA4ICsrKwo+PiDCoCBkcml2ZXJzL3Ju
Zy9NYWtlZmlsZcKgwqDCoCB8wqDCoCAxICsKPj4gwqAgZHJpdmVycy9ybmcvb3B0ZWVfcm5nLmMg
fCAxNTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDCoCA0IGZp
bGVzIGNoYW5nZWQsIDE2NiBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3JuZy9vcHRlZV9ybmcuYwo+Pgo+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUwo+PiBpbmRleCBmMjVjYTdjZDAwLi4zMzU2YzY1ZGQwIDEwMDY0NAo+PiAtLS0g
YS9NQUlOVEFJTkVSUwo+PiArKysgYi9NQUlOVEFJTkVSUwo+PiBAQCAtNDgxLDYgKzQ4MSw3IEBA
IEY6wqDCoMKgIGRyaXZlcnMvcG93ZXIvcmVndWxhdG9yL3N0cG1pYzEuYwo+PiDCoCBGOsKgwqDC
oCBkcml2ZXJzL3JhbS9zdG0zMm1wMS8KPj4gwqAgRjrCoMKgwqAgZHJpdmVycy9yZW1vdGVwcm9j
L3N0bTMyX2NvcHJvLmMKPj4gwqAgRjrCoMKgwqAgZHJpdmVycy9yZXNldC9zdG0zMi1yZXNldC5j
Cj4+ICtGOsKgwqDCoCBkcml2ZXJzL3JuZy9vcHRlZV9ybmcuYwo+PiDCoCBGOsKgwqDCoCBkcml2
ZXJzL3JuZy9zdG0zMm1wMV9ybmcuYwo+PiDCoCBGOsKgwqDCoCBkcml2ZXJzL3J0Yy9zdG0zMl9y
dGMuYwo+PiDCoCBGOsKgwqDCoCBkcml2ZXJzL3NlcmlhbC9zZXJpYWxfc3RtMzIuKgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ybmcvS2NvbmZpZyBiL2RyaXZlcnMvcm5nL0tjb25maWcKPj4gaW5k
ZXggYjFjNWFiOTNkMS4uYTAyYzU4NWY2MSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ybmcvS2Nv
bmZpZwo+PiArKysgYi9kcml2ZXJzL3JuZy9LY29uZmlnCj4+IEBAIC0zMSw2ICszMSwxNCBAQCBj
b25maWcgUk5HX01TTQo+PiDCoMKgwqDCoMKgwqDCoCBUaGlzIGRyaXZlciBwcm92aWRlcyBzdXBw
b3J0IGZvciB0aGUgUmFuZG9tIE51bWJlcgo+PiDCoMKgwqDCoMKgwqDCoCBHZW5lcmF0b3IgaGFy
ZHdhcmUgZm91bmQgb24gUXVhbGNvbW0gU29Dcy4KPj4KPj4gK2NvbmZpZyBSTkdfT1BURUUKPj4g
K8KgwqDCoCBib29sICJPUC1URUUgYmFzZWQgUmFuZG9tIE51bWJlciBHZW5lcmF0b3Igc3VwcG9y
dCIKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIERNX1JORyAmJiBPUFRFRQo+PiArwqDCoMKgIGhlbHAK
Pj4gK8KgwqDCoMKgwqAgVGhpcyBkcml2ZXIgcHJvdmlkZXMgc3VwcG9ydCBmb3IgT1AtVEVFIGJh
c2VkIFJhbmRvbSBOdW1iZXIKPj4gK8KgwqDCoMKgwqAgR2VuZXJhdG9yIG9uIEFSTSBTb0NzIHdo
ZXJlIGhhcmR3YXJlIGVudHJvcHkgc291cmNlcyBhcmUgbm90Cj4+ICvCoMKgwqDCoMKgIGFjY2Vz
c2libGUgdG8gbm9ybWFsIHdvcmxkLgo+Cj4KPiBodHRwczovL29wdGVlLnJlYWR0aGVkb2NzLmlv
L2VuL2xhdGVzdC9hcmNoaXRlY3R1cmUvcG9ydGluZ19ndWlkZWxpbmVzLmh0bWwgCj4KPiBoYXM6
Cj4KPiAiQnkgZGVmYXVsdCBPUC1URUUgaXMgY29uZmlndXJlZCB3aXRoIGEgc29mdHdhcmUgUFJO
Ry4gVGhlIGVudHJvcHkgaXMKPiBhZGRlZCB0byBzb2Z0d2FyZSBQUk5HIGF0IHZhcmlvdXMgcGxh
Y2VzLCBidXQgdW5mb3J0dW5hdGVseSBpdCBpcyBzdGlsbAo+IHF1aXRlIGVhc3kgdG8gcHJlZGlj
dCB0aGUgZGF0YSBhZGRlZCBhcyBlbnRyb3B5LiBBcyBhIGNvbnNlcXVlbmNlLAo+IHVubGVzcyB0
aGUgUk5HIGlzIGJhc2VkIG9uIGhhcmR3YXJlIHRoZSBnZW5lcmF0ZWQgcmFuZG9tIHdpbGwgYmUg
cXVpdGUKPiB3ZWFrLiIKPgo+IEhhdmluZyBhIHNpbWlsaWFyIHdhcm5pbmcgaW4gdGhlIGxvbmcg
dGV4dCBmb3IgdGhlIENPTkZJR19STkdfT1BURUUKPiBzeW1ib2wgd291bGQgYmUgaGVscGZ1bC4K
PgoKSSBwcm9wb3NlIHNvbWV0aGluZyBhcyA6CgoKK2NvbmZpZyBSTkdfT1BURUUKK8KgwqDCoCBi
b29sICJPUC1URUUgYmFzZWQgUmFuZG9tIE51bWJlciBHZW5lcmF0b3Igc3VwcG9ydCIKK8KgwqDC
oCBkZXBlbmRzIG9uIERNX1JORyAmJiBPUFRFRQorwqDCoMKgIGhlbHAKK8KgwqDCoMKgwqAgVGhp
cyBkcml2ZXIgcHJvdmlkZXMgc3VwcG9ydCBmb3IgT1AtVEVFIGJhc2VkIFJhbmRvbSBOdW1iZXIK
K8KgwqDCoMKgwqAgR2VuZXJhdG9yIG9uIEFSTSBTb0NzIHdoZXJlIGhhcmR3YXJlIGVudHJvcHkg
c291cmNlcyBhcmUgbm90CivCoMKgwqDCoMKgIGFjY2Vzc2libGUgdG8gbm9ybWFsIHdvcmxkIGJ1
dCByZXNlcnZlZCBhbmQgdXNlZCBieSB0aGUgT1AtVEVFCgorwqDCoMKgwqDCoCB0byBhdm9pZCB3
ZWFrbmVzcyBvZiB0aGUgc29mdHdhcmUgUFJORy4KCgo+PiArCj4+IMKgIGNvbmZpZyBSTkdfU1RN
MzJNUDEKPj4gwqDCoMKgwqDCoCBib29sICJFbmFibGUgcmFuZG9tIG51bWJlciBnZW5lcmF0b3Ig
Zm9yIFNUTTMyTVAxIgo+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQVJDSF9TVE0zMk1QCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3JuZy9NYWtlZmlsZSBiL2RyaXZlcnMvcm5nL01ha2VmaWxlCj4+
IGluZGV4IDM5ZjdlZTNmMDMuLjQzNWIzYjk2NWEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcm5n
L01ha2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvcm5nL01ha2VmaWxlCj4+IEBAIC03LDYgKzcsNyBA
QCBvYmotJChDT05GSUdfRE1fUk5HKSArPSBybmctdWNsYXNzLm8KPj4gwqAgb2JqLSQoQ09ORklH
X1JOR19NRVNPTikgKz0gbWVzb24tcm5nLm8KPj4gwqAgb2JqLSQoQ09ORklHX1JOR19TQU5EQk9Y
KSArPSBzYW5kYm94X3JuZy5vCj4+IMKgIG9iai0kKENPTkZJR19STkdfTVNNKSArPSBtc21fcm5n
Lm8KPj4gK29iai0kKENPTkZJR19STkdfT1BURUUpICs9IG9wdGVlX3JuZy5vCj4+IMKgIG9iai0k
KENPTkZJR19STkdfU1RNMzJNUDEpICs9IHN0bTMybXAxX3JuZy5vCj4+IMKgIG9iai0kKENPTkZJ
R19STkdfUk9DS0NISVApICs9IHJvY2tjaGlwX3JuZy5vCj4+IMKgIG9iai0kKENPTkZJR19STkdf
SVBST0MyMDApICs9IGlwcm9jX3JuZzIwMC5vCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JuZy9v
cHRlZV9ybmcuYyBiL2RyaXZlcnMvcm5nL29wdGVlX3JuZy5jCj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmEwODMzZDA4NjIKPj4gLS0tIC9kZXYvbnVsbAo+PiAr
KysgYi9kcml2ZXJzL3JuZy9vcHRlZV9ybmcuYwo+PiBAQCAtMCwwICsxLDE1NiBAQAo+PiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArIE9SIEJTRC0zLUNsYXVzZQo+PiArLyoK
Pj4gKyAqIENvcHlyaWdodCAoQykgMjAyMiwgU1RNaWNyb2VsZWN0cm9uaWNzIC0gQWxsIFJpZ2h0
cyBSZXNlcnZlZAo+PiArICovCj4+ICsjZGVmaW5lIExPR19DQVRFR09SWSBVQ0xBU1NfUk5HCj4+
ICsKPj4gKyNpbmNsdWRlIDxjb21tb24uaD4KPj4gKwo+PiArI2luY2x1ZGUgPHJuZy5oPgo+PiAr
I2luY2x1ZGUgPHRlZS5oPgo+PiArI2luY2x1ZGUgPGRtL2RldmljZS5oPgo+PiArI2luY2x1ZGUg
PGRtL2RldmljZV9jb21wYXQuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9zaXplcy5oPgo+PiArCj4+
ICsjZGVmaW5lIFRFRV9FUlJPUl9IRUFMVEhfVEVTVF9GQUlMwqDCoMKgIDB4MDAwMDAwMDEKPj4g
Kwo+PiArLyoKPj4gKyAqIFRBX0NNRF9HRVRfRU5UUk9QWSAtIEdldCBFbnRyb3B5IGZyb20gUk5H
Cj4+ICsgKgo+PiArICogcGFyYW1bMF0gKGlub3V0IG1lbXJlZikgLSBFbnRyb3B5IGJ1ZmZlciBt
ZW1vcnkgcmVmZXJlbmNlCj4+ICsgKiBwYXJhbVsxXSB1bnVzZWQKPj4gKyAqIHBhcmFtWzJdIHVu
dXNlZAo+PiArICogcGFyYW1bM10gdW51c2VkCj4+ICsgKgo+PiArICogUmVzdWx0Ogo+PiArICog
VEVFX1NVQ0NFU1MgLSBJbnZva2UgY29tbWFuZCBzdWNjZXNzCj4+ICsgKiBURUVfRVJST1JfQkFE
X1BBUkFNRVRFUlMgLSBJbmNvcnJlY3QgaW5wdXQgcGFyYW0KPj4gKyAqIFRFRV9FUlJPUl9OT1Rf
U1VQUE9SVEVEIC0gUmVxdWVzdGVkIGVudHJvcHkgc2l6ZSBncmVhdGVyIHRoYW4gCj4+IHNpemUg
b2YgcG9vbAo+PiArICogVEVFX0VSUk9SX0hFQUxUSF9URVNUX0ZBSUwgLSBDb250aW51b3VzIGhl
YWx0aCB0ZXN0aW5nIGZhaWxlZAo+PiArICovCj4+ICsjZGVmaW5lIFRBX0NNRF9HRVRfRU5UUk9Q
WcKgwqDCoMKgwqDCoMKgIDB4MAo+PiArCj4+ICsjZGVmaW5lIE1BWF9FTlRST1BZX1JFUV9TWsKg
wqDCoMKgwqDCoMKgIFNaXzRLCj4+ICsKPj4gKyNkZWZpbmUgVEFfSFdSTkdfVVVJRCB7IDB4YWI3
YTYxN2MsIDB4YjhlNywgMHg0ZDhmLCBcCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsgMHg4
MywgMHgwMSwgMHhkMCwgMHg5YiwgMHg2MSwgMHgwMywgMHg2YiwgMHg2NCB9IH0KPj4gKwo+PiAr
LyoqCj4+ICsgKiBzdHJ1Y3Qgb3B0ZWVfcm5nX3ByaXYgLSBPUC1URUUgUmFuZG9tIE51bWJlciBH
ZW5lcmF0b3IgcHJpdmF0ZSBkYXRhCj4+ICsgKiBAc2Vzc2lvbl9pZDrCoMKgwqDCoMKgwqDCoCBS
TkcgVEEgc2Vzc2lvbiBpZGVudGlmaWVyLgo+PiArICovCj4+ICtzdHJ1Y3Qgb3B0ZWVfcm5nX3By
aXYgewo+PiArwqDCoMKgIHUzMiBzZXNzaW9uX2lkOwo+PiArfTsKPj4gKwo+Cj4gUGxlYXNlLCBw
cm92aWRlIGFzIFNwaGlueCBzdHlsZSBmdW5jdGlvbiBkZXNjcmlwdGlvbi4KPgoKT0sKCgo+PiAr
c3RhdGljIGludCBnZXRfb3B0ZWVfcm5nX2RhdGEoc3RydWN0IHVkZXZpY2UgKmRldiwKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHRlZV9zaG0gKmVudHJvcHlf
c2htX3Bvb2wsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgKmJ1
Ziwgc2l6ZV90ICpzaXplKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBvcHRlZV9ybmdfcHJpdiAq
cHJpdiA9IGRldl9nZXRfcHJpdihkZXYpOwo+PiArwqDCoMKgIGludCByZXQgPSAwOwo+PiArwqDC
oMKgIHN0cnVjdCB0ZWVfaW52b2tlX2FyZyBhcmc7Cj4KPiBXb3VsZG4ndCBpdCBiZSBwcmVmZXJh
YmxlIHRvIHVzZQo+Cj4gc3RydWN0IHRlZV9pbnZva2VfYXJnIGFyZyA9IHsgMCB9OyA/Cj4KPiBU
aGlzIHdheSB0aGUgY29tcGlsZXIgY2FuIG9wdGltaXplIHRoZSBpbml0aWFsaXphdGlvbiBhbmQg
c2V0IGFsbCAwCj4gaW5pdGlhbGl6ZWQgdmFyaWFibGVzIHdpdGggYSBzaW5nbGUgbWVtc2V0KCkg
Y2FsbC4KPgoKSSB3YXNuJ3Qgc3VyZSBvZiB0aGUgcG9ydGFiaWxpdHkgZm9yIHN0cnVjdCB6ZXJv
LWluaXRpYWxpc2F0aW9uLgoKQnV0IEkgd2lsbCBjaGFuZ2UgaXQgaW4gVjIuCgoKPiBCZXN0IHJl
Z2FyZHMKPgo+IEhlaW5yaWNoCj4KPj4gK8KgwqDCoCBzdHJ1Y3QgdGVlX3BhcmFtIHBhcmFtOwo+
PiArCj4+ICvCoMKgwqAgbWVtc2V0KCZhcmcsIDAsIHNpemVvZihhcmcpKTsKPj4gK8KgwqDCoCBt
ZW1zZXQoJnBhcmFtLCAwLCBzaXplb2YocGFyYW0pKTsKPj4gKwo+PiArwqDCoMKgIC8qIEludm9r
ZSBUQV9DTURfR0VUX0VOVFJPUFkgZnVuY3Rpb24gb2YgVHJ1c3RlZCBBcHAgKi8KPj4gK8KgwqDC
oCBhcmcuZnVuYyA9IFRBX0NNRF9HRVRfRU5UUk9QWTsKPj4gK8KgwqDCoCBhcmcuc2Vzc2lvbiA9
IHByaXYtPnNlc3Npb25faWQ7Cj4+ICsKPj4gK8KgwqDCoCAvKiBGaWxsIGludm9rZSBjbWQgcGFy
YW1zICovCj4+ICvCoMKgwqAgcGFyYW0uYXR0ciA9IFRFRV9QQVJBTV9BVFRSX1RZUEVfTUVNUkVG
X0lOT1VUOwo+PiArwqDCoMKgIHBhcmFtLnUubWVtcmVmLnNobSA9IGVudHJvcHlfc2htX3Bvb2w7
Cj4+ICvCoMKgwqAgcGFyYW0udS5tZW1yZWYuc2l6ZSA9ICpzaXplOwo+PiArCj4+ICvCoMKgwqAg
cmV0ID0gdGVlX2ludm9rZV9mdW5jKGRldi0+cGFyZW50LCAmYXJnLCAxLCAmcGFyYW0pOwo+PiAr
wqDCoMKgIGlmIChyZXQgfHwgYXJnLnJldCkgewo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFyZXQp
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FUFJPVE87Cj4+ICvCoMKgwqDCoMKg
wqDCoCBkZXZfZXJyKGRldiwgIlRBX0NNRF9HRVRfRU5UUk9QWSBpbnZva2UgZXJyOiAlZCAweCV4
XG4iLCAKPj4gcmV0LCBhcmcucmV0KTsKPj4gK8KgwqDCoMKgwqDCoMKgICpzaXplID0gMDsKPj4g
Kwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8Kg
wqDCoCBtZW1jcHkoYnVmLCBwYXJhbS51Lm1lbXJlZi5zaG0tPmFkZHIsIHBhcmFtLnUubWVtcmVm
LnNpemUpOwo+PiArwqDCoMKgICpzaXplID0gcGFyYW0udS5tZW1yZWYuc2l6ZTsKPj4gKwo+PiAr
wqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArIAoKCiguLi4pCgpSZWdhcmRzCgoKUGF0cmljawoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
