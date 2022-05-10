Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25918521443
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 13:52:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E44F9C5EC6C;
	Tue, 10 May 2022 11:52:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79C2FC035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 09:51:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A6P0p7004391;
 Tue, 10 May 2022 11:51:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Aa6M1vUXEe4RAdcbiRSFTXPMsw6C6aqXpG4NO6KYQ+Q=;
 b=xeMBvj3yeey2HS77Qcmit0Z4xN3FXwVHoVXnPUk/NB74BcPuUlMUlCjey+tG/9s17/Zz
 PH/eB/699PjMnB6B7why+RQS6YSgPDrASGxR9mxJEJT1aenyeElPu2H8SZce9Y1GFyZ0
 OO65FjmZb6usf8WsgYNUBUyzavwS+s4nGzIJ1GqkEMycpKT9NlBfnySp03tv6CbhiDps
 uqEqNOYj3DGFQbcw6pFXcNwjz5cAPQTEoUbpBpl6iyy+SHpW59ZqccmhG8qvYopB/TzZ
 mUHrdGZiwJTl5v+NeXAELkhRuv8OxZy0Q3KRDTEC3p0JHocLflYPHElCawqtb6f+hsF8 LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwfngh33d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 11:51:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BF2010002A;
 Tue, 10 May 2022 11:51:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 713B2214D1F;
 Tue, 10 May 2022 11:51:32 +0200 (CEST)
Received: from [10.211.10.48] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 10 May
 2022 11:51:29 +0200
Message-ID: <8776d357-028b-0d21-cb90-4cbdd73f4ffb@foss.st.com>
Date: Tue, 10 May 2022 11:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Sean Anderson
 <seanga2@gmail.com>, <u-boot@lists.denx.de>
References: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
 <20220426143736.1.I15bd7c3c8c983d6a6cec3d2ee371d75fe72fcd41@changeid>
 <27373592-d6c9-ff00-799b-a2f04f4500b1@gmail.com>
 <0aeffe8a-b73a-5e3d-de89-9938d8d53150@foss.st.com>
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <0aeffe8a-b73a-5e3d-de89-9938d8d53150@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
X-Mailman-Approved-At: Tue, 10 May 2022 11:52:35 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>
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

SGkgUGF0cmljaywKSGkgU2VhbiwKCk9uIDUvOS8yMiAxNjozNywgUGF0cmljayBERUxBVU5BWSB3
cm90ZToKPiBIaSBTZWFuLAo+IAo+IE9uIDUvOC8yMiAyMDoyMSwgU2VhbiBBbmRlcnNvbiB3cm90
ZToKPj4gT24gNC8yNi8yMiA4OjM3IEFNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+Pj4gQWRk
IHRoZSBjb3VudGVyIG9mIHRoZSBQTEwgdXNlciBuX3BsbF9jb25zIG1hbmFnZWQgYnkgdGhlIDIg
ZnVuY3Rpb25zCj4+PiBzdG0zMl91c2JwaHljX3BsbF9lbmFibGUgLyBzdG0zMl91c2JwaHljX3Bs
bF9kaXNhYmxlLgo+Pj4KPj4+IFRoaXMgY291bnRlciBhbGxvdyB0byByZW1vdmUgdGhlIGZ1bmN0
aW9uIHN0bTMyX3VzYnBoeWNfaXNfaW5pdAo+Pj4gYW5kIGl0IGlzIGEgcHJlbGltaW5hcnkgc3Rl
cCBmb3IgY2tfdXNib180OG0gaW50cm9kdWN0aW9uLgo+Pgo+PiBJcyBpdCBuZWNlc3NhcnkgdG8g
ZGlzYWJsZSB0aGlzIGNsb2NrIGJlZm9yZSBib290aW5nIHRvIExpbnV4PyBJZiBpdCAKPj4gaXNu
J3QsCj4+IHRoZW4gcGVyaGFwcyBpdCBpcyBzaW1wbGVyIHRvIGp1c3Qgbm90IGRpc2FibGUgdGhl
IGNsb2NrLgo+Pgo+PiAtLVNlYW4KPiAKPiAKPiBObywgaXQgaXMgbm90IG5lY2Vzc2FyeSwgd2Ug
b25seSBuZWVkIHRvIGVuYWJsZSB0aGUgY2xvY2sgZm9yIHRoZSBmaXJzdCAKPiB1c2VyLgo+IAo+
IEkgY29weSB0aGUgY2xvY2sgYmVoYXZpb3IgZnJvbSBrZXJuZWwsCj4gCj4gYnV0IEkgYWdyZWUg
dGhhdCBjYW4gYmUgc2ltcGxlci4KPiAKPiAKPiBBbWVsaWUgYW55IG5vdGljZSBhYm91dCB0aGlz
IHBvaW50ID8KPiAKPiBEbyB5b3UgcHJlZmVyIHRoYXQgSSBrZXB0IHRoZSBiZWhhdmlvciAtIHNh
bWUgYXMga2VybmVsIGRyaXZlciAtIG9yIEkgCj4gc2ltcGxpZnkgdGhlIFUtQm9vdCBkcml2ZXIg
PwoKSW4gY2FzZSB0aGUgUExMIGhhcyBub3QgYmVlbiBkaXNhYmxlZCBiZWZvcmUgS2VybmVsIGJv
b3QsIHVzYnBoeWMgS2VybmVsIApkcml2ZXIgd2lsbCB3YWl0IGZvciB0aGUgUExMIHB3ZXJkb3du
LgpVU0IgY291bGQgYWxzbyBub3QgYmVpbmcgdXNlZCBpbiBLZXJuZWwsIHNvIFBMTCB3b3VsZCBy
ZW1haW4gZW5hYmxlZCwgCmFuZCB3b3VsZCB3YXN0ZSBwb3dlci4KSSBhbSByYXRoZXIgaW4gZmF2
b3Igb2YgZGlzYWJsaW5nIHRoZSBQTEwuCgpSZWdhcmRzLApBbWVsaWUKCj4gCj4gCj4gUGF0cmlj
awo+IAo+IAo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5k
ZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4+IC0tLQo+Pj4KPj4+IMKgIGRyaXZlcnMvcGh5L3BoeS1z
dG0zMi11c2JwaHljLmMgfCA3NiArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvcGh5LXN0bTMyLXVzYnBoeWMuYyAKPj4+IGIv
ZHJpdmVycy9waHkvcGh5LXN0bTMyLXVzYnBoeWMuYwo+Pj4gaW5kZXggOWMxZGNmYWU1Mi4uMTZj
ODc5OWVjYSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvcGh5L3BoeS1zdG0zMi11c2JwaHljLmMK
Pj4+ICsrKyBiL2RyaXZlcnMvcGh5L3BoeS1zdG0zMi11c2JwaHljLmMKPj4+IEBAIC02NSw2ICs2
NSw3IEBAIHN0cnVjdCBzdG0zMl91c2JwaHljIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBib29s
IGluaXQ7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBwb3dlcmVkOwo+Pj4gwqDCoMKgwqDC
oCB9IHBoeXNbTUFYX1BIWVNdOwo+Pj4gK8KgwqDCoCBpbnQgbl9wbGxfY29uczsKPj4+IMKgIH07
Cj4+PiDCoCDCoCBzdGF0aWMgdm9pZCBzdG0zMl91c2JwaHljX2dldF9wbGxfcGFyYW1zKHUzMiBj
bGtfcmF0ZSwKPj4+IEBAIC0xMjQsMTggKzEyNSw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfdXNicGh5
Y19wbGxfaW5pdChzdHJ1Y3QgCj4+PiBzdG0zMl91c2JwaHljICp1c2JwaHljKQo+Pj4gwqDCoMKg
wqDCoCByZXR1cm4gMDsKPj4+IMKgIH0KPj4+IMKgIC1zdGF0aWMgYm9vbCBzdG0zMl91c2JwaHlj
X2lzX2luaXQoc3RydWN0IHN0bTMyX3VzYnBoeWMgKnVzYnBoeWMpCj4+PiAtewo+Pj4gLcKgwqDC
oCBpbnQgaTsKPj4+IC0KPj4+IC3CoMKgwqAgZm9yIChpID0gMDsgaSA8IE1BWF9QSFlTOyBpKysp
IHsKPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAodXNicGh5Yy0+cGh5c1tpXS5pbml0KQo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+PiAtwqDCoMKgIH0KPj4+IC0KPj4+
IC3CoMKgwqAgcmV0dXJuIGZhbHNlOwo+Pj4gLX0KPj4+IC0KPj4+IMKgIHN0YXRpYyBib29sIHN0
bTMyX3VzYnBoeWNfaXNfcG93ZXJlZChzdHJ1Y3Qgc3RtMzJfdXNicGh5YyAqdXNicGh5YykKPj4+
IMKgIHsKPj4+IMKgwqDCoMKgwqAgaW50IGk7Cj4+PiBAQCAtMTQ4LDE4ICsxMzcsMTcgQEAgc3Rh
dGljIGJvb2wgc3RtMzJfdXNicGh5Y19pc19wb3dlcmVkKHN0cnVjdCAKPj4+IHN0bTMyX3VzYnBo
eWMgKnVzYnBoeWMpCj4+PiDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+IMKgIH0KPj4+IMKg
IC1zdGF0aWMgaW50IHN0bTMyX3VzYnBoeWNfcGh5X2luaXQoc3RydWN0IHBoeSAqcGh5KQo+Pj4g
K3N0YXRpYyBpbnQgc3RtMzJfdXNicGh5Y19wbGxfZW5hYmxlKHN0cnVjdCBzdG0zMl91c2JwaHlj
ICp1c2JwaHljKQo+Pj4gwqAgewo+Pj4gLcKgwqDCoCBzdHJ1Y3Qgc3RtMzJfdXNicGh5YyAqdXNi
cGh5YyA9IGRldl9nZXRfcHJpdihwaHktPmRldik7Cj4+PiAtwqDCoMKgIHN0cnVjdCBzdG0zMl91
c2JwaHljX3BoeSAqdXNicGh5Y19waHkgPSB1c2JwaHljLT5waHlzICsgcGh5LT5pZDsKPj4+IMKg
wqDCoMKgwqAgYm9vbCBwbGxlbiA9IHJlYWRsKHVzYnBoeWMtPmJhc2UgKyBTVE0zMl9VU0JQSFlD
X1BMTCkgJiBQTExFTiA/Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRydWUgOiBm
YWxzZTsKPj4+IMKgwqDCoMKgwqAgaW50IHJldDsKPj4+IMKgIC3CoMKgwqAgZGV2X2RiZyhwaHkt
PmRldiwgInBoeSBJRCA9ICVsdVxuIiwgcGh5LT5pZCk7Cj4+PiAtwqDCoMKgIC8qIENoZWNrIGlm
IG9uZSBwaHkgcG9ydCBoYXMgYWxyZWFkeSBjb25maWd1cmVkIHRoZSBwbGwgKi8KPj4+IC3CoMKg
wqAgaWYgKHBsbGVuICYmIHN0bTMyX3VzYnBoeWNfaXNfaW5pdCh1c2JwaHljKSkKPj4+IC3CoMKg
wqDCoMKgwqDCoCBnb3RvIGluaXRpYWxpemVkOwo+Pj4gK8KgwqDCoCAvKiBDaGVjayBpZiBvbmUg
Y29uc3VtZXIgaGFzIGFscmVhZHkgY29uZmlndXJlZCB0aGUgcGxsICovCj4+PiArwqDCoMKgIGlm
IChwbGxlbiAmJiB1c2JwaHljLT5uX3BsbF9jb25zKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgdXNi
cGh5Yy0+bl9wbGxfY29ucysrOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gK8Kg
wqDCoCB9Cj4+PiDCoCDCoMKgwqDCoMKgIGlmICh1c2JwaHljLT52ZGRhMXYxKSB7Cj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0ID0gcmVndWxhdG9yX3NldF9lbmFibGUodXNicGh5Yy0+dmRkYTF2
MSwgdHJ1ZSk7Cj4+PiBAQCAtMTkwLDIzICsxNzgsMTkgQEAgc3RhdGljIGludCBzdG0zMl91c2Jw
aHljX3BoeV9pbml0KHN0cnVjdCBwaHkgKnBoeSkKPj4+IMKgwqDCoMKgwqAgaWYgKCEocmVhZGwo
dXNicGh5Yy0+YmFzZSArIFNUTTMyX1VTQlBIWUNfUExMKSAmIFBMTEVOKSkKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVJTzsKPj4+IMKgIC1pbml0aWFsaXplZDoKPj4+IC3CoMKgwqAg
dXNicGh5Y19waHktPmluaXQgPSB0cnVlOwo+Pj4gK8KgwqDCoCB1c2JwaHljLT5uX3BsbF9jb25z
Kys7Cj4+PiDCoCDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gwqAgfQo+Pj4gwqAgLXN0YXRpYyBp
bnQgc3RtMzJfdXNicGh5Y19waHlfZXhpdChzdHJ1Y3QgcGh5ICpwaHkpCj4+PiArc3RhdGljIGlu
dCBzdG0zMl91c2JwaHljX3BsbF9kaXNhYmxlKHN0cnVjdCBzdG0zMl91c2JwaHljICp1c2JwaHlj
KQo+Pj4gwqAgewo+Pj4gLcKgwqDCoCBzdHJ1Y3Qgc3RtMzJfdXNicGh5YyAqdXNicGh5YyA9IGRl
dl9nZXRfcHJpdihwaHktPmRldik7Cj4+PiAtwqDCoMKgIHN0cnVjdCBzdG0zMl91c2JwaHljX3Bo
eSAqdXNicGh5Y19waHkgPSB1c2JwaHljLT5waHlzICsgcGh5LT5pZDsKPj4+IMKgwqDCoMKgwqAg
aW50IHJldDsKPj4+IMKgIC3CoMKgwqAgZGV2X2RiZyhwaHktPmRldiwgInBoeSBJRCA9ICVsdVxu
IiwgcGh5LT5pZCk7Cj4+PiAtwqDCoMKgIHVzYnBoeWNfcGh5LT5pbml0ID0gZmFsc2U7Cj4+PiAr
wqDCoMKgIHVzYnBoeWMtPm5fcGxsX2NvbnMtLTsKPj4+IMKgIC3CoMKgwqAgLyogQ2hlY2sgaWYg
b3RoZXIgcGh5IHBvcnQgcmVxdWlyZXMgcGxsZW4gKi8KPj4+IC3CoMKgwqAgaWYgKHN0bTMyX3Vz
YnBoeWNfaXNfaW5pdCh1c2JwaHljKSkKPj4+ICvCoMKgwqAgLyogQ2hlY2sgaWYgb3RoZXIgY29u
c3VtZXIgcmVxdWlyZXMgcGxsZW4gKi8KPj4+ICvCoMKgwqAgaWYgKHVzYnBoeWMtPm5fcGxsX2Nv
bnMpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+PiDCoCDCoMKgwqDCoMKgIGNs
cmJpdHNfbGUzMih1c2JwaHljLT5iYXNlICsgU1RNMzJfVVNCUEhZQ19QTEwsIFBMTEVOKTsKPj4+
IEBAIC0yMzUsNiArMjE5LDQyIEBAIHN0YXRpYyBpbnQgc3RtMzJfdXNicGh5Y19waHlfZXhpdChz
dHJ1Y3QgcGh5ICpwaHkpCj4+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gwqAgfQo+Pj4gwqAg
K3N0YXRpYyBpbnQgc3RtMzJfdXNicGh5Y19waHlfaW5pdChzdHJ1Y3QgcGh5ICpwaHkpCj4+PiAr
ewo+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3RtMzJfdXNicGh5YyAqdXNicGh5YyA9IGRldl9nZXRfcHJp
dihwaHktPmRldik7Cj4+PiArwqDCoMKgIHN0cnVjdCBzdG0zMl91c2JwaHljX3BoeSAqdXNicGh5
Y19waHkgPSB1c2JwaHljLT5waHlzICsgcGh5LT5pZDsKPj4+ICvCoMKgwqAgaW50IHJldDsKPj4+
ICsKPj4+ICvCoMKgwqAgZGV2X2RiZyhwaHktPmRldiwgInBoeSBJRCA9ICVsdVxuIiwgcGh5LT5p
ZCk7Cj4+PiArwqDCoMKgIGlmICh1c2JwaHljX3BoeS0+aW5pdCkKPj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsKPj4+ICsKPj4+ICvCoMKgwqAgcmV0ID0gc3RtMzJfdXNicGh5Y19wbGxfZW5h
YmxlKHVzYnBoeWMpOwo+Pj4gK8KgwqDCoCBpZiAocmV0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiBsb2dfcmV0KHJldCk7Cj4+PiArCj4+PiArwqDCoMKgIHVzYnBoeWNfcGh5LT5pbml0ID0g
dHJ1ZTsKPj4+ICsKPj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRp
YyBpbnQgc3RtMzJfdXNicGh5Y19waHlfZXhpdChzdHJ1Y3QgcGh5ICpwaHkpCj4+PiArewo+Pj4g
K8KgwqDCoCBzdHJ1Y3Qgc3RtMzJfdXNicGh5YyAqdXNicGh5YyA9IGRldl9nZXRfcHJpdihwaHkt
PmRldik7Cj4+PiArwqDCoMKgIHN0cnVjdCBzdG0zMl91c2JwaHljX3BoeSAqdXNicGh5Y19waHkg
PSB1c2JwaHljLT5waHlzICsgcGh5LT5pZDsKPj4+ICvCoMKgwqAgaW50IHJldDsKPj4+ICsKPj4+
ICvCoMKgwqAgZGV2X2RiZyhwaHktPmRldiwgInBoeSBJRCA9ICVsdVxuIiwgcGh5LT5pZCk7Cj4+
PiArwqDCoMKgIGlmICghdXNicGh5Y19waHktPmluaXQpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIDA7Cj4+PiArCj4+PiArwqDCoMKgIHJldCA9IHN0bTMyX3VzYnBoeWNfcGxsX2Rpc2FibGUo
dXNicGh5Yyk7Cj4+PiArCj4+PiArwqDCoMKgIHVzYnBoeWNfcGh5LT5pbml0ID0gZmFsc2U7Cj4+
PiArCj4+PiArwqDCoMKgIHJldHVybiBsb2dfcmV0KHJldCk7Cj4+PiArfQo+Pj4gKwo+Pj4gwqAg
c3RhdGljIGludCBzdG0zMl91c2JwaHljX3BoeV9wb3dlcl9vbihzdHJ1Y3QgcGh5ICpwaHkpCj4+
PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBzdG0zMl91c2JwaHljICp1c2JwaHljID0gZGV2
X2dldF9wcml2KHBoeS0+ZGV2KTsKPj4+Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
