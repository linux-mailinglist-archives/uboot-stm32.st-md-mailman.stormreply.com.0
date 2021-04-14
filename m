Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA91035F683
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Apr 2021 16:51:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A38CC57B76;
	Wed, 14 Apr 2021 14:51:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6A3AC57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Apr 2021 14:51:19 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EEgdWa024260; Wed, 14 Apr 2021 16:51:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hhJ15hHRNI6vSc7bSm8tSRmupxFQbhnXagT1LcWF0IM=;
 b=LFhMKgYr3RHFL1RRXz4FW/PqjHprboenfs0JUW+NgddfPeJ7bW1A3tkAKYjeq6AXwvim
 s6GeU8Iqwhi1uQaoWwjPDW39R5GcC1pt4tNntFD+gyyd2c37L/RArFR/xWQFgG3R1Cxh
 /G7UQJBqfcX7FP8VtJYoIjffa1ZqfchJ9ONdSo8QCdJz9l8MbIxdOLdRKsSc9Jll5y3K
 rsaD7p8T5L5rWyWowVX3MOdrVJJaI4pBFOIH0TT1hLNZp2IUzoYdnMByoMhEfQ30OpQk
 ZNT52m7aEqvAlq0JdzuKdUk6fKxze+X2qREDPw/La/DYDXFuW4PVvjhNv6eTrCdPo6ZD Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37wrbpv1vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 16:51:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5735C10002A;
 Wed, 14 Apr 2021 16:51:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3CE2D246F35;
 Wed, 14 Apr 2021 16:51:02 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr
 2021 16:51:01 +0200
To: <u-boot@lists.denx.de>
References: <20210208132655.25057-1-patrick.delaunay@foss.st.com>
 <20210208142645.v2.7.I27d5ccee284a768e98f06abc8949579f65c85018@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <a98a7003-fe8d-e9b9-df4d-0af31dd99e9a@foss.st.com>
Date: Wed, 14 Apr 2021 16:50:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210208142645.v2.7.I27d5ccee284a768e98f06abc8949579f65c85018@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_07:2021-04-14,
 2021-04-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 marek.bykowski@gmail.com, Etienne
 Carriere <etienne.carriere@linaro.org>, Ard Biesheuvel <ardb@kernel.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH v2 7/7] arm: cache: cp15: don't map the
 reserved region with no-map property
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

SGksCgpPbiAyLzgvMjEgMjoyNiBQTSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPiBObyBtb3Jl
IG1hcCB0aGUgcmVzZXJ2ZWQgcmVnaW9uIHdpdGggIm5vLW1hcCIgcHJvcGVydHkgYnkgbWFya2lu
Zwo+IHRoZSBjb3JyZXNwb25kaW5nIFRMQiBlbnRyaWVzIHdpdGggaW52YWxpZCBlbnRyeSAoPTAp
IHRvIGF2b2lkCj4gc3BlY3VsYXRpdmUgYWNjZXNzLgo+Cj4gVGhpcyBwYXRjaCBmaXhlcyBwb3Rl
bnRpYWwgaXNzdWUgd2hlbiBwcmVkaWN0aXZlIGFjY2VzcyBpcyBkb25lIGJ5IEFSTQo+IGNvcmUu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5
QGZvc3Muc3QuY29tPgo+IC0tLQo+Cj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4KPiAgIGFyY2gv
YXJtL2luY2x1ZGUvYXNtL3N5c3RlbS5oIHwgIDMgKysrCj4gICBhcmNoL2FybS9saWIvY2FjaGUt
Y3AxNS5jICAgICB8IDE5ICsrKysrKysrKysrKysrKysrLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9zeXN0ZW0uaCBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3N5c3RlbS5oCj4g
aW5kZXggMTFmY2VlYzRkMi4uYzYzZWQwN2YyYyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9pbmNs
dWRlL2FzbS9zeXN0ZW0uaAo+ICsrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3N5c3RlbS5oCj4g
QEAgLTQ0NCw2ICs0NDQsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X2NyKHVuc2lnbmVkIGlu
dCB2YWwpCj4gICAKPiAgIC8qIG9wdGlvbnMgYXZhaWxhYmxlIGZvciBkYXRhIGNhY2hlIG9uIGVh
Y2ggcGFnZSAqLwo+ICAgZW51bSBkY2FjaGVfb3B0aW9uIHsKPiArCUlOVkFMSURfRU5UUlkgPSAw
LAo+ICAgCURDQUNIRV9PRkYgPSBUVEJfU0VDVCB8IFRUQl9TRUNUX01BSVIoMCkgfCBUVEJfU0VD
VF9YTl9NQVNLLAo+ICAgCURDQUNIRV9XUklURVRIUk9VR0ggPSBUVEJfU0VDVCB8IFRUQl9TRUNU
X01BSVIoMSksCj4gICAJRENBQ0hFX1dSSVRFQkFDSyA9IFRUQl9TRUNUIHwgVFRCX1NFQ1RfTUFJ
UigyKSwKPiBAQCAtNDc0LDYgKzQ3NSw3IEBAIGVudW0gZGNhY2hlX29wdGlvbiB7Cj4gICAgKiAg
IDEgICAgMSAgMSAgIE91dGVyL0lubmVyIFdyaXRlLUJhY2ssIFJlYWQtQWxsb2NhdGUgV3JpdGUt
QWxsb2NhdGUKPiAgICAqLwo+ICAgZW51bSBkY2FjaGVfb3B0aW9uIHsKPiArCUlOVkFMSURfRU5U
UlkgPSAwLAo+ICAgCURDQUNIRV9PRkYgPSBUVEJfU0VDVF9ET01BSU4oMCkgfCBUVEJfU0VDVF9Y
Tl9NQVNLIHwgVFRCX1NFQ1QsCj4gICAJRENBQ0hFX1dSSVRFVEhST1VHSCA9IFRUQl9TRUNUX0RP
TUFJTigwKSB8IFRUQl9TRUNUIHwgVFRCX1NFQ1RfQ19NQVNLLAo+ICAgCURDQUNIRV9XUklURUJB
Q0sgPSBEQ0FDSEVfV1JJVEVUSFJPVUdIIHwgVFRCX1NFQ1RfQl9NQVNLLAo+IEBAIC00ODMsNiAr
NDg1LDcgQEAgZW51bSBkY2FjaGVfb3B0aW9uIHsKPiAgICNkZWZpbmUgVFRCX1NFQ1RfQVAJCSgz
IDw8IDEwKQo+ICAgLyogb3B0aW9ucyBhdmFpbGFibGUgZm9yIGRhdGEgY2FjaGUgb24gZWFjaCBw
YWdlICovCj4gICBlbnVtIGRjYWNoZV9vcHRpb24gewo+ICsJSU5WQUxJRF9FTlRSWSA9IDAsCj4g
ICAJRENBQ0hFX09GRiA9IDB4MTIsCj4gICAJRENBQ0hFX1dSSVRFVEhST1VHSCA9IDB4MWEsCj4g
ICAJRENBQ0hFX1dSSVRFQkFDSyA9IDB4MWUsCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2xpYi9j
YWNoZS1jcDE1LmMgYi9hcmNoL2FybS9saWIvY2FjaGUtY3AxNS5jCj4gaW5kZXggOGE0OWU1MjE3
Yy4uOGEzNTRkMzY0ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9saWIvY2FjaGUtY3AxNS5jCj4g
KysrIGIvYXJjaC9hcm0vbGliL2NhY2hlLWNwMTUuYwo+IEBAIC02LDYgKzYsNyBAQAo+ICAgCj4g
ICAjaW5jbHVkZSA8Y29tbW9uLmg+Cj4gICAjaW5jbHVkZSA8Y3B1X2Z1bmMuaD4KPiArI2luY2x1
ZGUgPGxtYi5oPgo+ICAgI2luY2x1ZGUgPGxvZy5oPgo+ICAgI2luY2x1ZGUgPGFzbS9zeXN0ZW0u
aD4KPiAgICNpbmNsdWRlIDxhc20vY2FjaGUuaD4KPiBAQCAtMTAxLDE4ICsxMDIsMzIgQEAgdm9p
ZCBtbXVfc2V0X3JlZ2lvbl9kY2FjaGVfYmVoYXZpb3VyKHBoeXNfYWRkcl90IHN0YXJ0LCBzaXpl
X3Qgc2l6ZSwKPiAgIF9fd2VhayB2b2lkIGRyYW1fYmFua19tbXVfc2V0dXAoaW50IGJhbmspCj4g
ICB7Cj4gICAJc3RydWN0IGJkX2luZm8gKmJkID0gZ2QtPmJkOwo+ICsJc3RydWN0IGxtYiBsbWI7
Cj4gICAJaW50CWk7Cj4gICAKPiAgIAkvKiBiZC0+YmlfZHJhbSBpcyBhdmFpbGFibGUgb25seSBh
ZnRlciByZWxvY2F0aW9uICovCj4gICAJaWYgKChnZC0+ZmxhZ3MgJiBHRF9GTEdfUkVMT0MpID09
IDApCj4gICAJCXJldHVybjsKPiAgIAo+ICsJLyoKPiArCSAqIGRvbid0IGFsbG93IGNhY2hlIG9u
IHJlc2VydmVkIG1lbW9yeSB0YWdnZWQgJ25vLW1hcCcgaW4gRFQKPiArCSAqID0+IGF2b2lkIHNw
ZWN1bGF0aXZlIGFjY2VzcyB0byAic2VjdXJlIiBkYXRhCj4gKwkgKi8KPiArCWlmIChJU19FTkFC
TEVEKENPTkZJR19MTUIpKQo+ICsJCWxtYl9pbml0X2FuZF9yZXNlcnZlKCZsbWIsIGJkLCAodm9p
ZCAqKWdkLT5mZHRfYmxvYik7Cj4gKwo+ICAgCWRlYnVnKCIlczogYmFuazogJWRcbiIsIF9fZnVu
Y19fLCBiYW5rKTsKPiAgIAlmb3IgKGkgPSBiZC0+YmlfZHJhbVtiYW5rXS5zdGFydCA+PiBNTVVf
U0VDVElPTl9TSElGVDsKPiAgIAkgICAgIGkgPCAoYmQtPmJpX2RyYW1bYmFua10uc3RhcnQgPj4g
TU1VX1NFQ1RJT05fU0hJRlQpICsKPiAgIAkJIChiZC0+YmlfZHJhbVtiYW5rXS5zaXplID4+IE1N
VV9TRUNUSU9OX1NISUZUKTsKPiAtCSAgICAgaSsrKQo+IC0JCXNldF9zZWN0aW9uX2RjYWNoZShp
LCBEQ0FDSEVfREVGQVVMVF9PUFRJT04pOwo+ICsJICAgICBpKyspIHsKPiArCQlpZiAoSVNfRU5B
QkxFRChDT05GSUdfTE1CKSAmJgo+ICsJCSAgICBsbWJfaXNfcmVzZXJ2ZWRfZmxhZ3MoJmxtYiwg
aSA8PCBNTVVfU0VDVElPTl9TSElGVCwKPiArCQkJCQkgIExNQl9OT01BUCkpCj4gKwkJCXNldF9z
ZWN0aW9uX2RjYWNoZShpLCBJTlZBTElEX0VOVFJZKTsKPiArCQllbHNlCj4gKwkJCXNldF9zZWN0
aW9uX2RjYWNoZShpLCBEQ0FDSEVfREVGQVVMVF9PUFRJT04pOwo+ICsJfQo+ICAgfQo+ICAgCj4g
ICAvKiB0byBhY3RpdmF0ZSB0aGUgTU1VIHdlIG5lZWQgdG8gc2V0IHVwIHZpcnR1YWwgbWVtb3J5
OiB1c2UgMU0gYXJlYXMgKi8KCgpIaSwKCgpBZnRlciBtb3JlIHRlc3Qgb24gc3RtMzJtcDE1eCBw
bGF0Zm9ybSwgdGhlIHBhdGNoIFs2LzddIGludHJvZHVjZWQKCnBlcmZvcm1hbmNlIGlzc3VlIGZv
ciB0aGUgYm9vdCB0aW1lLgoKClRoZSBkZXZpY2UgdHJlZSBwYXJzaW5nIGRvbmUgaW4gbG1iX2lu
aXRfYW5kX3Jlc2VydmUoKSB0byBmb3VuZCB0aGUKCnRoZSByZXNlcnZlZCBtZW1vcnkgcmVnaW9u
IHdpdGggIm5vLW1hcCIgdGFnIGlzIGRvbmUgd2l0aCBkYXRhCgpjYWNoZSBkZWFjdGl2YXRlZCAo
YXMgaXQgaXMgY2FsbGVkIGJlZm9yZSBNTVUgYW5kIGRhdGEgY2FjaGUgYWN0aXZhdGlvbikuCgoK
VGhpcyBwYXJzaW5nIGluY3JlYXNlIHRoZSBkZXZpY2UgYm9vdCB0aW1lIChzZXZlcmFsIHNlY29u
ZCBsb3N0IGluIApzdG0zMm1wMTUpLgoKU28gSSBuZWVkIHRvIHNlbnQgYSB1cGRhdGUgdmVyc2lv
biBmb3IgdGhpcyBwYXRjaCBbNi83XQoKCkJ1dCBJIHdpbGwgYWxzbyBkcm9wIHRoaXMgcGF0Y2jC
oCBwYXRjaCBbNy83XSB0byBhdm9pZCB0byBpbmNyZWFzZSB0aGUgCmJvb3QgdGltZQoKb24gb3Ro
ZXIgYXJtIHBsYXRmb3JtIHVzaW5nIGNwMTUuCgoKUmVnYXJkcwoKClBhdHJpY2sKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
