Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18A413417
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Sep 2021 15:30:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26CEBC5A4CC;
	Tue, 21 Sep 2021 13:30:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F300C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 13:30:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L7AXkW007683
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 21 Sep 2021 15:30:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aQkrRcvwYdZOm0KLzK1DGCeSzD804IGlmrf2eMyvKX4=;
 b=D6Xscu33b7aoc9j9XStSu8CMM7AfbvPPsOykKAdALsxm9WwN+KVYlkYpocx9dudGGpZa
 uiZouR1U0E0XljoGa8dwdHeePy7e5MRz1BK0co0kvkxCu/jitNlXXRBn4n0DB3Jco9PX
 S8yufJLo10AOcZ9/SvSW1U5yj5OMrOzWtHg/BiDyne9JVkGZJf2oi90N2DNxqpbbZHaI
 MYZWp6BAXUn3RQ/TB3LrWXTEpZ/mcQdabFMDPsGK5HxYx34Wk4is5xraS/OoD2+uneOL
 NWAASknTd3va44R+Se4hDOsgA/DW0ERdoeOMAa+2beVTb7qkQyprpPxG1mGZu8/8ris0 gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b7as51tgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 21 Sep 2021 15:30:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BD97100038
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 15:30:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3292C244889
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 15:30:54 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 15:30:53 +0200
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
 <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
 <5dfd98da-2efd-23e2-64db-ec41dc9b6c6a@foss.st.com>
 <8344dd03-b847-8fef-be30-68cff2bc78a9@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <3187833b-43e2-aadd-b89f-16c78e0a8600@foss.st.com>
Date: Tue, 21 Sep 2021 15:30:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8344dd03-b847-8fef-be30-68cff2bc78a9@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
Subject: Re: [Uboot-stm32] [PATCH v3 2/2] mtd: spi: nor: force mtd name to
 "nor%d"
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

SGkgTWFyZWssCgpPbiA5LzE3LzIxIDM6MzkgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDkv
MTcvMjEgMzowNiBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4gSGkgTWFyZWssCj4+Cj4+
IMKgPiBNYXJlayBWYXN1dFNlcHQuIDE2LCAyMDIxLCA1OjI3IHAubS4gVVRDIHwgIzMKPj4gwqA+
IE9uIDkvMTYvMjEgNDowMSBQTSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4KPj4gwqA+IFsu
Li5dCj4+Cj4+IMKgPiA+IEBAIC0zNjY0LDYgKzM2NjYsMTEgQEAgaW50IHNwaV9ub3Jfc2Nhbihz
dHJ1Y3Qgc3BpX25vciAqbm9yKQo+PiDCoD4gPsKgwqAgwqDCoMKgIHN0cnVjdCBtdGRfaW5mbyAq
bXRkID0gJm5vci0+bXRkOwo+PiDCoD4gPsKgwqAgwqDCoMKgIHN0cnVjdCBzcGlfc2xhdmUgKnNw
aSA9IG5vci0+c3BpOwo+PiDCoD4gPsKgwqAgwqDCoMKgIGludCByZXQ7Cj4+IMKgPiA+ICvCoMKg
wqAgaW50IGNmaV9tdGRfbmIgPSAwOwo+PiDCoD4gPiArCj4+IMKgPiA+ICsjaWZkZWYgQ09ORklH
X1NZU19NQVhfRkxBU0hfQkFOS1MKPj4gwqA+ID4gK8KgwqDCoCBjZmlfbXRkX25iID0gQ09ORklH
X1NZU19NQVhfRkxBU0hfQkFOS1M7Cj4+IMKgPiA+ICsjZW5kaWYKPj4KPj4gwqA+IEFyZSB3ZSBj
b3ZlcmluZyBhbGwgdGhlIE5PUnMgKEhGIGFuZCBjby4pIHdpdGggdGhpcyA/Cj4+Cj4+Cj4+IFll
cywgZXhjZXB0IGlmIEkgbWlzcyBzb21ldGhpbmcKPj4KPj4KPj4gYW55IE5PUiAoaW5jbHVkaW5n
IGh5cGVyZmxhc2gpIHdpY2ggdXNlIHRoZSBDRkkgaW50ZXJmYWNlIC8gCj4+IENPTkZJR19GTEFT
SF9DRklfTVRECj4+Cj4+IGRlZmluZSB0aGUgdGhlICdub3IlZCcgbmFtZSB3aXRoIHRoZSBjYWxs
aW5nIHN0YWNrOgo+Cj4gWWVzCj4KPj4gaW5pdHJfZmxhc2goKQo+Pgo+PiA9PiBmbGFzaF9pbml0
KCkKPj4KPj4gPT0+IGNmaV9mbGFzaF9pbml0X2RtKCkKPj4KPj4gPT0+IGNmaV9tdGRfaW5pdCgp
wqDCoCAibm9yJWQiIHdpY2ggdXNlIGxvb3Agb24gQ09ORklHX1NZU19NQVhfRkxBU0hfQkFOS1MK
Pj4KPj4KPj4gSSBoYXZlIG9ubHkgb25lIGNvbmNlcm4gdG9kYXkuLi4KPj4KPj4KPj4gaWYgb25l
IGNmaSBiYW5rIGlzIG1pc3NpbmcgKG5vdCBhY3RpdmF0ZWQgaW4gRFQgYnkgZXhhbXBsZSkKPj4K
Pj4gYW5kIENPTkZJR19TWVNfTUFYX0ZMQVNIX0JBTktTX0RFVEVDVCBpcyBub3QgYWN0aXZhdGVk
Cj4+Cj4+IHNvbWUgaG9sZXMgY2FuIGJlIGRvbmUgaW4gaW5kZXgKPj4KPj4KPj4gZXhhbXBsZToK
Pj4KPj4gd2l0aCBDT05GSUdfU1lTX01BWF9GTEFTSF9CQU5LUyA9IDIgYnV0IHdpdGggb25seSBv
bmUgTk9SIG9uIHRoZSBib2FyZAo+Pgo+PiA9PiAibm9yMSIgaXMgYWJzZW50IGFuZCB3ZSBoYXZl
IG9ubHkgMiBNVEQgZGV2aWNlIG5hbWVkICJub3IiCj4+Cj4+IC0gIm5vcjAiID0+IE5PUiBvciBI
RiwgZmlyc3QgQ0ZJIGJhbmsKPj4KPj4gLSAibm9yMiIgPT4gU1BJLU5PUiAoZmlyc3QpCj4+Cj4+
Cj4+IGJ1dCBJIGRvbid0IHRoaW5rIHRoYXQgaXQgaXMgYmxvY2tpbmcKPgo+IFdhc24ndCB0aGUg
b2xkIGJlaGF2aW9yIGV4YWN0bHkgdGhlIHNhbWUgYW55d2F5ID8KCgpJIGRvbid0IHN1cmUsIEkg
dGhpbmsgIm5vcjAiIHdhcyBkZWZpbmVkIDIgdGltZXM6CgotICJub3IwIiA9PiBOT1Igb3IgSEYs
IGZpcnN0IENGSSBiYW5rCgotICJub3IwIiA9PiBTUEktTk9SIChmaXJzdCkKCgpBbmQgdGhhdCBj
YXVzZSBpc3N1ZSA9PiBDRkkgYW5kIFNQSS1OT1Igd2Fzbid0IGFjdGl2YXRlZCBhdCB0aGUgc2Ft
ZSB0aW1lLgoKCj4KPj4gwqA+ID7CoMKgIMKgwqDCoCAvKiBSZXNldCBTUEkgcHJvdG9jb2wgZm9y
IGFsbCBjb21tYW5kcy4gKi8KPj4gwqA+ID7CoMKgIMKgwqDCoCBub3ItPnJlZ19wcm90byA9IFNO
T1JfUFJPVE9fMV8xXzE7Cj4+IMKgPiA+IEBAIC0zNzE1LDggKzM3MjIsMTAgQEAgaW50IHNwaV9u
b3Jfc2NhbihzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+PiDCoD4gPsKgwqAgwqDCoMKgIGlmIChyZXQp
Cj4+IMKgPiA+wqDCoCDCoMKgwqAgwqDCoMKgIHJldHVybiByZXQ7Cj4+IMKgPiA+Cj4+IMKgPiA+
IC3CoMKgwqAgaWYgKCFtdGQtPm5hbWUpCj4+IMKgPiA+IC3CoMKgwqAgwqDCoMKgIG10ZC0+bmFt
ZSA9IGluZm8tPm5hbWU7Cj4+IMKgPiA+ICvCoMKgwqAgaWYgKCFtdGQtPm5hbWUpIHsKPj4gwqA+
ID4gK8KgwqDCoCDCoMKgwqAgc3ByaW50Zihub3ItPm10ZF9uYW1lLCAibm9yJWQiLCBjZmlfbXRk
X25iICsgCj4+IGRldl9zZXEobm9yLT5kZXYpKTsKPj4gwqA+ID4gK8KgwqDCoCDCoMKgwqAgbXRk
LT5uYW1lID0gbm9yLT5tdGRfbmFtZTsKPj4gwqA+ID4gK8KgwqDCoCB9Cj4+IMKgPiA+wqDCoCDC
oMKgwqAgbXRkLT5kZXYgPSBub3ItPmRldjsKPj4gwqA+ID7CoMKgIMKgwqDCoCBtdGQtPnByaXYg
PSBub3I7Cj4+IMKgPiA+wqDCoCDCoMKgwqAgbXRkLT50eXBlID0gTVREX05PUkZMQVNIOwo+PiDC
oD4gPiBAQCAtMzgyMSw3ICszODMwLDcgQEAgaW50IHNwaV9ub3Jfc2NhbihzdHJ1Y3Qgc3BpX25v
ciAqbm9yKQo+PiDCoD4gPgo+PiDCoD4gPsKgwqAgwqDCoMKgIG5vci0+cmRzcl9kdW1teSA9IHBh
cmFtcy5yZHNyX2R1bW15Owo+PiDCoD4gPsKgwqAgwqDCoMKgIG5vci0+cmRzcl9hZGRyX25ieXRl
cyA9IHBhcmFtcy5yZHNyX2FkZHJfbmJ5dGVzOwo+PiDCoD4gPiAtwqDCoMKgIG5vci0+bmFtZSA9
IG10ZC0+bmFtZTsKPj4gwqA+ID4gK8KgwqDCoCBub3ItPm5hbWUgPSBpbmZvLT5uYW1lOwo+PiDC
oD4gPsKgwqAgwqDCoMKgIG5vci0+c2l6ZSA9IG10ZC0+c2l6ZTsKPj4gwqA+ID7CoMKgIMKgwqDC
oCBub3ItPmVyYXNlX3NpemUgPSBtdGQtPmVyYXNlc2l6ZTsKPj4gwqA+ID7CoMKgIMKgwqDCoCBu
b3ItPnNlY3Rvcl9zaXplID0gbXRkLT5lcmFzZXNpemU7Cj4+IMKgPiA+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmggCj4+IGIvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5v
ci5oCj4+IMKgPiA+IGluZGV4IDdkZGM0YmEyYmYuLjhjM2Q1MDMyZTMgMTAwNjQ0Cj4+IMKgPiA+
IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaAo+PiDCoD4gPiArKysgYi9pbmNsdWRl
L2xpbnV4L210ZC9zcGktbm9yLmgKPj4gwqA+ID4gQEAgLTU2MSw2ICs1NjEsNyBAQCBzdHJ1Y3Qg
c3BpX25vciB7Cj4+IMKgPiA+wqDCoCDCoMKgwqAgaW50ICgqcmVhZHkpKHN0cnVjdCBzcGlfbm9y
ICpub3IpOwo+PiDCoD4gPgo+PiDCoD4gPsKgwqAgwqDCoMKgIHZvaWQgKnByaXY7Cj4+IMKgPiA+
ICvCoMKgwqAgY2hhciBtdGRfbmFtZVsxMF07Cj4+Cj4+IMKgPiBzaG91bGQgYmUgMTQsIGJlY2F1
c2Ugbm9yJWRcMCBjYW4gYmUgdXAgdG8gMTQgYnl0ZXMgbG9uZy4KPj4KPj4gbm9ybWFsbHkgRE1f
TUFYX1NFUSA9IDk5OSAoYnV0IG5ldmVyIHVzZWQpCj4+Cj4+IGJ1dCBPayB3aXRoIHlvdSBmb3Ig
MTQgd2l0aCAibm9yIiA9IDMgKyAiJWQiID0gMTAgZm9yIG1heCB1MzIgdmFsdWUgKyAKPj4gIi8w
IiA9IDEKPj4KPj4KPj4gZm9yIGNmaV9tdGRfbmFtZXMgPT4gMTYgYnl0ZSB1c2VkIHdpdGggIm5v
ciVkIgo+Pgo+PiDCoMKgwqDCoCBzdGF0aWMgY2hhciBjZmlfbXRkX25hbWVzW0NGSV9NQVhfRkxB
U0hfQkFOS1NdWzE2XTsKPj4KPj4gZm9yIG5hbmQgPT4gOCBieXRlcyAoLi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9uYW5kLmM6NTkpCj4+Cj4+IMKgwqDCoMKgIHN0YXRpYyBjaGFyIGRldl9uYW1lW0NP
TkZJR19TWVNfTUFYX05BTkRfREVWSUNFXVs4XTsKPj4KPj4gZm9yIHNwaS1uYW5kID0+IDIwIGJ5
dGVzIChkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmM6MTE2OSkKPj4KPj4gwqDCoMKgwqAgbXRk
LT5uYW1lID0gbWFsbG9jKDIwKTsKPgo+IE1heWJlIHdlIG5lZWQgYSBtYWNybyBmb3IgdGhpcyBs
ZW5ndGggb2YgRE0gc2VxIHN0cmluZyB3aGljaCB3ZSBjb3VsZCAKPiB1c2UgaW4gdGhlc2UgZW1i
ZWRkZWQgYXJyYXkgY2FzZXMuCgoKT2ssIHNvbWV0aGluZyBhcwoKLyogTWF4aW11bSBzZXF1ZW5j
ZSBudW1iZXIgc3VwcG9ydGVkICovCiNkZWZpbmUgRE1fTUFYX1NFUcKgwqDCoCA5OTkKCisgI2Rl
ZmluZSBETV9NQVhfU0VRX1NUUsKgwqDCoCAzCgoKLi4uLgoKI2RlZmluZSBNVERfTkFNRV9TSVpF
KHR5cGUpwqDCoMKgIChzaXplb2YoTVREX0RFVl9UWVBFKHR5cGUpKSArIApETV9NQVhfU0VRX1NU
UikpCgoKPT4gTVREX05BTUVfU0laRShNVERfREVWX1RZUEVfTk9SKQoKCkkgbmVlZCB0byB0ZXN0
IGl0IHRvbW9ycm93IGJlZm9yZSB0byBwdXNoIGl0LgoKCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKPiBV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIKClBhdHJp
Y2sKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
