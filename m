Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AD242A7F5
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Oct 2021 17:12:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FEF9C5C831;
	Tue, 12 Oct 2021 15:12:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16B61C06F81
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Oct 2021 15:12:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CEXDXB032174; 
 Tue, 12 Oct 2021 17:12:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PtBognX3xNHQYGniZZG5fQ9x+CbHeuu5DGN0XqF6oX0=;
 b=3n/vYrOPI5/QChu+QdzX5EXzJ4Ze2lDzgWmwgG/7tNWwAXAIz+a6GQHx5ZttiT+jMbAH
 SuWxESdAdrFqLC4eBZphI80RQDF4g3pVhHFHrlzkSHgqQMWqExdrSCRJ9CamsI0Kw7aa
 dZCVavdsheRdf5rItQgWir9qrdPAZsxlMmf4ogdl9okEMThwaSPgigAxqrCXv79KW5uA
 R/chqssR0PhDSW4l+ono+wa8AtV4Ub1tkhi8rTYr2tMWsjqcjA19Ali7PwsgVEQHBbKi
 SOMSWr0NVlAFLhn2+72tHmORRk55VsNlFm7MoRpEghsHBaZorG3g4I5/1lanU0Ds8PnM aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bnc7sr731-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 17:12:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F09710002A;
 Tue, 12 Oct 2021 17:12:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 561E322F7BE;
 Tue, 12 Oct 2021 17:12:02 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 12 Oct
 2021 17:12:01 +0200
To: <u-boot@lists.denx.de>
References: <20211008093443.1.Ic6dad451e1dc50483b0d69ebebb481ce70dbe27f@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <d900b0e7-1fea-abfb-f7f1-5c71fd669f14@foss.st.com>
Date: Tue, 12 Oct 2021 17:12:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008093443.1.Ic6dad451e1dc50483b0d69ebebb481ce70dbe27f@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-12_04,2021-10-12_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: add binman support for STM32MP15x
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

SGksCgpPbiAxMC84LzIxIDk6MzQgQU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4gVXNlIGJp
bm1hbiB0byBhZGQgdGhlIHN0bTMyaW1hZ2UgaGVhZGVyIG9uIFNQTCBiaW5hcnkgZm9yIGJhc2lj
IGJvb3QKPiBvciBvbiBVLUJvb3QgYmluYXJ5IHdoZW4gaXQgaXMgcmVxdWlyZWQsIGkuZS4gZm9y
IFRGLUEgYm9vdCB3aXRob3V0IEZJUAo+IHN1cHBvcnQsIHdoZW4gQ09ORklHX1NUTTMyTVAxNXhf
U1RNMzJJTUFHRSBpcyBhY3RpdmF0ZWQuCj4KPiBUaGUgImJpbm1hbiIgdG9vbCBpcyB0aGUgcmVj
b21tZW5kZWQgdG9vbCBmb3Igc3BlY2lmaWMgaW1hZ2UgZ2VuZXJhdGlvbi4KPiBUaGlzIHBhdGNo
IGFsbG93cyB0byBzdXBwcmVzcyB0aGUgY29uZmlnLm1rIGZpbGUgYW5kIGl0IGlzIGEgcHJlbGlt
aW5hcnkKPiBzdGVwIHRvIG1hbmFnZSBGSVQgZ2VuZXJhdGlvbiB3aXRoIGJpbm1hbi4KPgo+IFNp
Z25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5j
b20+Cj4gLS0tCj4KPiAgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTUtdS1ib290LmR0c2kgfCAyOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tj
b25maWcgICAgICB8ICAxICsKPiAgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9jb25maWcubWsgICAg
fCAyOSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAz
MCBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBh
cmNoL2FybS9tYWNoLXN0bTMybXAvY29uZmlnLm1rCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0v
ZHRzL3N0bTMybXAxNS11LWJvb3QuZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTUtdS1ib290
LmR0c2kKPiBpbmRleCA0M2E3OTA5OTc4Li5kYjIzZDgwZWVmIDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtL2R0cy9zdG0zMm1wMTUtdS1ib290LmR0c2kKPiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJt
cDE1LXUtYm9vdC5kdHNpCj4gQEAgLTIxLDYgKzIxLDEwIEBACj4gICAJCXBpbmN0cmwxID0gJnBp
bmN0cmxfejsKPiAgIAl9Owo+ICAgCj4gKwliaW5tYW46IGJpbm1hbiB7Cj4gKwkJbXVsdGlwbGUt
aW1hZ2VzOwo+ICsJfTsKPiArCj4gICAJY2xvY2tzIHsKPiAgIAkJdS1ib290LGRtLXByZS1yZWxv
YzsKPiAgIAl9Owo+IEBAIC0yMjgsMyArMjMyLDI4IEBACj4gICAJcmVzZXRzID0gPCZyY2MgVUFS
VDhfUj47Cj4gICB9Owo+ICAgCj4gKyNpZiBkZWZpbmVkKENPTkZJR19TVE0zMk1QMTV4X1NUTTMy
SU1BR0UpCj4gKyZiaW5tYW4gewo+ICsJdS1ib290LXN0bTMyIHsKPiArCQlmaWxlbmFtZSA9ICJ1
LWJvb3Quc3RtMzIiOwo+ICsJCW1raW1hZ2Ugewo+ICsJCQlhcmdzID0gIi1UIHN0bTMyaW1hZ2Ug
LWEgMHhDMDEwMDAwMCAtZSAweEMwMTAwMDAwIjsKPiArCQkJdS1ib290IHsKPiArCQkJfTsKPiAr
CQl9Owo+ICsJfTsKPiArfTsKPiArI2VuZGlmCj4gKwo+ICsjaWYgZGVmaW5lZChDT05GSUdfU1BM
KQo+ICsmYmlubWFuIHsKPiArCXNwbC1zdG0zMiB7Cj4gKwkJZmlsZW5hbWUgPSAidS1ib290LXNw
bC5zdG0zMiI7Cj4gKwkJbWtpbWFnZSB7Cj4gKwkJCWFyZ3MgPSAiLVQgc3RtMzJpbWFnZSAtYSAw
eDJGRkMyNTAwIC1lIDB4MkZGQzI1MDAiOwo+ICsJCQl1LWJvb3Qtc3BsIHsKPiArCQkJfTsKPiAr
CQl9Owo+ICsJfTsKPiArfTsKPiArI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gt
c3RtMzJtcC9LY29uZmlnIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tjb25maWcKPiBpbmRleCA2
OWQ1NmMyM2UxLi40YWNiMjkzMzNjIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJt
cC9LY29uZmlnCj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL0tjb25maWcKPiBAQCAtMzcs
NiArMzcsNyBAQCBjb25maWcgU1RNMzJNUDE1eAo+ICAgCWJvb2wgIlN1cHBvcnQgU1RNaWNyb2Vs
ZWN0cm9uaWNzIFNUTTMyTVAxNXggU29jIgo+ICAgCXNlbGVjdCBBUkNIX1NVUFBPUlRfUFNDSSBp
ZiAhVEZBQk9PVAo+ICAgCXNlbGVjdCBBUk1fU01DQ0MgaWYgVEZBQk9PVAo+ICsJc2VsZWN0IEJJ
Tk1BTgo+ICAgCXNlbGVjdCBDUFVfVjdBCj4gICAJc2VsZWN0IENQVV9WN19IQVNfTk9OU0VDIGlm
ICFURkFCT09UCj4gICAJc2VsZWN0IENQVV9WN19IQVNfVklSVAo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9tYWNoLXN0bTMybXAvY29uZmlnLm1rIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NvbmZp
Zy5tawo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IGY3ZjViNzdjNDEuLjAwMDAw
MDAwMDAKPiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvY29uZmlnLm1rCj4gKysrIC9kZXYv
bnVsbAo+IEBAIC0xLDI5ICswLDAgQEAKPiAtIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMCsgT1IgQlNELTMtQ2xhdXNlCj4gLSMKPiAtIyBDb3B5cmlnaHQgKEMpIDIwMTgsIFNUTWlj
cm9lbGVjdHJvbmljcyAtIEFsbCBSaWdodHMgUmVzZXJ2ZWQKPiAtIwo+IC0KPiAtaWZuZGVmIENP
TkZJR19TUEwKPiAtSU5QVVRTLSQoQ09ORklHX1NUTTMyTVAxNXhfU1RNMzJJTUFHRSkgKz0gdS1i
b290LnN0bTMyCj4gLWVsc2UKPiAtaWZkZWYgQ09ORklHX1NQTF9CVUlMRAo+IC1JTlBVVFMteSAr
PSB1LWJvb3Qtc3BsLnN0bTMyCj4gLWVuZGlmCj4gLWVuZGlmCj4gLQo+IC1NS0lNQUdFRkxBR1Nf
dS1ib290LnN0bTMyID0gLVQgc3RtMzJpbWFnZSAtYSAkKENPTkZJR19TWVNfVEVYVF9CQVNFKSAt
ZSAkKENPTkZJR19TWVNfVEVYVF9CQVNFKQo+IC0KPiAtdS1ib290LnN0bTMyOiBNS0lNQUdFT1VU
UFVUID0gdS1ib290LnN0bTMyLmxvZwo+IC0KPiAtdS1ib290LnN0bTMyOiB1LWJvb3QuYmluIEZP
UkNFCj4gLQkkKGNhbGwgaWZfY2hhbmdlZCxta2ltYWdlKQo+IC0KPiAtTUtJTUFHRUZMQUdTX3Ut
Ym9vdC1zcGwuc3RtMzIgPSAtVCBzdG0zMmltYWdlIC1hICQoQ09ORklHX1NQTF9URVhUX0JBU0Up
IC1lICQoQ09ORklHX1NQTF9URVhUX0JBU0UpCj4gLQo+IC1zcGwvdS1ib290LXNwbC5zdG0zMjog
TUtJTUFHRU9VVFBVVCA9IHNwbC91LWJvb3Qtc3BsLnN0bTMyLmxvZwo+IC0KPiAtc3BsL3UtYm9v
dC1zcGwuc3RtMzI6IHNwbC91LWJvb3Qtc3BsLmJpbiBGT1JDRQo+IC0JJChjYWxsIGlmX2NoYW5n
ZWQsbWtpbWFnZSkKPiAtCj4gLXUtYm9vdC1zcGwuc3RtMzIgOiBzcGwvdS1ib290LXNwbC5zdG0z
Mgo+IC0JJChjYWxsIGlmX2NoYW5nZWQsY29weSkKCgpUaGUgYmluYXJ5IGFyZSBjb3JyZWN0bHkg
bWFuYWdlZCBmb3IgYmFzaWMgYm9vdCBvciB0cnVzdGVkIGJvb3QgKFRGQUJPT1QgCndpdGggU1RN
MzJJTUFHRSBzdXBwb3J0KQoKCmJ1dCB0aGUgVEYtQSBib290IHdpdGggRklQIGZhaWxlZCB3aXRo
IHRoZSBlcnJvcjoKCgpOT1RJQ0U6wqAgQ1BVOiBTVE0zMk1QMTU3Q0FDIFJldi5CCk5PVElDRTrC
oCBNb2RlbDogU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyTVAxNTdDLURLMiBEaXNjb3ZlcnkgQm9h
cmQKTk9USUNFOsKgIEJvYXJkOiBNQjEyNzIgVmFyMi4wIFJldi5DLTAxCk5PVElDRTrCoCBCTDI6
IHYyLjUocmVsZWFzZSk6djIuNS02MTQtZzQwMzU4ZmM1NApOT1RJQ0U6wqAgQkwyOiBCdWlsdCA6
IDE0OjU0OjM1LCBPY3QgMTIgMjAyMQpOT1RJQ0U6wqAgQkwyOiBCb290aW5nIEJMMzIKSS9UQzog
RWFybHkgY29uc29sZSBvbiBVQVJUIzQKSS9UQzoKSS9UQzogUGFnZXIgaXMgZW5hYmxlZC4gSGFz
aGVzOiAyMTc2IGJ5dGVzCkkvVEM6IFBhZ2VyIHBvb2wgc2l6ZTogOTZrQgpJL1RDOiBOb24tc2Vj
dXJlIGV4dGVybmFsIERUIGZvdW5kCkkvVEM6IEVtYmVkZGVkIERUQiBmb3VuZApJL1RDOiBPUC1U
RUUgdmVyc2lvbjogMy4xNS4wLXJjMS0xLWc5NmM3YjYzM2IgKGdjYyB2ZXJzaW9uIDkuMy4wIChH
Q0MpKSAKIzEgVHVlIE9jdCAxMiAxNDo1NjoyNSBVVEMgMjAyMSBhcm0KSS9UQzogUHJpbWFyeSBD
UFUgaW5pdGlhbGl6aW5nCkkvVEM6IFBsYXRmb3JtIHN0bTMybXAxOiBmbGF2b3IgUExBVEZPUk1f
RkxBVk9SIC0gRFQgc3RtMzJtcDE1N2MtZGsyLmR0cwpJL1RDOiBSQ0MgaXMgbm9uLXNlY3VyZQpJ
L1RDOiBEVEIgZW5hYmxlcyBjb25zb2xlIChub24tc2VjdXJlKQpJL1RDOiBQcmltYXJ5IENQVSBz
d2l0Y2hpbmcgdG8gbm9ybWFsIHdvcmxkIGJvb3QKCgpVLUJvb3QgMjAyMS4xMC0wMDYwOS1nYmQ2
YzJkMzhkMSAoT2N0IDEyIDIwMjEgLSAxNjo1OTo0MiArMDIwMCkKCkNQVTogU1RNMzJNUDE1N0NB
QyBSZXYuQgpNb2RlbDogU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyTVAxNTdDLURLMiBEaXNjb3Zl
cnkgQm9hcmQKQm9hcmQ6IHN0bTMybXAxIGluIHRydXN0ZWQgbW9kZSAoc3Qsc3RtMzJtcDE1N2Mt
ZGsyKQpCb2FyZDogTUIxMjcyIFZhcjIuMCBSZXYuQy0wMQpEUkFNOsKgIDUxMiBNaUIKQ2xvY2tz
OgotIE1QVSA6IDY1MCBNSHoKLSBNQ1UgOiAyMDguODc4IE1IegotIEFYSSA6IDI2Ni41MDAgTUh6
Ci0gUEVSIDogMjQgTUh6Ci0gRERSIDogNTMzIE1IegpiaW5tYW5faW5pdCBmYWlsZWQ6LTIKaW5p
dGNhbGwgc2VxdWVuY2UgZGRjZTkxYjggZmFpbGVkIGF0IGNhbGwgYzAxMWE4MjUgKGVycj0tMikK
IyMjIEVSUk9SICMjIyBQbGVhc2UgUkVTRVQgdGhlIGJvYXJkICMjIwoKCj0+IGFmdGVyIGFuYWx5
c2lzLCB0aGUgQ09ORklHX0JJTk1BTl9GRFQgc2hvdWxkIGJlIGRlYWN0aXZhdGVkCgogwqDCoMKg
wqDCoCBhcyBTVE0zMk1QMTV4IFUtQm9vdCBoYXZlIG5vIHJlYXNvbiB0byBwYXJzZSB0aGUgYmlu
bWFuIG5vZGUKCiDCoMKgwqDCoCAobm8gYmluYXJ5IHRvIHNlbGVjdCBvciB0byBsb2FkKSA9IHRo
ZSBiaW5tYW4gbGlicmFyeSBjYW4gYmUgCmRlYWN0aXZhdGVkCgoKSSB3aWxsIGFkZCBpbiBWMgoK
IyBDT05GSUdfQklOTUFOX0ZEVCBpcyBub3Qgc2V0CgppbiBhbGwgc3RtMzJtcDE1XypfZGVmY29u
ZmlnCgoKClJlZ2FyZHMKClBhdHJpY2sKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
