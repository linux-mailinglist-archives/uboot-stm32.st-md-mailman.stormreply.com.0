Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65340230EFA
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 18:13:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28AA1C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 16:13:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C973BC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 16:13:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SG7I7h031570; Tue, 28 Jul 2020 18:13:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Ms8OTVET8elcIDUf6D5/QP0tFixug/3Ua6b+jE3Vdxo=;
 b=kMte88VQXfWwwuf9PfJ5pjW1BkRo4FRwZOFiPpJfKSayYiI7KwGVwNgF45oFIMAcy5H3
 jajMS/3J+EgEzhb7IJLqkeVRz4UXu4YMi7RlYaPNHul5Cd3RHPpTi9ogkyI6j105V95h
 QLZvJjjX7osJm751UsoZxr2dwKQf7GLwkq5doWsyV5D7wrG4mVQTCHb96aT3kwoZqhaT
 47i3LXPgQhmoHVVwspE9c6lappiEfX+NlFOyOXjbdPY1k+OmmmbAi3m4AvGBuOqVJom0
 vQ72AZGAtUYSFaWKbhpQXE2FSp7bLpkndCi+gCSKHc6XzCeBp0mGd3xCGImnEQTOdkOB sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9fd1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 18:13:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A12B010002A;
 Tue, 28 Jul 2020 18:13:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 978E621F682;
 Tue, 28 Jul 2020 18:13:49 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 18:13:49 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 18:13:49 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] arm: stm32mp: use correct weak function
 name spl_board_prepare_for_linux
Thread-Index: AQHWVFkzI5xQI8XQnUCIleCiEaaOkakdB2kAgAAigwA=
Date: Tue, 28 Jul 2020 16:13:49 +0000
Message-ID: <3855750b-ce32-cf2e-d523-40d939499b90@st.com>
References: <20200707122153.9624-1-patrick.delaunay@st.com>
 <1278d480-322f-4dd1-ec34-cf55a7e4dd61@st.com>
In-Reply-To: <1278d480-322f-4dd1-ec34-cf55a7e4dd61@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <4197D88E84D220438ADFE12585BAFEA6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_14:2020-07-28,
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

DQpPbiA3LzI4LzIwIDQ6MTAgUE0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToNCj4gT24gNy83LzIw
IDI6MjEgUE0sIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6DQo+PiBSZXBsYWNlIHRoZSBmdW5jdGlv
biBzcGxfYm9hcmRfcHJlcGFyZV9mb3JfYm9vdF9saW51eCBieSB0aGUgY29ycmVjdA0KPj4gbmFt
ZSBvZiB0aGUgd2VhayBmdW5jdGlvbiBzcGxfYm9hcmRfcHJlcGFyZV9mb3JfbGludXggZGVmaW5l
ZCBpbiBzcGwuaC4NCj4+DQo+PiBUaGlzIHBhdGNoIGF2b2lkcyB3YXJuaW5nIHdpdGggVz0xIG9w
dGlvbjoNCj4+DQo+PiB1LWJvb3QvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3NwbC5jOjE1MDo2Og0K
Pj4gd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhzcGxfYm9hcmRfcHJlcGFy
ZV9mb3JfYm9vdF9saW51eOKAmQ0KPj4gWy1XbWlzc2luZy1wcm90b3R5cGVzXQ0KPj4NCj4+IEZp
eGVzOiBkYzdlNWYxOTBkZTUgKCJhcm06IHN0bTMybXA6IGFjdGl2YXRlIGRhdGEgY2FjaGUgb24g
RERSIGluIFNQTCIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNr
LmRlbGF1bmF5QHN0LmNvbT4NCj4+IC0tLQ0KPj4NCj4+ICBhcmNoL2FybS9tYWNoLXN0bTMybXAv
c3BsLmMgfCAyICstDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zcGwuYyBi
L2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zcGwuYw0KPj4gaW5kZXggMzk0MTNlOWEwZS4uZTg0YmRh
ZDdiZiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zcGwuYw0KPj4gKysr
IGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3NwbC5jDQo+PiBAQCAtMTQ3LDcgKzE0Nyw3IEBAIHZv
aWQgc3BsX2JvYXJkX3ByZXBhcmVfZm9yX2Jvb3Qodm9pZCkNCj4+ICAJZGNhY2hlX2Rpc2FibGUo
KTsNCj4+ICB9DQo+PiAgDQo+PiAtdm9pZCBzcGxfYm9hcmRfcHJlcGFyZV9mb3JfYm9vdF9saW51
eCh2b2lkKQ0KPj4gK3ZvaWQgc3BsX2JvYXJkX3ByZXBhcmVfZm9yX2xpbnV4KHZvaWQpDQo+PiAg
ew0KPj4gIAlkY2FjaGVfZGlzYWJsZSgpOw0KPj4gIH0NCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCj4NCj4gVGhhbmtzDQo+DQo+IFBhdHJp
Y2UNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
VWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0DQo+IFVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20NCj4gaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vdWJvb3Qtc3RtMzINCkFwcGxpZWQgdG8gdS1ib290LXN0bS9tYXN0ZXINCg0K
VGhhbmtzDQoNClBhdHJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
