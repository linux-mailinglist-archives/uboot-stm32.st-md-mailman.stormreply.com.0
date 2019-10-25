Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD36BE44F3
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Oct 2019 09:56:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83E0CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Oct 2019 07:56:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3A39C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2019 07:55:59 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9P7pjs0009329; Fri, 25 Oct 2019 09:55:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=1BcZhkBOR2EcRnvSLpI+BCiGPn7ugE3SwmIUHoN5/bg=;
 b=0i6b+RMoRmr7xmyes4NZay//WGLvf7kVzMI9L3Zj1eXFxdxw1cb7kT0srrwnYuvGQDly
 IZB4fGzn6Kf6c00q3LFIGtki7JGhO0Ev0300XsCBjJ/qqwx6d6bgJCK2Hq/xKVhKcCLw
 Yijju1AgY4/xI+zEKk6n6qlClBSxxs3n5EdY6gaBSpTYoEePSPDoqlU3Q8Pqkgyqi/6g
 nEtNP648HrS+v/8EGMsRkm1+jV35S/nqe7j8PZD0R7F+7MR2LQCz/NKi/jc7ReFS+Nvc
 8h4GXXzo8tahFr/ARm200RoSMVrvoZDe6tImDvSJQ46UNzKYIBaSimA+/I4PX6Bhbd76 WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s1xbdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 09:55:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0EDE10002A;
 Fri, 25 Oct 2019 09:55:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E01542B97DF;
 Fri, 25 Oct 2019 09:55:49 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 25 Oct
 2019 09:55:49 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Fri, 25 Oct 2019 09:55:49 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Patrice CHOTARD
 <patrice.chotard@st.com>, Vikas MANOCHA <vikas.manocha@st.com>, "Benjamin
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
Thread-Index: AQHVfRM+5cVZYgVagU+3qLsRlvcFOqdPT0UAgBp9SoCAAG8+AIAAu8CA
Date: Fri, 25 Oct 2019 07:55:49 +0000
Message-ID: <a18b7bc0-6ae5-af1e-c95a-d0fe4291e857@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
 <1570454955-21298-2-git-send-email-yannick.fertre@st.com>
 <2d9bb18b-5775-00b6-2fdd-1b38dce1abcc@gmx.de>
 <2ef8752e-a6fd-fec3-ad94-63dcc48fdc13@st.com>
 <721d8c58-9ba4-6b86-133e-f0a1d4c3de94@gmx.de>
In-Reply-To: <721d8c58-9ba4-6b86-133e-f0a1d4c3de94@gmx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <83C0B11C35046945A050C81AAB91FEDB@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_04:2019-10-23,2019-10-25 signatures=0
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

SGVsbG8gSGVpbnJpY2gsDQoNClNvcnJ5IGZvciB0aGUgZGVsYXkuDQoNClRoaXMgbWF0Y2ggaXMg
bm90IHN1cGVyZmx1b3VzLiBPbiB0aGUgU1RNMzJGNzQ2IGJvYXJkLCBhIGJpdG1hcCBsYXJnZXIg
DQp0aGFuIHRoZSBwYW5lbCByZXNvbHV0aW9uIGlzIGVtYmVkZGVkLg0KDQpXaXRob3V0IHRoaXMg
cGF0Y2gsIHRoZSBib2FyZCBkb2VzIG5vdCBib290Lg0KDQpJIHByb3Bvc2UgdG8gc2VuZCBhbiBh
ZGRpdGlvbmFsIHBhdGNoIHRoYXQgY2hlY2tzIHRoZSBjb29yZGluYXRlcy4NCg0KQmVzdCByZWdh
cmRzDQoNCi0tIA0KWWFubmljayBGZXJ0csOpIE1pY3JvY29udHJvbGxlcnMgYW5kIERpZ2l0YWwg
SUNzIEdyb3VwIHwgDQpNaWNyb2NvbnRyb2xsZXVycyBEaXZpc2lvbg0KDQoNCk9uIDEwLzI0LzE5
IDEwOjQzIFBNLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOg0KPiBPbiAxMC8yNC8xOSA0OjA1
IFBNLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6DQo+PiBIaSBIZWlucmljaCwgYWxsDQo+Pg0KPj4g
T24gMTAvNy8xOSA3OjM0IFBNLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOg0KPj4+IE9uIDEw
LzcvMTkgMzoyOSBQTSwgWWFubmljayBGZXJ0csOpIHdyb3RlOg0KPj4+PiBJZiB0aGUgc2l6ZSBv
ZiB0aGUgYml0bWFwIGlzIGJpZ2dlciB0aGFuIHRoZSBzaXplIG9mDQo+Pj4+IHRoZSBwYW5lbCB0
aGVuIGVycm9ycyBhcHBlYXIgd2hlbiBjYWxjdWxhdGluZyBheGlzIGFsaWdubWVudA0KPj4+PiBh
bmQgdGhlIGNvcHkgb2YgYml0bWFwIGlzIGRvbmUgb3V0c2lkZSBvZiBmcmFtZWJ1ZmZlci4NCj4+
Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBz
dC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiDCoMKgIGRyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMgfCA3
ICsrKysrKysNCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+Pj4+
DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIGIvZHJpdmVycy92
aWRlby92aWRlb19ibXAuYw0KPj4+PiBpbmRleCAxOTNmMzdkLi40YWYxZmI0IDEwMDY0NA0KPj4+
PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvdmlk
ZW8vdmlkZW9fYm1wLmMNCj4+Pj4gQEAgLTI0OSw2ICsyNDksMTMgQEAgaW50IHZpZGVvX2JtcF9k
aXNwbGF5KHN0cnVjdCB1ZGV2aWNlICpkZXYsIA0KPj4+PiB1bG9uZyBibXBfaW1hZ2UsIGludCB4
LCBpbnQgeSwNCj4+Pj4NCj4+Pj4gwqDCoMKgwqDCoMKgIHBhZGRlZF93aWR0aCA9ICh3aWR0aCAm
IDB4MyA/ICh3aWR0aCAmIH4weDMpICsgNCA6IHdpZHRoKTsNCj4+Pj4NCj4+Pj4gK8KgwqDCoCAv
KiBjaGVjayBpZiBwaWN0dXJlIHNpemUgZXhjZWVkcyBwYW5lbCBzaXplICovDQo+Pj4+ICvCoMKg
wqAgaWYgKChwd2lkdGggPCB3aWR0aCkgfHwgKHByaXYtPnlzaXplIDwgaGVpZ2h0KSkgew0KPj4+
PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJFcnJvcjogQk1QIHNpemUgJWQgeCAlZCBpcyBiaWdn
ZXIgdGhhbiBwYW5lbCBzaXplIA0KPj4+PiAlZCB4ICVkXG4iLA0KPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAoaW50KXdpZHRoLCAoaW50KWhlaWdodCwgcHJpdi0+eHNpemUsIHBy
aXYtPnlzaXplKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4+PiAr
wqDCoMKgIH0NCj4+Pj4gKw0KPj4+PiDCoMKgwqDCoMKgwqAgaWYgKGFsaWduKSB7DQo+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHZpZGVvX3NwbGFzaF9hbGlnbl9heGlzKCZ4LCBwcml2LT54c2l6
ZSwgd2lkdGgpOw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2aWRlb19zcGxhc2hfYWxpZ25f
YXhpcygmeSwgcHJpdi0+eXNpemUsIGhlaWdodCk7DQo+Pj4NCj4+PiBUaGlzIGlzIGZvbGxvd2Vk
IGJ5Og0KPj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoKHggKyB3aWR0aCkgPiBwd2lkdGgp
DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdpZHRoID0gcHdpZHRoIC0g
eDsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoKHkgKyBoZWlnaHQpID4gcHJpdi0+eXNpemUp
DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGhlaWdodCA9IHByaXYtPnlz
aXplIC0geTsNCj4+Pg0KPj4+IFRoZXNlIGxpbmVzIHdpbGwgY2xpcCBhIGJpdG1hcCB0aGF0IGdp
dmVuIHRoZSBsZWZ0IHVwcGVyIGNvcm5lciB4LCB5DQo+Pj4gZG9lcyBub3QgZml0IG9udG8gdGhl
IHNjcmVlbi4NCj4+Pg0KPj4+IFNvIGlzbid0IHRoaXMgcGF0Y2ggc3VwZXJmbHVvdXM/DQo+Pj4N
Cj4+PiBXaGF0IGlzIG1pc3NpbmcgYXJlIGNoZWNrcyBmb3IgeCBhbmQgeS4NCj4+Pg0KPj4+IEZv
ciB0ZXN0aW5nIEkgaGF2ZSB1c2VkIHFlbXVfeDg2IGFuZCBhZGRlZA0KPj4+DQo+Pj4gwqDCoMKg
wqAgI2RlZmluZSBDT05GSUdfQk1QXzI0QlBQIHkNCj4+Pg0KPj4+IHRvIHRoZSB0b3Agb2YgZHJp
dmVycy92aWRlby92aWRlb19ibXAuYyBhbmQgbG9hZGVkIGEgMjRiaXQgYml0bWFwLg0KPj4+DQo+
Pj4gQ2xpcHBpbmcgd29ya3MgYXMgZXhwZWN0ZWQuIEJ1dCBwYXNzaW5nIGEgdmFsdWUgb2YgeCBl
eGNlZWRpbmcgdGhlDQo+Pj4gc2NyZWVuIHdpZHRoIGxlYWQgdG8gYSBjcmFzaC4NCj4+Pg0KPj4+
IFdoYXQgSSByZWFsbHkgZGlzbGlrZSBpbiB0aGUgZXhpc3RpbmcgY29kaW5nIGlzIHRoYXQgQ09O
RklHX0JNUF8qQlBQIGlzDQo+Pj4gZGVmaW5lZCBpbiBpbmNsdWRlcyBpbnN0ZWFkIG9mIHVzaW5n
IEtjb25maWcgYnV0IHRoYXQgaXMgYSBkaWZmZXJlbnQgDQo+Pj4gc3RvcnkuDQo+Pj4NCj4+PiBC
ZXN0IHJlZ2FyZHMNCj4+Pg0KPj4+IEhlaW5yaWNoDQo+Pg0KPj4gRm9yIGluZm9ybWF0aW9uIGFs
bCB0aGlzIHNlcmllcyBwYXRjaGVzIGhhdmUgYmVlbiBhcHBsaWVkIG9uIA0KPj4gdS1ib290L21h
c3RlciBleGNlcHRzwqAgdGhpcyBvbmUuDQo+Pg0KPj4gVW5mb3J0dW5hdGVseSwgd2l0aG91dCB0
aGlzIHBhdGNoLCBzdG0zMmY3NDYtZGlzY292ZXJ5IGJvYXJkIGRvZXNuJ3QgDQo+PiBib290IGFu
eW1vcmUuDQo+DQo+IEkgc3RpbGwgZG8gbm90IHVuZGVyc3RhbmQgd2h5IHRoaXMgcGF0Y2ggaXMg
bmVlZGVkLg0KPg0KPiBDb3VsZCB5b3UsIHBsZWFzZSwgdHJ5IHRvIGFuYWx5emUgd2h5IHRoZSBi
b2FyZCBkb2VzIG5vdCBib290Lg0KPg0KPiBXaGF0IGlzIHdyb25nIHdpdGggdGhlIGV4aXN0aW5n
IGNvZGUgZm9yIGNsaXBwaW5nPw0KPiBPciBpcyB0aGUgbm9uLWJvb3RpbmcganVzdCBjb2luY2lk
ZW5jZSBidXQgdGhlIGJ1ZyBpcyBzb21ld2hlcmUgZWxzZT8NCj4NCj4gV2hhdCBhcmUgdGhlIHZh
bHVlcyBvZiB0aGUgcGFyYW1ldGVycyBwYXNzZWQgdG8gdmlkZW9fYm1wX2Rpc3BsYXkoKT8NCj4g
V2hpY2ggYml0bWFwIGZpbGUgYXJlIHlvdSB1c2luZz8NCj4gV2hhdCBpcyB0aGUgc2l6ZSBvZiB0
aGUgZGlzcGxheT8NCj4NCj4gQmVzdCByZWdhcmRzDQo+DQo+IEhlaW5yaWNoDQo+DQo+Pg0KPj4g
SGVpbnJpY2gsIGNvdWxkIHRoaXMgcGF0Y2ggYmUgbWVyZ2VkLCB3YWl0aW5nIGZvciBhIGNsZWFu
IHBhdGNoIGZyb20gDQo+PiBZYW5uaWNrID8NCj4+DQo+PiBSZWdhcmRzDQo+Pg0KPj4gUGF0cmlj
ZQ0KPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJv
b3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vdWJvb3Qtc3RtMzIK
