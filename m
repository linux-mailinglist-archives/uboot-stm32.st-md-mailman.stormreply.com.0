Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE784158BC7
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2020 10:21:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4637C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Feb 2020 09:21:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADC85C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 09:20:57 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01B9CbLW007486; Tue, 11 Feb 2020 10:20:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qcgwL9HCfL6eaQpj6pHaeQJpMdPap/uHhwoRqdtC3q4=;
 b=QxqZUpBvRc1i/PEkp82Gxq5T89RJCHBhvSrkWNKuq6t6Pbslvw0zt4vrFwTQck+eJynh
 3CKh6yl1Q15DCKin/qYptefj/3a3n4//mcnDmZFeaVI5XEhc3tAWDHnPOPdgO8B/GPYd
 isezpAhbwSggWzQ25mhivsf4IGwyu3mGjmmN1gLhpnOUzkVaTM2WeRHKmbs6puGEeV5b
 fO7HSbrIOO1+uLwAy5POwmeQGGSxTuDkHSgk2fKSFOx7n4LewKsvtR3mBoxDmnbglAsi
 j1KF6rQaneTIyxbJBwYvIryvDGKGzDZ4jqH/K1rnjtktWAYwplvuNWpeNR5sgoaYP55Z bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urh2jq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 10:20:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A0AE610002A;
 Tue, 11 Feb 2020 10:20:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84C2A2A8FC2;
 Tue, 11 Feb 2020 10:20:48 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Feb
 2020 10:20:48 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 11 Feb 2020 10:20:48 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Thread-Topic: [PATCH v2 7/7] test: env: add test for env info sub-command
Thread-Index: AQHV4DPBTvS5GHUANUqbyZUqt1mUPqgUz0kAgADoHmA=
Date: Tue, 11 Feb 2020 09:20:48 +0000
Message-ID: <d3584df1aed545cfb1455e07446d70ef@SFHDAG6NODE3.st.com>
References: <20200210170129.8405-1-patrick.delaunay@st.com>
 <20200210170129.8405-6-patrick.delaunay@st.com>
 <4b5a447b-0d0f-2a34-033a-c34bdc89afcf@wwwdotorg.org>
In-Reply-To: <4b5a447b-0d0f-2a34-033a-c34bdc89afcf@wwwdotorg.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_02:2020-02-10,
 2020-02-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [PATCH v2 7/7] test: env: add test for env info
	sub-command
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

SGkgU3RlcGhlbg0KDQo+IEZyb206IFN0ZXBoZW4gV2FycmVuIDxzd2FycmVuQHd3d2RvdG9yZy5v
cmc+DQo+IFNlbnQ6IGx1bmRpIDEwIGbDqXZyaWVyIDIwMjAgMjE6MjUNCj4gDQo+IE9uIDIvMTAv
MjAgMTA6MDEgQU0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6DQo+ID4gQWRkIGEgcHl0ZXN0IGZv
ciB0ZXN0aW5nIHRoZSBlbnYgaW5mbyBzdWItY29tbWFuZDoNCj4gPg0KPiA+IHRlc3RfZW52X2lu
Zm86IHRlc3QgY29tbWFuZCB3aXRoIHNldmVyYWwgb3B0aW9uDQo+ID4NCj4gPiB0ZXN0X2Vudl9p
bmZvX3Rlc3Q6IHRlc3QgdGhlIHJlc3VsdCBvZiB0aGUgc3ViLWNvbW1hbmRpIHdpdGggcXVpZXQN
Cj4gPiBvcHRpb24sDQo+IA0KPiBOaXQ6IFJlbW92ZSAiaSIgZnJvbSB0aGUgZW5kIG9mICJzdWIt
Y29tbWFuZGkiLg0KDQp5ZXMNCiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdC9weS90ZXN0cy90ZXN0
X2Vudi5weSBiL3Rlc3QvcHkvdGVzdHMvdGVzdF9lbnYucHkNCj4gDQo+ID4gK0BweXRlc3QubWFy
ay5ib2FyZHNwZWMoJ3NhbmRib3gnKQ0KPiANCj4gSSBhc3N1bWUgdGhhdCdzIGp1c3Qgc28gdGhp
bmdzIGxpa2UgImVudmlyb25tZW50IGNhbid0IGJlIHBlcnNpc3RlZCIgY2FuIGJlDQo+IGd1YXJh
bnRlZWQsIHNpbmNlIG90aGVyIGJvYXJkcyB3aWxsIGJlIGRpZmZlcmVudCB0byBzYW5kYm94IGhl
cmU/DQoNClllcy4NCg0KQW5kIGFsc28gIHRoZSB0ZXN0IGlzIGJhc2VkIG9uIGNvbW1hbmQgImVu
dl9sb2MiIChzZWxlY3QgdGhlIGVudiBiYWNrZW5kIHVzZWQpIHdoaWNoIGlzIHNhbmRib3ggc3Bl
Y2lmaWMuDQpTbyB0aGlzIHRlc3Qgd2lsbCBmYWlsZWQgb24gcmVhbCBwbGF0Zm9ybS4NCg0KIA0K
PiA+ICtAcHl0ZXN0Lm1hcmsuYnVpbGRjb25maWdzcGVjKCdjbWRfbnZlZGl0X2luZm8nKQ0KPiA+
ICtAcHl0ZXN0Lm1hcmsuYnVpbGRjb25maWdzcGVjKCdjbWRfZWNobycpDQo+ID4gK2RlZiB0ZXN0
X2Vudl9pbmZvX3Rlc3Qoc3RhdGVfdGVzdF9lbnYpOg0KPiA+ICsNCj4gPiArICAgICIiIlRlc3Qg
J2VudiBpbmZvJyBxdWlldCBjb21tYW5kIHJlc3VsdCB3aXRoIHNldmVyYWwgb3B0aW9ucyBmb3Ig
dGVzdC4NCj4gPiArICAgICIiIg0KPiANCj4gTml0OiBJdCB0b29rIG1lIGEgd2hpbGUgdG8gcmVh
bGl6ZWQgd2hhdCB0aGUgImZvciB0ZXN0IiBhbmQgIl90ZXN0Ig0KPiBmdW5jdGlvbiBuYW1lIHN1
ZmZpeCBtZWFudC4gUGVyaGFwcyBfcmV0Y29kZSBtaWdodCBiZSBhIGJldHRlciBmdW5jdGlvbiBu
YW1lDQo+IHN1ZmZpeD8NCg0Kb2sNCg0KIA0KPiBBY2tlZC1ieTogU3RlcGhlbiBXYXJyZW4gPHN3
YXJyZW5AbnZpZGlhLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
