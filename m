Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE87520002
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 May 2022 16:38:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49AFDC5EC6C;
	Mon,  9 May 2022 14:38:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53C0DC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 May 2022 14:38:03 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249DZrQI015065;
 Mon, 9 May 2022 16:37:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=csUyIk2yYuSKE2Ai8Xr/xwWoCEGfJQ4tNK9UnLgfYsI=;
 b=lX4B1/KVMP3GolCslXp/BlqsBS+bm+stH7XjHoI48hBxrf//vh5pm0k3+Oq4NwhmJlJ4
 fRbN9BQvaxyMWjih6PDW4IDYM09e94eU6g/i6wONLlIkPXCI9M9WPSFLTmSTHhlXL9vu
 r7Yy+0RN9tpMbgJYNtetR7qv3pK+4W9dXTVj0Z8yJnf9I7Lzu577xI7YwAcXDGy/E0/x
 7KWKYBdaR7aJOuYmB1EkO8R2bpRIG9sy30+KqmuvdA/wVc/TNc/sXEcMI2UtiKpUduwM
 YhBRp5TTJVvE9+ZXZKzrSmfwlgy3PR3zceCHNWGJRBqwyWY0CHutRTHI+Ve6216VOzFS TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg40tdar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 16:37:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B49510002A;
 Mon,  9 May 2022 16:37:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C09F2291B4;
 Mon,  9 May 2022 16:37:40 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 9 May
 2022 16:37:39 +0200
Message-ID: <0aeffe8a-b73a-5e3d-de89-9938d8d53150@foss.st.com>
Date: Mon, 9 May 2022 16:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Sean Anderson <seanga2@gmail.com>, <u-boot@lists.denx.de>
References: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
 <20220426143736.1.I15bd7c3c8c983d6a6cec3d2ee371d75fe72fcd41@changeid>
 <27373592-d6c9-ff00-799b-a2f04f4500b1@gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <27373592-d6c9-ff00-799b-a2f04f4500b1@gmail.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_04,2022-05-09_01,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>,
 Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] phy: stm32-usbphyc: add counter of
	PLL consumer
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

SGkgU2VhbiwKCk9uIDUvOC8yMiAyMDoyMSwgU2VhbiBBbmRlcnNvbiB3cm90ZToKPiBPbiA0LzI2
LzIyIDg6MzcgQU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+IEFkZCB0aGUgY291bnRlciBv
ZiB0aGUgUExMIHVzZXIgbl9wbGxfY29ucyBtYW5hZ2VkIGJ5IHRoZSAyIGZ1bmN0aW9ucwo+PiBz
dG0zMl91c2JwaHljX3BsbF9lbmFibGUgLyBzdG0zMl91c2JwaHljX3BsbF9kaXNhYmxlLgo+Pgo+
PiBUaGlzIGNvdW50ZXIgYWxsb3cgdG8gcmVtb3ZlIHRoZSBmdW5jdGlvbiBzdG0zMl91c2JwaHlj
X2lzX2luaXQKPj4gYW5kIGl0IGlzIGEgcHJlbGltaW5hcnkgc3RlcCBmb3IgY2tfdXNib180OG0g
aW50cm9kdWN0aW9uLgo+Cj4gSXMgaXQgbmVjZXNzYXJ5IHRvIGRpc2FibGUgdGhpcyBjbG9jayBi
ZWZvcmUgYm9vdGluZyB0byBMaW51eD8gSWYgaXQgCj4gaXNuJ3QsCj4gdGhlbiBwZXJoYXBzIGl0
IGlzIHNpbXBsZXIgdG8ganVzdCBub3QgZGlzYWJsZSB0aGUgY2xvY2suCj4KPiAtLVNlYW4KCgpO
bywgaXQgaXMgbm90IG5lY2Vzc2FyeSwgd2Ugb25seSBuZWVkIHRvIGVuYWJsZSB0aGUgY2xvY2sg
Zm9yIHRoZSBmaXJzdCAKdXNlci4KCkkgY29weSB0aGUgY2xvY2sgYmVoYXZpb3IgZnJvbSBrZXJu
ZWwsCgpidXQgSSBhZ3JlZSB0aGF0IGNhbiBiZSBzaW1wbGVyLgoKCkFtZWxpZSBhbnkgbm90aWNl
IGFib3V0IHRoaXMgcG9pbnQgPwoKRG8geW91IHByZWZlciB0aGF0IEkga2VwdCB0aGUgYmVoYXZp
b3IgLSBzYW1lIGFzIGtlcm5lbCBkcml2ZXIgLSBvciBJIApzaW1wbGlmeSB0aGUgVS1Cb290IGRy
aXZlciA/CgoKUGF0cmljawoKCj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGRyaXZlcnMvcGh5
L3BoeS1zdG0zMi11c2JwaHljLmMgfCA3NiArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvcGh5LXN0bTMyLXVzYnBoeWMuYyAKPj4g
Yi9kcml2ZXJzL3BoeS9waHktc3RtMzItdXNicGh5Yy5jCj4+IGluZGV4IDljMWRjZmFlNTIuLjE2
Yzg3OTllY2EgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcGh5L3BoeS1zdG0zMi11c2JwaHljLmMK
Pj4gKysrIGIvZHJpdmVycy9waHkvcGh5LXN0bTMyLXVzYnBoeWMuYwo+PiBAQCAtNjUsNiArNjUs
NyBAQCBzdHJ1Y3Qgc3RtMzJfdXNicGh5YyB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGlu
aXQ7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIHBvd2VyZWQ7Cj4+IMKgwqDCoMKgwqAgfSBw
aHlzW01BWF9QSFlTXTsKPj4gK8KgwqDCoCBpbnQgbl9wbGxfY29uczsKPj4gwqAgfTsKPj4gwqAg
wqAgc3RhdGljIHZvaWQgc3RtMzJfdXNicGh5Y19nZXRfcGxsX3BhcmFtcyh1MzIgY2xrX3JhdGUs
Cj4+IEBAIC0xMjQsMTggKzEyNSw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfdXNicGh5Y19wbGxfaW5p
dChzdHJ1Y3QgCj4+IHN0bTMyX3VzYnBoeWMgKnVzYnBoeWMpCj4+IMKgwqDCoMKgwqAgcmV0dXJu
IDA7Cj4+IMKgIH0KPj4gwqAgLXN0YXRpYyBib29sIHN0bTMyX3VzYnBoeWNfaXNfaW5pdChzdHJ1
Y3Qgc3RtMzJfdXNicGh5YyAqdXNicGh5YykKPj4gLXsKPj4gLcKgwqDCoCBpbnQgaTsKPj4gLQo+
PiAtwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBNQVhfUEhZUzsgaSsrKSB7Cj4+IC3CoMKgwqDCoMKg
wqDCoCBpZiAodXNicGh5Yy0+cGh5c1tpXS5pbml0KQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gdHJ1ZTsKPj4gLcKgwqDCoCB9Cj4+IC0KPj4gLcKgwqDCoCByZXR1cm4gZmFsc2U7
Cj4+IC19Cj4+IC0KPj4gwqAgc3RhdGljIGJvb2wgc3RtMzJfdXNicGh5Y19pc19wb3dlcmVkKHN0
cnVjdCBzdG0zMl91c2JwaHljICp1c2JwaHljKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgaW50IGk7
Cj4+IEBAIC0xNDgsMTggKzEzNywxNyBAQCBzdGF0aWMgYm9vbCBzdG0zMl91c2JwaHljX2lzX3Bv
d2VyZWQoc3RydWN0IAo+PiBzdG0zMl91c2JwaHljICp1c2JwaHljKQo+PiDCoMKgwqDCoMKgIHJl
dHVybiBmYWxzZTsKPj4gwqAgfQo+PiDCoCAtc3RhdGljIGludCBzdG0zMl91c2JwaHljX3BoeV9p
bml0KHN0cnVjdCBwaHkgKnBoeSkKPj4gK3N0YXRpYyBpbnQgc3RtMzJfdXNicGh5Y19wbGxfZW5h
YmxlKHN0cnVjdCBzdG0zMl91c2JwaHljICp1c2JwaHljKQo+PiDCoCB7Cj4+IC3CoMKgwqAgc3Ry
dWN0IHN0bTMyX3VzYnBoeWMgKnVzYnBoeWMgPSBkZXZfZ2V0X3ByaXYocGh5LT5kZXYpOwo+PiAt
wqDCoMKgIHN0cnVjdCBzdG0zMl91c2JwaHljX3BoeSAqdXNicGh5Y19waHkgPSB1c2JwaHljLT5w
aHlzICsgcGh5LT5pZDsKPj4gwqDCoMKgwqDCoCBib29sIHBsbGVuID0gcmVhZGwodXNicGh5Yy0+
YmFzZSArIFNUTTMyX1VTQlBIWUNfUExMKSAmIFBMTEVOID8KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB0cnVlIDogZmFsc2U7Cj4+IMKgwqDCoMKgwqAgaW50IHJldDsKPj4gwqAgLcKg
wqDCoCBkZXZfZGJnKHBoeS0+ZGV2LCAicGh5IElEID0gJWx1XG4iLCBwaHktPmlkKTsKPj4gLcKg
wqDCoCAvKiBDaGVjayBpZiBvbmUgcGh5IHBvcnQgaGFzIGFscmVhZHkgY29uZmlndXJlZCB0aGUg
cGxsICovCj4+IC3CoMKgwqAgaWYgKHBsbGVuICYmIHN0bTMyX3VzYnBoeWNfaXNfaW5pdCh1c2Jw
aHljKSkKPj4gLcKgwqDCoMKgwqDCoMKgIGdvdG8gaW5pdGlhbGl6ZWQ7Cj4+ICvCoMKgwqAgLyog
Q2hlY2sgaWYgb25lIGNvbnN1bWVyIGhhcyBhbHJlYWR5IGNvbmZpZ3VyZWQgdGhlIHBsbCAqLwo+
PiArwqDCoMKgIGlmIChwbGxlbiAmJiB1c2JwaHljLT5uX3BsbF9jb25zKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCB1c2JwaHljLT5uX3BsbF9jb25zKys7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
MDsKPj4gK8KgwqDCoCB9Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKHVzYnBoeWMtPnZkZGExdjEpIHsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHJlZ3VsYXRvcl9zZXRfZW5hYmxlKHVzYnBoeWMt
PnZkZGExdjEsIHRydWUpOwo+PiBAQCAtMTkwLDIzICsxNzgsMTkgQEAgc3RhdGljIGludCBzdG0z
Ml91c2JwaHljX3BoeV9pbml0KHN0cnVjdCBwaHkgKnBoeSkKPj4gwqDCoMKgwqDCoCBpZiAoIShy
ZWFkbCh1c2JwaHljLT5iYXNlICsgU1RNMzJfVVNCUEhZQ19QTEwpICYgUExMRU4pKQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU87Cj4+IMKgIC1pbml0aWFsaXplZDoKPj4gLcKgwqDC
oCB1c2JwaHljX3BoeS0+aW5pdCA9IHRydWU7Cj4+ICvCoMKgwqAgdXNicGh5Yy0+bl9wbGxfY29u
cysrOwo+PiDCoCDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9Cj4+IMKgIC1zdGF0aWMgaW50
IHN0bTMyX3VzYnBoeWNfcGh5X2V4aXQoc3RydWN0IHBoeSAqcGh5KQo+PiArc3RhdGljIGludCBz
dG0zMl91c2JwaHljX3BsbF9kaXNhYmxlKHN0cnVjdCBzdG0zMl91c2JwaHljICp1c2JwaHljKQo+
PiDCoCB7Cj4+IC3CoMKgwqAgc3RydWN0IHN0bTMyX3VzYnBoeWMgKnVzYnBoeWMgPSBkZXZfZ2V0
X3ByaXYocGh5LT5kZXYpOwo+PiAtwqDCoMKgIHN0cnVjdCBzdG0zMl91c2JwaHljX3BoeSAqdXNi
cGh5Y19waHkgPSB1c2JwaHljLT5waHlzICsgcGh5LT5pZDsKPj4gwqDCoMKgwqDCoCBpbnQgcmV0
Owo+PiDCoCAtwqDCoMKgIGRldl9kYmcocGh5LT5kZXYsICJwaHkgSUQgPSAlbHVcbiIsIHBoeS0+
aWQpOwo+PiAtwqDCoMKgIHVzYnBoeWNfcGh5LT5pbml0ID0gZmFsc2U7Cj4+ICvCoMKgwqAgdXNi
cGh5Yy0+bl9wbGxfY29ucy0tOwo+PiDCoCAtwqDCoMKgIC8qIENoZWNrIGlmIG90aGVyIHBoeSBw
b3J0IHJlcXVpcmVzIHBsbGVuICovCj4+IC3CoMKgwqAgaWYgKHN0bTMyX3VzYnBoeWNfaXNfaW5p
dCh1c2JwaHljKSkKPj4gK8KgwqDCoCAvKiBDaGVjayBpZiBvdGhlciBjb25zdW1lciByZXF1aXJl
cyBwbGxlbiAqLwo+PiArwqDCoMKgIGlmICh1c2JwaHljLT5uX3BsbF9jb25zKQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIMKgwqDCoMKgwqAgY2xyYml0c19sZTMyKHVzYnBo
eWMtPmJhc2UgKyBTVE0zMl9VU0JQSFlDX1BMTCwgUExMRU4pOwo+PiBAQCAtMjM1LDYgKzIxOSw0
MiBAQCBzdGF0aWMgaW50IHN0bTMyX3VzYnBoeWNfcGh5X2V4aXQoc3RydWN0IHBoeSAqcGh5KQo+
PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9Cj4+IMKgICtzdGF0aWMgaW50IHN0bTMyX3Vz
YnBoeWNfcGh5X2luaXQoc3RydWN0IHBoeSAqcGh5KQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBz
dG0zMl91c2JwaHljICp1c2JwaHljID0gZGV2X2dldF9wcml2KHBoeS0+ZGV2KTsKPj4gK8KgwqDC
oCBzdHJ1Y3Qgc3RtMzJfdXNicGh5Y19waHkgKnVzYnBoeWNfcGh5ID0gdXNicGh5Yy0+cGh5cyAr
IHBoeS0+aWQ7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKgIGRldl9kYmcocGh5
LT5kZXYsICJwaHkgSUQgPSAlbHVcbiIsIHBoeS0+aWQpOwo+PiArwqDCoMKgIGlmICh1c2JwaHlj
X3BoeS0+aW5pdCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiArCj4+ICvCoMKgwqAg
cmV0ID0gc3RtMzJfdXNicGh5Y19wbGxfZW5hYmxlKHVzYnBoeWMpOwo+PiArwqDCoMKgIGlmIChy
ZXQpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gbG9nX3JldChyZXQpOwo+PiArCj4+ICvCoMKg
wqAgdXNicGh5Y19waHktPmluaXQgPSB0cnVlOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+
ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgc3RtMzJfdXNicGh5Y19waHlfZXhpdChzdHJ1Y3QgcGh5
ICpwaHkpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IHN0bTMyX3VzYnBoeWMgKnVzYnBoeWMgPSBk
ZXZfZ2V0X3ByaXYocGh5LT5kZXYpOwo+PiArwqDCoMKgIHN0cnVjdCBzdG0zMl91c2JwaHljX3Bo
eSAqdXNicGh5Y19waHkgPSB1c2JwaHljLT5waHlzICsgcGh5LT5pZDsKPj4gK8KgwqDCoCBpbnQg
cmV0Owo+PiArCj4+ICvCoMKgwqAgZGV2X2RiZyhwaHktPmRldiwgInBoeSBJRCA9ICVsdVxuIiwg
cGh5LT5pZCk7Cj4+ICvCoMKgwqAgaWYgKCF1c2JwaHljX3BoeS0+aW5pdCkKPj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiAwOwo+PiArCj4+ICvCoMKgwqAgcmV0ID0gc3RtMzJfdXNicGh5Y19wbGxf
ZGlzYWJsZSh1c2JwaHljKTsKPj4gKwo+PiArwqDCoMKgIHVzYnBoeWNfcGh5LT5pbml0ID0gZmFs
c2U7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gbG9nX3JldChyZXQpOwo+PiArfQo+PiArCj4+IMKg
IHN0YXRpYyBpbnQgc3RtMzJfdXNicGh5Y19waHlfcG93ZXJfb24oc3RydWN0IHBoeSAqcGh5KQo+
PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHN0bTMyX3VzYnBoeWMgKnVzYnBoeWMgPSBkZXZf
Z2V0X3ByaXYocGh5LT5kZXYpOwo+Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
