Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A271907AB
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 09:34:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE37DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Mar 2020 08:34:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E3C5C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 08:34:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02O8SAdS004240; Tue, 24 Mar 2020 09:34:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dr8wAklh/m/5cUvuZpUx3sHP+exi79tcuuAlN8T7EHo=;
 b=TnR+hW1MjjGEQMBNDJsDv/uWtX9A7Kvgalawz08NsQBweFsM04IO6oXIV6snyFh7E/MB
 /fnJboVLXkBB1PoKC6ylXBfPAw6xKcC83QQ27v3Ewa40qkfnJ/1tbLlN5vR42FKxOVBR
 KzytLsWLfSBCvESUNabYAip2Uw3TkY23GhmHhZYrlRCeE4fZ3n64i1rV8JakzfLVRqbm
 sophkJ63Wqp6kF4meOOULKSpp9/QS6IcZdJYJ+GzREH0UJ25ju9OO7XyX4/hur0XQ+s8
 W6RsSJN3xWGsej7cqYiQAXaca3bj39bHVCZ9XfyL1jppmxKdcaVp2ZUAzXKzLgkxmUru 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw8xdxf4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 09:34:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8862210002A;
 Tue, 24 Mar 2020 09:34:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 779D321F68A;
 Tue, 24 Mar 2020 09:34:00 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Mar
 2020 09:34:00 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 24 Mar 2020 09:34:00 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 03/10] arm: stm32mp: bsec: remove unneeded test
Thread-Index: AQHV4dOG1DscO3p100+aAnq6fAKkeahXqisg
Date: Tue, 24 Mar 2020 08:34:00 +0000
Message-ID: <c7ef679509a448bc83c4c63214a9a774@SFHDAG6NODE3.st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-4-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_02:2020-03-23,
 2020-03-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>
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

SGksDQoNCj4gRnJvbTogUGF0cmljayBERUxBVU5BWSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+
DQo+IFNlbnQ6IG1lcmNyZWRpIDEyIGbDqXZyaWVyIDIwMjAgMTk6MzgNCj4gDQo+IFJlbW92ZSB0
aGUgdGVzdCBvZmZzIDwgMCAsIGFzIG9mZnMgaXMgdW5zaWduZWQuDQo+IA0KPiBUaGlzIHBhdGNo
IHNvbHZlcyB0aGUgd2FybmluZ3Mgd2hlbiBjb21waWxpbmcgd2l0aCBXPTEgb24gc3RtMzJtcDEg
Ym9hcmQ6DQo+IA0KPiBJbiBmdW5jdGlvbiDigJhzdG0zMm1wX2JzZWNfcmVhZOKAmToNCj4gYXJj
aC9hcm0vbWFjaC1zdG0zMm1wL2JzZWMuYzozNjg6MTE6IHdhcm5pbmc6DQo+IGNvbXBhcmlzb24g
b2YgdW5zaWduZWQgZXhwcmVzc2lvbiA8IDAgaXMgYWx3YXlzIGZhbHNlIFstV3R5cGUtbGltaXRz
XQ0KPiAgIDM2OCB8ICBpZiAob2ZmcyA8IDAgfHwgKG9mZnMgJSA0KSB8fCAoc2l6ZSAlIDQpKQ0K
PiAgICAgICB8ICAgICAgICAgICBeDQo+IEluIGZ1bmN0aW9uIOKAmHN0bTMybXBfYnNlY193cml0
ZeKAmToNCj4gYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2JzZWMuYzo0MDU6MTE6IHdhcm5pbmc6DQo+
IGNvbXBhcmlzb24gb2YgdW5zaWduZWQgZXhwcmVzc2lvbiA8IDAgaXMgYWx3YXlzIGZhbHNlIFst
V3R5cGUtbGltaXRzXQ0KPiAgIDQwNSB8ICBpZiAob2ZmcyA8IDAgfHwgKG9mZnMgJSA0KSB8fCAo
c2l6ZSAlIDQpKQ0KPiAgICAgICB8ICAgICAgICAgICBeDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gLS0tDQoNCkFwcGxp
ZWQgdG8gdS1ib290LXN0bS9uZXh0LCB0aGFua3MhDQoNClJlZ2FyZHMNCg0KUGF0cmljaw0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIg
bWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qt
c3RtMzIK
