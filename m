Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E51191898DB
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 11:05:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC788C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:05:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DACD2C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 10:05:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IA2SPZ024373; Wed, 18 Mar 2020 11:05:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6w3l/W9qNh8GoMN2LN8Cf67aWKW+e1vvLJtrH4k/1mE=;
 b=fGGFhBR1CgD403ftO+8CH56/kSyoZrRm3yAunwltlTuQnhW5iO75OZNogra3vtr810+V
 i2fLe18SkYH+isJB6Abz/YWTl/SkuQyV1u5i2EnSS6AsKDROVcfyYbQ2nseBSSEycaJX
 HkbaybVpYLCN1laIDmT5rkIsXC0Zv0S4V40p/X8wMi3ryt6gNVyKHpofTJNCjE8s1NcZ
 6JxQ4KXgPR23CbvOxsE+ZKLBvN9tCD2vYWQvGc6C3gXfMGCc2SlWPfCTToSOgddM+vaB
 UjlVfUGwpcON8QVuka6RLiYyMFG4iROjsfAEROBbzUblIrF8Xwgnp9OIVJ6fwwwUUTyC WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95ujpnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:05:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9DB52100034;
 Wed, 18 Mar 2020 11:04:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E752220FF0;
 Wed, 18 Mar 2020 11:04:57 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 11:04:57 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 11:04:57 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 03/10] arm: stm32mp: bsec: remove unneeded test
Thread-Index: AQHV4dOGhLtMFYQopkqUvj7T0AeJxKhORO8A
Date: Wed, 18 Mar 2020 10:04:57 +0000
Message-ID: <85eac143-b5b1-fabd-dea6-b2a5e5efdd00@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-4-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <3375923D1342DE44A762A6124D9D3DEC@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/10] arm: stm32mp: bsec: remove unneeded
	test
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

DQpPbiAyLzEyLzIwIDc6MzcgUE0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6DQo+IFJlbW92ZSB0
aGUgdGVzdCBvZmZzIDwgMCAsIGFzIG9mZnMgaXMgdW5zaWduZWQuDQo+DQo+IFRoaXMgcGF0Y2gg
c29sdmVzIHRoZSB3YXJuaW5ncyB3aGVuIGNvbXBpbGluZyB3aXRoIFc9MQ0KPiBvbiBzdG0zMm1w
MSBib2FyZDoNCj4NCj4gSW4gZnVuY3Rpb24g4oCYc3RtMzJtcF9ic2VjX3JlYWTigJk6DQo+IGFy
Y2gvYXJtL21hY2gtc3RtMzJtcC9ic2VjLmM6MzY4OjExOiB3YXJuaW5nOg0KPiBjb21wYXJpc29u
IG9mIHVuc2lnbmVkIGV4cHJlc3Npb24gPCAwIGlzIGFsd2F5cyBmYWxzZSBbLVd0eXBlLWxpbWl0
c10NCj4gICAzNjggfCAgaWYgKG9mZnMgPCAwIHx8IChvZmZzICUgNCkgfHwgKHNpemUgJSA0KSkN
Cj4gICAgICAgfCAgICAgICAgICAgXg0KPiBJbiBmdW5jdGlvbiDigJhzdG0zMm1wX2JzZWNfd3Jp
dGXigJk6DQo+IGFyY2gvYXJtL21hY2gtc3RtMzJtcC9ic2VjLmM6NDA1OjExOiB3YXJuaW5nOg0K
PiBjb21wYXJpc29uIG9mIHVuc2lnbmVkIGV4cHJlc3Npb24gPCAwIGlzIGFsd2F5cyBmYWxzZSBb
LVd0eXBlLWxpbWl0c10NCj4gICA0MDUgfCAgaWYgKG9mZnMgPCAwIHx8IChvZmZzICUgNCkgfHwg
KHNpemUgJSA0KSkNCj4gICAgICAgfCAgICAgICAgICAgXg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gLS0tDQo+DQo+ICBh
cmNoL2FybS9tYWNoLXN0bTMybXAvYnNlYy5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL2JzZWMuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9ic2VjLmMNCj4g
aW5kZXggYTc3YzcwNmExYS4uMWQ5MDRjYWFlMSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL2JzZWMuYw0KPiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvYnNlYy5jDQo+
IEBAIC0zNjUsNyArMzY1LDcgQEAgc3RhdGljIGludCBzdG0zMm1wX2JzZWNfcmVhZChzdHJ1Y3Qg
dWRldmljZSAqZGV2LCBpbnQgb2Zmc2V0LA0KPiAgCQlzaGFkb3cgPSBmYWxzZTsNCj4gIAl9DQo+
ICANCj4gLQlpZiAob2ZmcyA8IDAgfHwgKG9mZnMgJSA0KSB8fCAoc2l6ZSAlIDQpKQ0KPiArCWlm
ICgob2ZmcyAlIDQpIHx8IChzaXplICUgNCkpDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgDQo+
ICAJb3RwID0gb2ZmcyAvIHNpemVvZih1MzIpOw0KPiBAQCAtNDAyLDcgKzQwMiw3IEBAIHN0YXRp
YyBpbnQgc3RtMzJtcF9ic2VjX3dyaXRlKHN0cnVjdCB1ZGV2aWNlICpkZXYsIGludCBvZmZzZXQs
DQo+ICAJCXNoYWRvdyA9IGZhbHNlOw0KPiAgCX0NCj4gIA0KPiAtCWlmIChvZmZzIDwgMCB8fCAo
b2ZmcyAlIDQpIHx8IChzaXplICUgNCkpDQo+ICsJaWYgKChvZmZzICUgNCkgfHwgKHNpemUgJSA0
KSkNCj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICANCj4gIAlvdHAgPSBvZmZzIC8gc2l6ZW9mKHUz
Mik7DQoNCkFja2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+
DQoNClRoYW5rcw0KDQpQYXRyaWNlDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
