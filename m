Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8E15D35C
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 09:07:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F24DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 08:07:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05EA0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 08:07:35 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01E7x6jj023579; Fri, 14 Feb 2020 09:07:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=sehkjKAI2PyHkuWQOP286gzjO2VTq0i3Quv1s+IXHu0=;
 b=mLM2p/EjXXtORv2NYDk5agXTXCDQNsjXSurVW98AUGh96Hb6mdiG1CC3E0aOdqNi9t/c
 6vn70krWq2sk4sOoe1j8wnDtyF7eL3xvnuU6QVl2LK+3nNzY/LLihseBcPYQZou3bZWp
 AlbFS94VWT7gZYSNsxoeeUjAr/B9cXqKSn4eU44SGZPot/5uwGhKn/07NwNPRiM4cutn
 8Ocn4VYHIHDeLfgFUxBtGc+Nv+kALvzpGKMZWI7FWB/3bsrEpwcJ0p31e2hF6NVjvPjY
 gVrZFz5PZUzIwB6s3Tz+W3MyG45giSVwFviIxEBZAlb9JFogEWXSQOK+PxmsPl06HlnM Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urht92r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 09:07:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F454100039;
 Fri, 14 Feb 2020 09:07:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0CD2C21FEBE;
 Fri, 14 Feb 2020 09:07:29 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 14 Feb
 2020 09:07:28 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 09:07:28 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 4/4] clk: stm32mp1: solve type issue in
 stm32mp1_lse_enable and stm32mp1_clktree
Thread-Index: AQHV1b+EAGROwPgWlEe0qUDUB69tdagaX1MA
Date: Fri, 14 Feb 2020 08:07:28 +0000
Message-ID: <720f35fc-d69e-3014-4f1f-be5e46dfe2a1@st.com>
References: <20200128094415.5768-1-patrick.delaunay@st.com>
 <20200128094415.5768-5-patrick.delaunay@st.com>
In-Reply-To: <20200128094415.5768-5-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <28271F02FC7CA44E9568509C64F4A991@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_01:2020-02-12,
 2020-02-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 4/4] clk: stm32mp1: solve type issue in
 stm32mp1_lse_enable and stm32mp1_clktree
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

DQpPbiAxLzI4LzIwIDEwOjQ0IEFNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOg0KPiBTb2x2ZSB0
eXBlIGlzc3VlIGluIHN0bTMybXAxX2xzZV9lbmFibGUgYW5kIHN0bTMybXAxX2Nsa3RyZWUuDQo+
DQo+IFRoaXMgcGF0Y2ggc29sdmVzIHRoZSB3YXJuaW5ncyB3aGVuIGNvbXBpbGluZyB3aXRoIFc9
MQ0KPiBvbiBzdG0zMm1wMSBib2FyZDoNCj4NCj4gY2xrX3N0bTMybXAxLmM6IEluIGZ1bmN0aW9u
IOKAmHN0bTMybXAxX2xzZV9lbmFibGXigJk6DQo+IGNsa19zdG0zMm1wMS5jOjEyMzg6MTU6IHdh
cm5pbmc6IGNvbXBhcmlzb24gb2YgaW50ZWdlciBleHByZXNzaW9ucw0KPiAgIG9mIGRpZmZlcmVu
dCBzaWduZWRuZXNzOiDigJh1MzLigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IGFuZCDigJhp
bnTigJkNCj4gICBbLVdzaWduLWNvbXBhcmVdDQo+IGNsa19zdG0zMm1wMS5jOjEyMzk6MTM6IHdh
cm5pbmc6IGNvbXBhcmlzb24gb2YgaW50ZWdlciBleHByZXNzaW9ucw0KPiAgIG9mIGRpZmZlcmVu
dCBzaWduZWRuZXNzOiDigJh1MzLigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IGFuZCDigJhp
bnTigJkNCj4gICBbLVdzaWduLWNvbXBhcmVdDQo+DQo+IGNsa19zdG0zMm1wMS5jOiBJbiBmdW5j
dGlvbiDigJhzdG0zMm1wMV9jbGt0cmVl4oCZOg0KPiBjbGtfc3RtMzJtcDEuYzoxODE0OjE3OiB3
YXJuaW5nOiBjb21wYXJpc29uIG9mIGludGVnZXIgZXhwcmVzc2lvbnMNCj4gICBvZiBkaWZmZXJl
bnQgc2lnbmVkbmVzczog4oCYaW504oCZIGFuZCDigJh1bnNpZ25lZCBpbnTigJkNCj4gICBbLVdz
aWduLWNvbXBhcmVdDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJp
Y2suZGVsYXVuYXlAc3QuY29tPg0KPiAtLS0NCj4NCj4gIGRyaXZlcnMvY2xrL2Nsa19zdG0zMm1w
MS5jIHwgOSArKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGtfc3RtMzJtcDEu
YyBiL2RyaXZlcnMvY2xrL2Nsa19zdG0zMm1wMS5jDQo+IGluZGV4IGRhNjZiZGU0MWIuLmZkOGM4
MjFlNDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvY2xrL2Nsa19zdG0zMm1wMS5jDQo+ICsrKyBi
L2RyaXZlcnMvY2xrL2Nsa19zdG0zMm1wMS5jDQo+IEBAIC0xMjE4LDcgKzEyMTgsNyBAQCBzdGF0
aWMgaW50IHN0bTMybXAxX29zY193YWl0KGludCBlbmFibGUsIGZkdF9hZGRyX3QgcmNjLCB1MzIg
b2Zmc2V0LA0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgdm9pZCBzdG0zMm1wMV9sc2VfZW5hYmxlKGZk
dF9hZGRyX3QgcmNjLCBpbnQgYnlwYXNzLCBpbnQgZGlnYnlwLA0KPiAtCQkJCWludCBsc2VkcnYp
DQo+ICsJCQkJdTMyIGxzZWRydikNCj4gIHsNCj4gIAl1MzIgdmFsdWU7DQo+ICANCj4gQEAgLTE2
NTEsOCArMTY1MSw4IEBAIHN0YXRpYyBpbnQgc3RtMzJtcDFfY2xrdHJlZShzdHJ1Y3QgdWRldmlj
ZSAqZGV2KQ0KPiAgCXVuc2lnbmVkIGludCBjbGtkaXZbQ0xLRElWX05CXTsNCj4gIAl1bnNpZ25l
ZCBpbnQgcGxsY2ZnW19QTExfTkJdW1BMTENGR19OQl07DQo+ICAJb2Zub2RlIHBsbG9mZltfUExM
X05CXTsNCj4gLQlpbnQgcmV0Ow0KPiAtCWludCBpLCBsZW47DQo+ICsJaW50IHJldCwgbGVuOw0K
PiArCXVpbnQgaTsNCj4gIAlpbnQgbHNlX2NzcyA9IDA7DQo+ICAJY29uc3QgdTMyICpwa2NzX2Nl
bGw7DQo+ICANCj4gQEAgLTE2OTgsNyArMTY5OCw4IEBAIHN0YXRpYyBpbnQgc3RtMzJtcDFfY2xr
dHJlZShzdHJ1Y3QgdWRldmljZSAqZGV2KQ0KPiAgCQlzdG0zMm1wMV9sc2lfc2V0KHJjYywgMSk7
DQo+ICANCj4gIAlpZiAocHJpdi0+b3NjW19MU0VdKSB7DQo+IC0JCWludCBieXBhc3MsIGRpZ2J5
cCwgbHNlZHJ2Ow0KPiArCQlpbnQgYnlwYXNzLCBkaWdieXA7DQo+ICsJCXUzMiBsc2VkcnY7DQo+
ICAJCXN0cnVjdCB1ZGV2aWNlICpkZXYgPSBwcml2LT5vc2NfZGV2W19MU0VdOw0KPiAgDQo+ICAJ
CWJ5cGFzcyA9IGRldl9yZWFkX2Jvb2woZGV2LCAic3QsYnlwYXNzIik7DQoNCg0KUmV2aWV3ZWQt
Ynk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCg0KVGhhbmtzDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0z
MiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9v
dC1zdG0zMgo=
