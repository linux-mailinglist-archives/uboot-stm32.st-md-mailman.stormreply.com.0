Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF8BC90F
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Sep 2019 15:43:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C152C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Sep 2019 13:43:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EC17C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Sep 2019 13:43:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8ODbG16006437; Tue, 24 Sep 2019 15:43:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=bqUScY8/G+3M1v2PVj5JSgRKziTKdMcV7rFMYJdQ+Nw=;
 b=u/LXzZYUBdRQpu+ZkPxbSltnimlVmWMgLyWXH/VxqDGaZu5qP//KbDPyI9sOG7YVYmjR
 heyXyCpQyc9kB7IlsIUR2RyXgpOewkP2v1C18sIBf1fZvE9J/tANFmxBOToEOAkLMqXi
 Xh2npDPAj6A49aPHw/A1k5YSW6Xt1rirZcOtfM6IIEW/fRcQ2jlktlNdn3jTE7HrnhEv
 hqmz+6Vd74C5RDiiqXPdypL6awiGlFDRIx7Ep5jpekucGEjYE6FZsQSjBf05pKm8C1KN
 tGJvB6uKv0vfOWWynW+EeDvLCBxwr1FJC1yuOJBiFFGET/m6wZXb/SULUfnf2ubE9+Hr bA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v590ateru-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 24 Sep 2019 15:43:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C3CE04D;
 Tue, 24 Sep 2019 13:43:07 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 445FA2B85C8;
 Tue, 24 Sep 2019 15:43:07 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 24 Sep
 2019 15:43:06 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Tue, 24 Sep 2019 15:43:06 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Vikas MANOCHA
 <vikas.manocha@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "Albert Aribaud" <albert.u.boot@aribaud.net>, Patrick DELAUNAY
 <patrick.delaunay@st.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>, Philippe CORNU
 <philippe.cornu@st.com>, Jens Wiklander <jens.wiklander@linaro.org>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Simon Goldschmidt
 <simon.k.r.goldschmidt@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [PATCH v4 01/15] video: bmp: check resolutions of panel/bitmap
Thread-Index: AQHVahhjKECj6JdXPUutBnpp2aJ0N6cwQ4GAgAqCxAA=
Date: Tue, 24 Sep 2019 13:43:06 +0000
Message-ID: <5d3d7574-5637-8acc-893b-5a0bc7e58560@st.com>
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
 <1568368083-11075-2-git-send-email-yannick.fertre@st.com>
 <4f087ff2-1abc-9783-354f-6febedae556c@gmx.de>
In-Reply-To: <4f087ff2-1abc-9783-354f-6febedae556c@gmx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <9D7B574551324844B2754CBE00CBC432@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-24_06:2019-09-23,2019-09-24 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v4 01/15] video: bmp: check resolutions of
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

SGVsbG8gSGVpbnJpY2gsDQoNClRoYW5rIGZvciB5b3VyIHJldmlldy4NCg0KWW91J3JlIHJpZ2h0
IG15IHBhdGNoIGRvZXMgbm90IGFsbG93IHRvIHByb3Blcmx5IHByb3RlY3QgdGhlIGZyYW1lYnVm
ZmVyLg0KDQpJIHdpbGwgcHVzaCBhIG5ldyBwYXRjaCB3aGljaCBjaGVjayB0aGUgYml0bWFwIHNp
emUgYW5kIGV4aXQgaW4gY2FzZSBvZiANCnNpemUgZXJyb3IuDQoNCllhbm5pY2sgRmVydHLDqQ0K
DQoNCk9uIDkvMTcvMTkgMTE6MTIgUE0sIEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6DQo+IE9u
IDkvMTMvMTkgMTE6NDcgQU0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToNCj4+IElmIHRoZSBzaXpl
IG9mIHRoZSBiaXRtYXAgaXMgYmlnZ2VyIHRoYW4gdGhlIHNpemUgb2YNCj4+IHRoZSBwYW5lbCB0
aGVuIGVycm9ycyBhcHBlYXIgd2hlbiBjYWxjdWxhdGluZyBheGlzIGFsaWdubWVudA0KPj4gYW5k
IHRoZSBjb3B5IG9mIGJpdG1hcCBpcyBkb25lIG91dHNpZGUgb2YgZnJhbWVidWZmZXIuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+
DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMgfCAxNCArKysrKysrKysr
KysrKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby92aWRlb19ibXAuYyBiL2RyaXZlcnMvdmlkZW8vdmlkZW9f
Ym1wLmMNCj4+IGluZGV4IDE5M2YzN2QuLjU0NGJkNWYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL3ZpZGVvX2JtcC5jDQo+PiArKysgYi9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jDQo+
PiBAQCAtNTQsNiArNTQsMTMgQEAgc3RhdGljIHZvaWQgdmlkZW9fZGlzcGxheV9ybGU4X2JpdG1h
cChzdHJ1Y3QgDQo+PiB1ZGV2aWNlICpkZXYsDQo+PiDCoMKgwqDCoMKgIGhlaWdodCA9IGdldF91
bmFsaWduZWRfbGUzMigmYm1wLT5oZWFkZXIuaGVpZ2h0KTsNCj4+IMKgwqDCoMKgwqAgYm1hcCA9
ICh1Y2hhciAqKWJtcCArIA0KPj4gZ2V0X3VuYWxpZ25lZF9sZTMyKCZibXAtPmhlYWRlci5kYXRh
X29mZnNldCk7DQo+Pg0KPj4gK8KgwqDCoCAvKiBjaGVjayBpZiBwaWN0dXJlIHNpemUgZXhjZWVk
IHBhbmVsIHNpemUgKi8NCj4NCj4gJXMvZXhjZWVkL2V4Y2VlZHMvDQo+DQo+PiArwqDCoMKgIGlm
IChwcml2LT54c2l6ZSA8IHdpZHRoKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHdpZHRoID0gcHJpdi0+
eHNpemU7DQo+DQo+IEluIGNhc2Ugb2YgQk1QX1JMRThfREVMVEEgd2lkdGggaXMgbm90IGNoZWNr
ZWQgYmVmb3JlIHdyaXRpbmcgdG8gdGhlDQo+IGZyYW1lIGJ1ZmZlci4gU28gdGhpcyBtb2RpZmlj
YXRpb24gb2Ygd2lkdGggd2lsbCBsZWFkIHRvIHVuZXhwZWN0ZWQgDQo+IGVmZmVjdHMuDQo+DQo+
IEluIHRoZSAnZGVmYXVsdCcgY2FzZSB3aWR0aCBpcyBjaGVja2VkIGFuZCB0aGlzIG1heSBsZWFk
IHRvIGRlY29kaW5nIA0KPiBlcnJvcnMuDQo+DQo+PiArDQo+PiArwqDCoMKgIGlmIChwcml2LT55
c2l6ZSA8IGhlaWdodCkNCj4+ICvCoMKgwqDCoMKgwqDCoCBoZWlnaHQgPSBwcml2LT55c2l6ZTsN
Cj4+ICsNCj4+IMKgwqDCoMKgwqAgeCA9IDA7DQo+PiDCoMKgwqDCoMKgIHkgPSBoZWlnaHQgLSAx
Ow0KPj4NCj4+IEBAIC0yNDksNiArMjU2LDEzIEBAIGludCB2aWRlb19ibXBfZGlzcGxheShzdHJ1
Y3QgdWRldmljZSAqZGV2LCB1bG9uZyANCj4+IGJtcF9pbWFnZSwgaW50IHgsIGludCB5LA0KPj4N
Cj4+IMKgwqDCoMKgwqAgcGFkZGVkX3dpZHRoID0gKHdpZHRoICYgMHgzID8gKHdpZHRoICYgfjB4
MykgKyA0IDogd2lkdGgpOw0KPj4NCj4+ICvCoMKgwqAgLyogY2hlY2sgaWYgcGljdHVyZSBzaXpl
IGV4Y2VlZCBwYW5lbCBzaXplICovDQo+PiArwqDCoMKgIGlmIChwd2lkdGggPCB3aWR0aCkNCj4+
ICvCoMKgwqDCoMKgwqDCoCB3aWR0aCA9IHB3aWR0aDsNCj4+ICsNCj4+ICvCoMKgwqAgaWYgKHBy
aXYtPnlzaXplIDwgaGVpZ2h0KQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGhlaWdodCA9IHByaXYtPnlz
aXplOw0KPj4gKw0KPg0KPiBZb3UgZm9yZ290IHRvIGNvbnNpZGVyIHRoZSBwb3NpdGlvbiAoeCx5
KSBvZiB0aGUgcGljdHVyZS4NCj4NCj4gQmVzdCByZWdhcmRzDQo+DQo+IEhlaW5yaWNoDQo+DQo+
PiDCoMKgwqDCoMKgIGlmIChhbGlnbikgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHZpZGVvX3Nw
bGFzaF9hbGlnbl9heGlzKCZ4LCBwcml2LT54c2l6ZSwgd2lkdGgpOw0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHZpZGVvX3NwbGFzaF9hbGlnbl9heGlzKCZ5LCBwcml2LT55c2l6ZSwgaGVpZ2h0KTsN
Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==
