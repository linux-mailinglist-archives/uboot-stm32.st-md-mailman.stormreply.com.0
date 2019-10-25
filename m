Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 209D7E44C0
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Oct 2019 09:43:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD5F3C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Oct 2019 07:43:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1FBFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2019 07:43:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9P7gSd0022402; Fri, 25 Oct 2019 09:43:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=YhUF8BahX/g/DAcF6HbHXtD9pgkRjJ4e1MVyniw7cg4=;
 b=fNv4EwitprWudbZv/xOwJ+d1lcWOM+u3Yg7A/nz8mDZ03LKeKt6NJ1tRDWUDDmXwAHR5
 SSGSfZFqH0dyqF6mXWnIDcKkRqPz4CinENtKC+YhQ4Dgm/Zrb8D+CWxdrkOpULbkz96C
 stut5qunX8+ZnUxTIVF2TebZ4LalZuCL8loQeekFY++WjLSYKxEtJGZpPDB7lM8L8/fi
 l0RYHSuyO1XP06ug2qaUukrIxGaZuK2cif+gT9rdq9XXcZxUqEnYWfWS6JzAnPzBejD4
 jK7B9erwl+B4RybCfZfdST9oJD6jBH99EqPIFXxxKe5oqyGhOQiL2qlLNN6eKQP0ZzU+ Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s4e9uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 09:43:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4BEE10002A;
 Fri, 25 Oct 2019 09:43:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0FB520756A;
 Fri, 25 Oct 2019 09:43:44 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 25 Oct
 2019 09:43:43 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 25 Oct 2019 09:43:43 +0200
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
Thread-Index: AQHVfRM+YLMZAeHcQka8KSpD8K7gtqdPT0UAgBp9SoCAAG8+AIAAuF6A
Date: Fri, 25 Oct 2019 07:43:43 +0000
Message-ID: <366fbfdd-586e-5775-1040-47f55168d889@st.com>
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
x-originating-ip: [10.75.127.49]
Content-ID: <69C39B5FBE0B3441AF1B5C47DCF5127C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_05:2019-10-23,2019-10-25 signatures=0
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

SGkgSGVpbnJpY2gNCg0KT24gMTAvMjQvMTkgMTA6NDMgUE0sIEhlaW5yaWNoIFNjaHVjaGFyZHQg
d3JvdGU6DQo+IE9uIDEwLzI0LzE5IDQ6MDUgUE0sIFBhdHJpY2UgQ0hPVEFSRCB3cm90ZToNCj4+
IEhpIEhlaW5yaWNoLCBhbGwNCj4+DQo+PiBPbiAxMC83LzE5IDc6MzQgUE0sIEhlaW5yaWNoIFNj
aHVjaGFyZHQgd3JvdGU6DQo+Pj4gT24gMTAvNy8xOSAzOjI5IFBNLCBZYW5uaWNrIEZlcnRyw6kg
d3JvdGU6DQo+Pj4+IElmIHRoZSBzaXplIG9mIHRoZSBiaXRtYXAgaXMgYmlnZ2VyIHRoYW4gdGhl
IHNpemUgb2YNCj4+Pj4gdGhlIHBhbmVsIHRoZW4gZXJyb3JzIGFwcGVhciB3aGVuIGNhbGN1bGF0
aW5nIGF4aXMgYWxpZ25tZW50DQo+Pj4+IGFuZCB0aGUgY29weSBvZiBiaXRtYXAgaXMgZG9uZSBv
dXRzaWRlIG9mIGZyYW1lYnVmZmVyLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNr
IEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IMKgwqAgZHJp
dmVycy92aWRlby92aWRlb19ibXAuYyB8IDcgKysrKysrKw0KPj4+PiDCoMKgIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vdmlkZW9fYm1wLmMgYi9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jDQo+Pj4+IGluZGV4IDE5
M2YzN2QuLjRhZjFmYjQgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vdmlkZW9fYm1w
LmMNCj4+Pj4gKysrIGIvZHJpdmVycy92aWRlby92aWRlb19ibXAuYw0KPj4+PiBAQCAtMjQ5LDYg
KzI0OSwxMyBAQCBpbnQgdmlkZW9fYm1wX2Rpc3BsYXkoc3RydWN0IHVkZXZpY2UgKmRldiwgdWxv
bmcgYm1wX2ltYWdlLCBpbnQgeCwgaW50IHksDQo+Pj4+DQo+Pj4+IMKgwqDCoMKgwqDCoCBwYWRk
ZWRfd2lkdGggPSAod2lkdGggJiAweDMgPyAod2lkdGggJiB+MHgzKSArIDQgOiB3aWR0aCk7DQo+
Pj4+DQo+Pj4+ICvCoMKgwqAgLyogY2hlY2sgaWYgcGljdHVyZSBzaXplIGV4Y2VlZHMgcGFuZWwg
c2l6ZSAqLw0KPj4+PiArwqDCoMKgIGlmICgocHdpZHRoIDwgd2lkdGgpIHx8IChwcml2LT55c2l6
ZSA8IGhlaWdodCkpIHsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHByaW50ZigiRXJyb3I6IEJNUCBz
aXplICVkIHggJWQgaXMgYmlnZ2VyIHRoYW4gcGFuZWwgc2l6ZSAlZCB4ICVkXG4iLA0KPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoaW50KXdpZHRoLCAoaW50KWhlaWdodCwgcHJp
di0+eHNpemUsIHByaXYtPnlzaXplKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlO
VkFMOw0KPj4+PiArwqDCoMKgIH0NCj4+Pj4gKw0KPj4+PiDCoMKgwqDCoMKgwqAgaWYgKGFsaWdu
KSB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZpZGVvX3NwbGFzaF9hbGlnbl9heGlzKCZ4
LCBwcml2LT54c2l6ZSwgd2lkdGgpOw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2aWRlb19z
cGxhc2hfYWxpZ25fYXhpcygmeSwgcHJpdi0+eXNpemUsIGhlaWdodCk7DQo+Pj4NCj4+PiBUaGlz
IGlzIGZvbGxvd2VkIGJ5Og0KPj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoKHggKyB3aWR0
aCkgPiBwd2lkdGgpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdpZHRo
ID0gcHdpZHRoIC0geDsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoKHkgKyBoZWlnaHQpID4g
cHJpdi0+eXNpemUpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGhlaWdo
dCA9IHByaXYtPnlzaXplIC0geTsNCj4+Pg0KPj4+IFRoZXNlIGxpbmVzIHdpbGwgY2xpcCBhIGJp
dG1hcCB0aGF0IGdpdmVuIHRoZSBsZWZ0IHVwcGVyIGNvcm5lciB4LCB5DQo+Pj4gZG9lcyBub3Qg
Zml0IG9udG8gdGhlIHNjcmVlbi4NCj4+Pg0KPj4+IFNvIGlzbid0IHRoaXMgcGF0Y2ggc3VwZXJm
bHVvdXM/DQo+Pj4NCj4+PiBXaGF0IGlzIG1pc3NpbmcgYXJlIGNoZWNrcyBmb3IgeCBhbmQgeS4N
Cj4+Pg0KPj4+IEZvciB0ZXN0aW5nIEkgaGF2ZSB1c2VkIHFlbXVfeDg2IGFuZCBhZGRlZA0KPj4+
DQo+Pj4gwqDCoMKgwqAgI2RlZmluZSBDT05GSUdfQk1QXzI0QlBQIHkNCj4+Pg0KPj4+IHRvIHRo
ZSB0b3Agb2YgZHJpdmVycy92aWRlby92aWRlb19ibXAuYyBhbmQgbG9hZGVkIGEgMjRiaXQgYml0
bWFwLg0KPj4+DQo+Pj4gQ2xpcHBpbmcgd29ya3MgYXMgZXhwZWN0ZWQuIEJ1dCBwYXNzaW5nIGEg
dmFsdWUgb2YgeCBleGNlZWRpbmcgdGhlDQo+Pj4gc2NyZWVuIHdpZHRoIGxlYWQgdG8gYSBjcmFz
aC4NCj4+Pg0KPj4+IFdoYXQgSSByZWFsbHkgZGlzbGlrZSBpbiB0aGUgZXhpc3RpbmcgY29kaW5n
IGlzIHRoYXQgQ09ORklHX0JNUF8qQlBQIGlzDQo+Pj4gZGVmaW5lZCBpbiBpbmNsdWRlcyBpbnN0
ZWFkIG9mIHVzaW5nIEtjb25maWcgYnV0IHRoYXQgaXMgYSBkaWZmZXJlbnQgc3RvcnkuDQo+Pj4N
Cj4+PiBCZXN0IHJlZ2FyZHMNCj4+Pg0KPj4+IEhlaW5yaWNoDQo+Pg0KPj4gRm9yIGluZm9ybWF0
aW9uIGFsbCB0aGlzIHNlcmllcyBwYXRjaGVzIGhhdmUgYmVlbiBhcHBsaWVkIG9uIHUtYm9vdC9t
YXN0ZXIgZXhjZXB0c8KgIHRoaXMgb25lLg0KPj4NCj4+IFVuZm9ydHVuYXRlbHksIHdpdGhvdXQg
dGhpcyBwYXRjaCwgc3RtMzJmNzQ2LWRpc2NvdmVyeSBib2FyZCBkb2Vzbid0IGJvb3QgYW55bW9y
ZS4NCj4NCj4gSSBzdGlsbCBkbyBub3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBwYXRjaCBpcyBuZWVk
ZWQuDQo+DQo+IENvdWxkIHlvdSwgcGxlYXNlLCB0cnkgdG8gYW5hbHl6ZSB3aHkgdGhlIGJvYXJk
IGRvZXMgbm90IGJvb3QuDQo+DQo+IFdoYXQgaXMgd3Jvbmcgd2l0aCB0aGUgZXhpc3RpbmcgY29k
ZSBmb3IgY2xpcHBpbmc/DQo+IE9yIGlzIHRoZSBub24tYm9vdGluZyBqdXN0IGNvaW5jaWRlbmNl
IGJ1dCB0aGUgYnVnIGlzIHNvbWV3aGVyZSBlbHNlPw0KPg0KPiBXaGF0IGFyZSB0aGUgdmFsdWVz
IG9mIHRoZSBwYXJhbWV0ZXJzIHBhc3NlZCB0byB2aWRlb19ibXBfZGlzcGxheSgpPw0KPiBXaGlj
aCBiaXRtYXAgZmlsZSBhcmUgeW91IHVzaW5nPw0KPiBXaGF0IGlzIHRoZSBzaXplIG9mIHRoZSBk
aXNwbGF5Pw0KDQoNClRvIHN1bS11cCwgb24gYWxsIFNUTTMyIGJvYXJkcywgdGhlIHNhbWUgQk1Q
IHNwbGFzaGNyZWVuIGlzIHVzZWQuDQoNCkluIHRoZSBwYXJ0aWN1bGFyIGNhc2Ugb2YgU1RNMzJG
NzQ2LURpc2NvIGJvYXJkLCB0aGUgcGFuZWwgc2l6ZSBpcyBzbWFsbGVyIHRoZW4gdGhlIEJNUCBz
aXplLg0KDQpTbywgc29tZSBzaXplIGNoZWNrIG11c3QgYmUgZG9uZSB0byBhdm9pZCBvdmVyZmxv
dyB3aGVuIHdyaXRpbmcgaW5zaWRlIHRoZSBmcmFtZWJ1ZmZlci4NCg0KSWYgbmVlZGVkLCBZYW5u
aWNrLCB3aGljaCBpcyBtdWx0aW1lZGlhIGV4cGVydCwgY2FuIGdpdmUgeW91IG1vcmUgcHJlY2lz
ZSBkZXRhaWxzLg0KDQpUaGFua3MNCg0KUGF0cmljZQ0KDQoNCj4NCj4gQmVzdCByZWdhcmRzDQo+
DQo+IEhlaW5yaWNoDQo+DQo+Pg0KPj4gSGVpbnJpY2gsIGNvdWxkIHRoaXMgcGF0Y2ggYmUgbWVy
Z2VkLCB3YWl0aW5nIGZvciBhIGNsZWFuIHBhdGNoIGZyb20gWWFubmljayA/DQo+Pg0KPj4gUmVn
YXJkcw0KPj4NCj4+IFBhdHJpY2UNCj4+DQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
