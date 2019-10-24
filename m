Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC00E3500
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2019 16:05:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06366C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2019 14:05:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7735C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2019 14:05:55 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9ODucuB013072; Thu, 24 Oct 2019 16:05:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=gI5qwt/ddOrzX6kVC9jDBtEGa3LcSvFuP538V+YEjWc=;
 b=KcixEjhnFFJ96dQ7TQaUAHYNL/2LitaoWg2ZPv8mJ9UjGqHZoU4OwFOlmgQALrSm+yGV
 5EsatsCsn4p/42VgRgQs5n8fgbt19/t6To7ha/TOfpbPNWIbWwwTF4Ftnh/wUh1xLKpe
 6qirO1wj7dc1eczA+QxV+Ba0FgHqPpjQYdGGS5PsTQe85Ba7zQEcmCe1V/QYduvMIeki
 F+5gM8IGENyoj+zuOSWv2P98lBhJ3k6D4ssAVAY3zLWFFQwYQLDLmQMgGhoc5EgT+uyH
 F2nIwKRUNZot3SBp48UvWvuu/otNLdiMf8ol3sYNE/T03ExCdQgXaxtY89P1FucPORdD bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s1t69u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 16:05:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 48F16100038;
 Thu, 24 Oct 2019 16:05:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31A572BE25A;
 Thu, 24 Oct 2019 16:05:42 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 24 Oct
 2019 16:05:41 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 24 Oct 2019 16:05:41 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Yannick FERTRE
 <yannick.fertre@st.com>, Vikas MANOCHA <vikas.manocha@st.com>, "Benjamin
 GAIGNARD" <benjamin.gaignard@st.com>, Albert Aribaud
 <albert.u.boot@aribaud.net>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 "Philippe CORNU" <philippe.cornu@st.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Eugen Hristev <eugen.hristev@microchip.com>, Simon Goldschmidt
 <simon.k.r.goldschmidt@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [PATCH v5 01/15] video: bmp: check resolutions of panel/bitmap
Thread-Index: AQHVfRM+YLMZAeHcQka8KSpD8K7gtqdPT0UAgBp9SoA=
Date: Thu, 24 Oct 2019 14:05:41 +0000
Message-ID: <2ef8752e-a6fd-fec3-ad94-63dcc48fdc13@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
 <1570454955-21298-2-git-send-email-yannick.fertre@st.com>
 <2d9bb18b-5775-00b6-2fdd-1b38dce1abcc@gmx.de>
In-Reply-To: <2d9bb18b-5775-00b6-2fdd-1b38dce1abcc@gmx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <7B4DF42F80C7A84FA00E26D041976FEB@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-24_08:2019-10-23,2019-10-24 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v5 01/15] video: bmp: check resolutions of
	panel/bitmap
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

SGkgSGVpbnJpY2gsIGFsbA0KDQpPbiAxMC83LzE5IDc6MzQgUE0sIEhlaW5yaWNoIFNjaHVjaGFy
ZHQgd3JvdGU6DQo+IE9uIDEwLzcvMTkgMzoyOSBQTSwgWWFubmljayBGZXJ0csOpIHdyb3RlOg0K
Pj4gSWYgdGhlIHNpemUgb2YgdGhlIGJpdG1hcCBpcyBiaWdnZXIgdGhhbiB0aGUgc2l6ZSBvZg0K
Pj4gdGhlIHBhbmVsIHRoZW4gZXJyb3JzIGFwcGVhciB3aGVuIGNhbGN1bGF0aW5nIGF4aXMgYWxp
Z25tZW50DQo+PiBhbmQgdGhlIGNvcHkgb2YgYml0bWFwIGlzIGRvbmUgb3V0c2lkZSBvZiBmcmFt
ZWJ1ZmZlci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2su
ZmVydHJlQHN0LmNvbT4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy92aWRlby92aWRlb19ibXAuYyB8
IDcgKysrKysrKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIGIvZHJpdmVycy92aWRlby92
aWRlb19ibXAuYw0KPj4gaW5kZXggMTkzZjM3ZC4uNGFmMWZiNCAxMDA2NDQNCj4+IC0tLSBhL2Ry
aXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMNCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vdmlkZW9fYm1w
LmMNCj4+IEBAIC0yNDksNiArMjQ5LDEzIEBAIGludCB2aWRlb19ibXBfZGlzcGxheShzdHJ1Y3Qg
dWRldmljZSAqZGV2LCB1bG9uZyBibXBfaW1hZ2UsIGludCB4LCBpbnQgeSwNCj4+DQo+PiDCoMKg
wqDCoMKgIHBhZGRlZF93aWR0aCA9ICh3aWR0aCAmIDB4MyA/ICh3aWR0aCAmIH4weDMpICsgNCA6
IHdpZHRoKTsNCj4+DQo+PiArwqDCoMKgIC8qIGNoZWNrIGlmIHBpY3R1cmUgc2l6ZSBleGNlZWRz
IHBhbmVsIHNpemUgKi8NCj4+ICvCoMKgwqAgaWYgKChwd2lkdGggPCB3aWR0aCkgfHwgKHByaXYt
PnlzaXplIDwgaGVpZ2h0KSkgew0KPj4gK8KgwqDCoMKgwqDCoMKgIHByaW50ZigiRXJyb3I6IEJN
UCBzaXplICVkIHggJWQgaXMgYmlnZ2VyIHRoYW4gcGFuZWwgc2l6ZSAlZCB4ICVkXG4iLA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGludCl3aWR0aCwgKGludCloZWlnaHQsIHBy
aXYtPnhzaXplLCBwcml2LT55c2l6ZSk7DQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5W
QUw7DQo+PiArwqDCoMKgIH0NCj4+ICsNCj4+IMKgwqDCoMKgwqAgaWYgKGFsaWduKSB7DQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgdmlkZW9fc3BsYXNoX2FsaWduX2F4aXMoJngsIHByaXYtPnhzaXpl
LCB3aWR0aCk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdmlkZW9fc3BsYXNoX2FsaWduX2F4aXMo
JnksIHByaXYtPnlzaXplLCBoZWlnaHQpOw0KPg0KPiBUaGlzIGlzIGZvbGxvd2VkIGJ5Og0KPg0K
PiDCoMKgwqDCoMKgwqDCoCBpZiAoKHggKyB3aWR0aCkgPiBwd2lkdGgpDQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgd2lkdGggPSBwd2lkdGggLSB4Ow0KPiDCoMKgwqDCoMKgwqDC
oMKgaWYgKCh5ICsgaGVpZ2h0KSA+IHByaXYtPnlzaXplKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGhlaWdodCA9IHByaXYtPnlzaXplIC0geTsNCj4NCj4gVGhlc2UgbGluZXMg
d2lsbCBjbGlwIGEgYml0bWFwIHRoYXQgZ2l2ZW4gdGhlIGxlZnQgdXBwZXIgY29ybmVyIHgsIHkN
Cj4gZG9lcyBub3QgZml0IG9udG8gdGhlIHNjcmVlbi4NCj4NCj4gU28gaXNuJ3QgdGhpcyBwYXRj
aCBzdXBlcmZsdW91cz8NCj4NCj4gV2hhdCBpcyBtaXNzaW5nIGFyZSBjaGVja3MgZm9yIHggYW5k
IHkuDQo+DQo+IEZvciB0ZXN0aW5nIEkgaGF2ZSB1c2VkIHFlbXVfeDg2IGFuZCBhZGRlZA0KPg0K
PiDCoMKgwqAgI2RlZmluZSBDT05GSUdfQk1QXzI0QlBQIHkNCj4NCj4gdG8gdGhlIHRvcCBvZiBk
cml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIGFuZCBsb2FkZWQgYSAyNGJpdCBiaXRtYXAuDQo+DQo+
IENsaXBwaW5nIHdvcmtzIGFzIGV4cGVjdGVkLiBCdXQgcGFzc2luZyBhIHZhbHVlIG9mIHggZXhj
ZWVkaW5nIHRoZQ0KPiBzY3JlZW4gd2lkdGggbGVhZCB0byBhIGNyYXNoLg0KPg0KPiBXaGF0IEkg
cmVhbGx5IGRpc2xpa2UgaW4gdGhlIGV4aXN0aW5nIGNvZGluZyBpcyB0aGF0IENPTkZJR19CTVBf
KkJQUCBpcw0KPiBkZWZpbmVkIGluIGluY2x1ZGVzIGluc3RlYWQgb2YgdXNpbmcgS2NvbmZpZyBi
dXQgdGhhdCBpcyBhIGRpZmZlcmVudCBzdG9yeS4NCj4NCj4gQmVzdCByZWdhcmRzDQo+DQo+IEhl
aW5yaWNoDQoNCkZvciBpbmZvcm1hdGlvbiBhbGwgdGhpcyBzZXJpZXMgcGF0Y2hlcyBoYXZlIGJl
ZW4gYXBwbGllZCBvbiB1LWJvb3QvbWFzdGVyIGV4Y2VwdHPCoCB0aGlzIG9uZS4NCg0KVW5mb3J0
dW5hdGVseSwgd2l0aG91dCB0aGlzIHBhdGNoLCBzdG0zMmY3NDYtZGlzY292ZXJ5IGJvYXJkIGRv
ZXNuJ3QgYm9vdCBhbnltb3JlLg0KDQpIZWlucmljaCwgY291bGQgdGhpcyBwYXRjaCBiZSBtZXJn
ZWQsIHdhaXRpbmcgZm9yIGEgY2xlYW4gcGF0Y2ggZnJvbSBZYW5uaWNrID8NCg0KUmVnYXJkcw0K
DQpQYXRyaWNlDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
