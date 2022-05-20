Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDC952EF4C
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 17:34:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E9B9C56630;
	Fri, 20 May 2022 15:34:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DCA0C035BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 15:34:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KEtXPR024416;
 Fri, 20 May 2022 17:34:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=69Kl0MaoHWYZwrK7c7/RbMR8wwaUvhqkoqEnMdOHYrs=;
 b=Eo8GEKxcS/QmtKALS6pKd0/33SySsLppio2zQ4rglkJHTHB+0DoA2xyqamLaBpSTtwPQ
 4SjrHohEAXWMyrlafyrI6Pi+YkgF/TcBvfdEAzY3p2yTH1DReMsE6YM5OOHnZSuMxfiv
 o3x9oAKCNrNWbnp9qYlNrF9qgYccV418Q3xqR4ple60tb9wD7/+/0LJ2FZRUDBDm2L9m
 TZH1nLOmXDQOwC9d6Z0FC5tDbZaqhYTVBpMjvCbSjnmIAovtihBIbdAk8oqATOotB7lS
 byLDVJEoCmOGPq1rCcGS8rKgoBkgfpQntYR/j+By8GKD0FL/snNxrhF9P0hHiLWVWNlC zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj93n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 17:34:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1900100034;
 Fri, 20 May 2022 17:34:11 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CACE224C451;
 Fri, 20 May 2022 17:34:11 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.51) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 17:33:15 +0200
Message-ID: <0051776a-3279-7b22-76ba-077039dab1c3@foss.st.com>
Date: Fri, 20 May 2022 17:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.11.I35fae2ba5868b79e66ccef249270e1cf1bf3f04b@changeid>
 <7b37356a-89fb-58f4-fe77-1623f1e15729@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <7b37356a-89fb-58f4-fe77-1623f1e15729@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 11/16] board: stm32pm1: add stm32mp13
	board support
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

SGkgUGF0cmljZQoKT24gNS8yMC8yMiAwOTowMiwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IEhp
IFBhdHJpY2sKPgo+IE9uZSB0eXBvIGFuZCBvbmUgcmVtYXJrIGJlbG93Cj4KPiBPbiA1LzYvMjIg
MTY6MDYsIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+IEFkZCBzdG0zMm1wMTV4IHByZWZpeCB0
byBhbGwgU1RNMzJNUDE1eCBib2FyZCBzcGVjaWZpYyBmdW5jdGlvbiwKPj4gdGhpcyBwYXRjaCBp
cyBhIHByZWxpbWluYXJ5IHN0ZXAgZm9yIFNUTTMyTVAxM3ggc3VwcG9ydC4KPj4KPj4gVGhpcyBw
YXRjaCBhbHNvIGFkZCB0aGUgUkNDIHByb2JlIHRvIGF2b2lkIGNpcmN1bGFyIGFjY2VzcyB3aXRo
Cj4gcy9hZGQvYWRkcwpPSwo+Cj4+IHVzYnBoeWMgcHJvYmUgYXMgY2xrIHByb3ZpZGVyLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Mu
c3QuY29tPgo+PiAtLS0KPj4KPj4gICBib2FyZC9zdC9zdG0zMm1wMS9zdG0zMm1wMS5jIHwgMjcg
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9ib2FyZC9zdC9zdG0z
Mm1wMS9zdG0zMm1wMS5jIGIvYm9hcmQvc3Qvc3RtMzJtcDEvc3RtMzJtcDEuYwo+PiBpbmRleCBm
ZmYxODgwZTViLi40YmE3MjAxZmZiIDEwMDY0NAo+PiAtLS0gYS9ib2FyZC9zdC9zdG0zMm1wMS9z
dG0zMm1wMS5jCj4+ICsrKyBiL2JvYXJkL3N0L3N0bTMybXAxL3N0bTMybXAxLmMKPj4gQEAgLTU0
Nyw4ICs1NDcsNyBAQCBzdGF0aWMgdm9pZCBzeXNjb25mX2luaXQodm9pZCkKPj4gICAJY2xyYml0
c19sZTMyKHN5c2NmZyArIFNZU0NGR19DTVBDUiwgU1lTQ0ZHX0NNUENSX1NXX0NUUkwpOwo+PiAg
IH0KPj4gICAKPj4gWy4uLl0KPj4gICAKPj4gLXN0YXRpYyB2b2lkIGJvYXJkX2V2MV9pbml0KHZv
aWQpCj4+ICtzdGF0aWMgdm9pZCBib2FyZF9zdG0zMm1wMTV4X2V2MV9pbml0KHZvaWQpCj4+ICAg
ewo+PiAgIAlzdHJ1Y3QgdWRldmljZSAqZGV2Owo+PiAgIAo+PiBAQCAtNjQ4LDEzICs2NDgsMjIg
QEAgc3RhdGljIHZvaWQgYm9hcmRfZXYxX2luaXQodm9pZCkKPj4gICAvKiBib2FyZCBkZXBlbmRl
bnQgc2V0dXAgYWZ0ZXIgcmVhbGxvYyAqLwo+PiAgIGludCBib2FyZF9pbml0KHZvaWQpCj4+ICAg
ewo+PiArCXN0cnVjdCB1ZGV2aWNlICpkZXY7Cj4+ICsJaW50IHJldDsKPj4gKwo+PiArCS8qIHBy
b2JlIFJDQyB0byBhdm9pZCBjaXJjdWxhciBhY2Nlc3Mgd2l0aCB1c2JwaHljIHByb2JlIGFzIGNs
ayBwcm92aWRlciAqLwo+PiArCWlmIChJU19FTkFCTEVEKENPTkZJR19DTEtfU1RNMzJNUDEzKSkg
ewo+PiArCQlyZXQgPSB1Y2xhc3NfZ2V0X2RldmljZV9ieV9kcml2ZXIoVUNMQVNTX0NMSywgRE1f
RFJJVkVSX0dFVChzdG0zMm1wMV9jbG9jayksICZkZXYpOwo+PiArCQlsb2dfZGVidWcoIkNsb2Nr
IGluaXQgZmFpbGVkOiAlZFxuIiwgcmV0KTsKPiBJIGFtIHdvbmRlcmluZyBpZiB1c2FnZSBvZiBE
TV9GTEFHX1BST0JFX0FGVEVSX0JJTkQgaW4gZmxhZyB3b3VsZCBhdm9pZCB0aGlzIGFib3ZlIHBp
ZWNlIG9mIGNvZGUgPwoKClllcywgSSB0aGluayB5b3UgYXJlIHJpZ2h0Cgo9PiBuZWVkIHRvIGJl
IHRlc3RlZCB3aGVuIFJDQyBjbG9jayBkcml2ZXIgYW5kIFVTQlBIWSBjbG9jayB3aWxsIGJlIAp1
cHN0cmVhbWVkCgogwqDCoMKgwqDCoCBhbmQgdGhlbiB3ZSB3aWxsIHJlbW92ZSB0aGVzZSBsaW5l
cwoKCj4+ICsJfQo+PiArCj4+ICAgCWJvYXJkX2tleV9jaGVjaygpOwo+PiAgIAo+PiAtCWlmIChi
b2FyZF9pc19ldjEoKSkKPj4gLQkJYm9hcmRfZXYxX2luaXQoKTsKPj4gKwlpZiAoYm9hcmRfaXNf
c3RtMzJtcDE1eF9ldjEoKSkKPj4gKwkJYm9hcmRfc3RtMzJtcDE1eF9ldjFfaW5pdCgpOwo+PiAg
IAo+PiAtCWlmIChib2FyZF9pc19kazIoKSkKPj4gLQkJZGsyX2kyYzFfZml4KCk7Cj4+ICsJaWYg
KGJvYXJkX2lzX3N0bTMybXAxNXhfZGsyKCkpCj4+ICsJCWJvYXJkX3N0bTMybXAxNXhfZGsyX2lu
aXQoKTsKPj4gICAKPj4gICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX0RNX1JFR1VMQVRPUikpCj4+
ICAgCQlyZWd1bGF0b3JzX2VuYWJsZV9ib290X29uKF9ERUJVRyk7CgoKUmVnYXJkcwoKUGF0cmlj
awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
