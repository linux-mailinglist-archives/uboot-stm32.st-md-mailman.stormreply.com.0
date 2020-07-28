Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01834230C0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 16:10:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C19E9C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 14:10:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7D53C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 14:10:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SE8LeG015422; Tue, 28 Jul 2020 16:10:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9CTVXlfExPDeHGU8a/a5E8B65UIYQ4Csh3dwL7AUeCo=;
 b=SL8o8qtg5pDWQnHRHkWYaHSJojUxl7GdWiGA6NyP90tBhPSCexsJHwygdidoeG+KOHv/
 2J0zgAUvk00Nb2jOTOhKnb33aIOayeZh9sFDzUrNX4AGHFcOja0TC/IL0SP8O8QmnnXc
 1NjBvc1A2UYHWfR9P5Oa1MXZ5C73VN5gce99X43qnDfDjEJcVJ9456zwQHQKsnHADa73
 20A3G0eN6vlS/Jal4UHbUVG/gKtltV+Bux0dG0AXkUY+YrixXEe6pC5S8xYGfghUsWJ7
 67TAs9a/dta5cqNYyoocDmzYVkv33x+5MJZuGvfUFenIbNN3ljwHQZYPv/MkdAK95Hle dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71xmua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 16:10:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 98FDA100034;
 Tue, 28 Jul 2020 16:10:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EAA92BF9DE;
 Tue, 28 Jul 2020 16:10:17 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 16:10:17 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 16:10:17 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] arm: stm32mp: use correct weak function name
 spl_board_prepare_for_linux
Thread-Index: AQHWVFkzI5xQI8XQnUCIleCiEaaOkakdB2kA
Date: Tue, 28 Jul 2020 14:10:17 +0000
Message-ID: <1278d480-322f-4dd1-ec34-cf55a7e4dd61@st.com>
References: <20200707122153.9624-1-patrick.delaunay@st.com>
In-Reply-To: <20200707122153.9624-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <EF9830C12194294C80DFD136B7F30A2C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_11:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: use correct weak function
 name spl_board_prepare_for_linux
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

DQpPbiA3LzcvMjAgMjoyMSBQTSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToNCj4gUmVwbGFjZSB0
aGUgZnVuY3Rpb24gc3BsX2JvYXJkX3ByZXBhcmVfZm9yX2Jvb3RfbGludXggYnkgdGhlIGNvcnJl
Y3QNCj4gbmFtZSBvZiB0aGUgd2VhayBmdW5jdGlvbiBzcGxfYm9hcmRfcHJlcGFyZV9mb3JfbGlu
dXggZGVmaW5lZCBpbiBzcGwuaC4NCj4NCj4gVGhpcyBwYXRjaCBhdm9pZHMgd2FybmluZyB3aXRo
IFc9MSBvcHRpb246DQo+DQo+IHUtYm9vdC9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3BsLmM6MTUw
OjY6DQo+IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYc3BsX2JvYXJkX3By
ZXBhcmVfZm9yX2Jvb3RfbGludXjigJkNCj4gWy1XbWlzc2luZy1wcm90b3R5cGVzXQ0KPg0KPiBG
aXhlczogZGM3ZTVmMTkwZGU1ICgiYXJtOiBzdG0zMm1wOiBhY3RpdmF0ZSBkYXRhIGNhY2hlIG9u
IEREUiBpbiBTUEwiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNr
LmRlbGF1bmF5QHN0LmNvbT4NCj4gLS0tDQo+DQo+ICBhcmNoL2FybS9tYWNoLXN0bTMybXAvc3Bs
LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zcGwuYyBiL2FyY2gv
YXJtL21hY2gtc3RtMzJtcC9zcGwuYw0KPiBpbmRleCAzOTQxM2U5YTBlLi5lODRiZGFkN2JmIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3BsLmMNCj4gKysrIGIvYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL3NwbC5jDQo+IEBAIC0xNDcsNyArMTQ3LDcgQEAgdm9pZCBzcGxfYm9h
cmRfcHJlcGFyZV9mb3JfYm9vdCh2b2lkKQ0KPiAgCWRjYWNoZV9kaXNhYmxlKCk7DQo+ICB9DQo+
ICANCj4gLXZvaWQgc3BsX2JvYXJkX3ByZXBhcmVfZm9yX2Jvb3RfbGludXgodm9pZCkNCj4gK3Zv
aWQgc3BsX2JvYXJkX3ByZXBhcmVfZm9yX2xpbnV4KHZvaWQpDQo+ICB7DQo+ICAJZGNhY2hlX2Rp
c2FibGUoKTsNCj4gIH0NCg0KUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQHN0LmNvbT4NCg0KVGhhbmtzDQoNClBhdHJpY2UNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9v
dC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
