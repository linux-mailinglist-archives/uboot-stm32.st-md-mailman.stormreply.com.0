Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A4879A6CB
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Sep 2023 11:39:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5396BC6B46E;
	Mon, 11 Sep 2023 09:39:24 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E67BDC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 09:39:22 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38B9StwS005195; Mon, 11 Sep 2023 11:39:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=SX5rKiMWgs8d5D27AetWoBlYJxOZSYOPTdmU13q/82U=; b=DJ
 iNjjd88UmtDSCbkw5umqKqbELz/zRCRvadYHlxleP2+1R9kyJAu2EjtvhyjuwFuq
 2EEy97ZgZYukODaKASEFyKcabZ5So1GBzz8QrUWn2vDRklV/dKnmSVBfbB0Xrxw8
 b+hx39mURPEGrrDif1lRKYqpMwkE82P22v21mNYvo17fDEvQZ5Ao6pJ44FjyeW4M
 rVGSLk8ka+fWuTzpGnsuju96MP1fx+zeQqbFRqYMrN5s9p3hv1tD0cKNC+dHShC+
 3d2MEXtoJIcpZ12p1fTA0R+gLNbVjChFLGABm3diOWUr5LNbEXI5nxEGCUYRWhYq
 SGvaa1EkkXbAj7Fxh21g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t13nhcwp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 11:39:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2DDDE10005A;
 Mon, 11 Sep 2023 11:39:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12804237D94;
 Mon, 11 Sep 2023 11:39:18 +0200 (CEST)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 11:39:17 +0200
Message-ID: <597ffeca-d81c-7d06-2a85-a3d69a461806@foss.st.com>
Date: Mon, 11 Sep 2023 11:39:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>
References: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
 <20230907162200.205602-3-gatien.chevallier@foss.st.com>
 <99b66fba-e92a-4a6f-b1f7-428d814d402a@gmx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <99b66fba-e92a-4a6f-b1f7-428d814d402a@gmx.de>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 3/7] rng: stm32: Implement configurable
 RNG clock error detection
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

SGksCgpPbiA5LzgvMjMgMjE6MDcsIEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4gT24gOS83
LzIzIDE4OjIxLCBHYXRpZW4gQ2hldmFsbGllciB3cm90ZToKPj4gUk5HIGNsb2NrIGVycm9yIGRl
dGVjdGlvbiBpcyBub3cgZW5hYmxlZCBpZiB0aGUgImNsb2NrLWVycm9yLWRldGVjdCIKPj4gcHJv
cGVydHkgaXMgc2V0IGluIHRoZSBkZXZpY2UgdHJlZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogR2F0
aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4g
wqAgZHJpdmVycy9ybmcvc3RtMzJfcm5nLmMgfCAyMiArKysrKysrKysrKysrKysrKy0tLS0tCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ybmcvc3RtMzJfcm5nLmMgYi9kcml2ZXJzL3JuZy9zdG0z
Ml9ybmcuYwo+PiBpbmRleCA4OWRhNzhjNmM4Li5hZGE1ZDkyMjE0IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL3JuZy9zdG0zMl9ybmcuYwo+PiArKysgYi9kcml2ZXJzL3JuZy9zdG0zMl9ybmcuYwo+
PiBAQCAtNDAsNiArNDAsNyBAQCBzdHJ1Y3Qgc3RtMzJfcm5nX3BsYXQgewo+PiDCoMKgwqDCoMKg
IHN0cnVjdCBjbGsgY2xrOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCByZXNldF9jdGwgcnN0Owo+PiDC
oMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBzdG0zMl9ybmdfZGF0YSAqZGF0YTsKPj4gK8KgwqDCoCBi
b29sIGNlZDsKPj4gwqAgfTsKPj4KPj4gwqAgc3RhdGljIGludCBzdG0zMl9ybmdfcmVhZChzdHJ1
Y3QgdWRldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzaXplX3QgbGVuKQo+PiBAQCAtOTcsMjUgKzk4
LDM0IEBAIHN0YXRpYyBpbnQgc3RtMzJfcm5nX2luaXQoc3RydWN0IHN0bTMyX3JuZ19wbGF0IAo+
PiAqcGRhdGEpCj4+Cj4+IMKgwqDCoMKgwqAgY3IgPSByZWFkbChwZGF0YS0+YmFzZSArIFJOR19D
Uik7Cj4+Cj4+IC3CoMKgwqAgLyogRGlzYWJsZSBDRUQgKi8KPj4gLcKgwqDCoCBjciB8PSBSTkdf
Q1JfQ0VEOwo+PiDCoMKgwqDCoMKgIGlmIChwZGF0YS0+ZGF0YS0+aGFzX2NvbmRfcmVzZXQpIHsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNyIHw9IFJOR19DUl9DT05EUlNUOwo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKHBkYXRhLT5jZWQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNyICY9IH5S
TkdfQ1JfQ0VEOwo+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjciB8PSBSTkdfQ1JfQ0VEOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVsKGNyLCBw
ZGF0YS0+YmFzZSArIFJOR19DUik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjciAmPSB+Uk5HX0NS
X0NPTkRSU1Q7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjciB8PSBSTkdfQ1JfUk5HRU47Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB3cml0ZWwoY3IsIHBkYXRhLT5iYXNlICsgUk5HX0NSKTsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGVyciA9IHJlYWRsX3BvbGxfdGltZW91dChwZGF0YS0+YmFzZSArIFJOR19D
UiwgY3IsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgh
KGNyICYgUk5HX0NSX0NPTkRSU1QpKSwgMTAwMDApOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KGVycikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4gK8KgwqDC
oCB9IGVsc2Ugewo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHBkYXRhLT5jZWQpCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNyICY9IH5STkdfQ1JfQ0VEOwo+PiArwqDCoMKgwqDCoMKgwqAgZWxz
ZQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjciB8PSBSTkdfQ1JfQ0VEOwo+PiArCj4+ICvC
oMKgwqDCoMKgwqDCoCBjciB8PSBSTkdfQ1JfUk5HRU47Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKg
IHdyaXRlbChjciwgcGRhdGEtPmJhc2UgKyBSTkdfQ1IpOwo+PiDCoMKgwqDCoMKgIH0KPj4KPj4g
wqDCoMKgwqDCoCAvKiBjbGVhciBlcnJvciBpbmRpY2F0b3JzICovCj4+IMKgwqDCoMKgwqAgd3Jp
dGVsKDAsIHBkYXRhLT5iYXNlICsgUk5HX1NSKTsKPj4KPj4gLcKgwqDCoCBjciB8PSBSTkdfQ1Jf
Uk5HRU47Cj4+IC3CoMKgwqAgd3JpdGVsKGNyLCBwZGF0YS0+YmFzZSArIFJOR19DUik7Cj4+IC0K
Pj4gwqDCoMKgwqDCoCBlcnIgPSByZWFkbF9wb2xsX3RpbWVvdXQocGRhdGEtPmJhc2UgKyBSTkdf
U1IsIHNyLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3IgJiBSTkdf
U1JfRFJEWSwgMTAwMDApOwo+PiDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+IEBAIC0xNjUsNiAr
MTc1LDggQEAgc3RhdGljIGludCBzdG0zMl9ybmdfb2ZfdG9fcGxhdChzdHJ1Y3QgdWRldmljZSAq
ZGV2KQo+PiDCoMKgwqDCoMKgIGlmIChlcnIpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
ZXJyOwo+Pgo+PiArwqDCoMKgIHBkYXRhLT5jZWQgPSBkZXZfcmVhZF9ib29sKGRldiwgImNsb2Nr
LWVycm9yLWRldGVjdCIpOwo+Cj4gVGhlIGtlcm5lbCBkZXNjcmliZXMgdGhpcyBwcm9wZXJ0eSBp
bgo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ybmcvc3Qsc3RtMzItcm5nLnlh
bWwKPgo+IFdoaWNoIHBhdGNoIGlzIGFkZGluZyBpdCB0byB0aGUgVS1Cb290IGRldmljZS10cmVl
cz8KPiBJIGNhbid0IGZpbmQgaXQgaW4gdGhpcyBwYXRjaCBzZXJpZXMuCgoKRm9yIFNUTTMyIHBs
YXRmb3JtIHdlIHJlbHkgb24gdGhlIGJpbmRpbiBmaWxlcyBvZiBrZXJuZWwgdG8gYXZvaWQgdG8g
CmR1cGxpY2F0ZSB0aGUgYmluZGluZyBhZnRlciB5YW1sIG1pZ3JhdGlvbgoKYW5kIHdlIGFkZCB0
aGUgVS1Cb290IHNwZWNpZmljaXR5IG9ubHkgd2hlbiBpdCBpcyBuZWVkZWQgKGZvciBjbG9jayBh
bmQgcmFtKQoKClNlZSBEb2N1bWVudGF0aW9uOiAKaHR0cHM6Ly91LWJvb3QucmVhZHRoZWRvY3Mu
aW8vZW4vc3RhYmxlL2JvYXJkL3N0L3N0LWR0Lmh0bWwKCmRvYy9ib2FyZC9zdC9zdC1kdC5yc3QK
Ciogcm5nCiDCoMKgIMKgLSBybmcvc3Qsc3RtMzItcm5nLnlhbWwKCgpTbyBmb3IgbWUgbm8gbmVl
ZCBvZiBiaW5kaW5nIHBhdGNoIGluIFUtQm9vdCBzaW5jZSBbMV0gYXMgdGhpcyBwcm9wZXJ0eSAK
aXMgYWxyZWFkeSBzdXBwb3J0ZWQgYnkga2VybmVsIGJpbmRpbmcuCgpbMV0gNTUxYTk1OWE4YzEx
ICgiZG9jOiBzdG0zMm1wMTogYWRkIHBhZ2UgZm9yIGRldmljZSB0cmVlIGJpbmRpbmdzIikKCmh0
dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjEwODAyMTgw
ODIzLjEuSTNhYTc5ZDkwN2U1MjEzYzg2OTJkMmQ0MjhmNWExZmJjY2RjZTU1NWJAY2hhbmdlaWQv
CgoKUGF0cmljawoKCj4KPiBJdCB3b3VsZCBoYXZlIGJlZW4gaGVscGZ1bCB0byBzZW5kIGEgY292
ZXItbGV0dGVyIHdpdGggdGhlIHBhdGNoIHNlcmllcwo+IHRvIGdldCBhbiBvdmVydmlldyBvZiB0
aGUgY2hhbmdlZCBmaWxlcyBpbiB0aGUgcGF0Y2ggc2V0Lgo+Cj4gQmVzdCByZWdhcmRzCj4KPiBI
ZWlucmljaAo+Cj4+ICsKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+Pgo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
