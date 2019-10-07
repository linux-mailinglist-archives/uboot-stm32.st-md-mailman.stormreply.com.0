Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB391CE7AF
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 17:35:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 769BEC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 15:35:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB78DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 15:35:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97FQoHZ023881; Mon, 7 Oct 2019 17:35:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=4sYIW9KL9bHWLmjUaki5406kc7ZpI7IiM98F977zFjg=;
 b=dbuRLj0pnRtyYvy/p8ghUz1Wek5mMYOglkMk7JTQLFFDoQu0r1e1RqAinmZjUI/Tfr/H
 7SfV81fqBYfORHNCYqmR8u0iXH0p2uv3/sYHmOOJINd2n6HMpgwHUExV3ptsbnwPQUGI
 KCU7O5xX5hijNEyQzkH5HdqrYNUlt/okerzRG8Lc49uvl9Bk8OIhSloO94OVNIU9yUcL
 FGpxN/FSV+FiMdDcfNn4jI+KzLUvsOLuCEKbzpx5QHpy31jnv8/XkJKu+s9Ye1pkX9PT
 EhF+abEGOA7y2mKM/VLJrVas/Y7iD56gpvHgFKB/wWWkmo1UipL55UkL8OrIwCIHRz+k qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vegagugjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 17:35:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 585BC100034;
 Mon,  7 Oct 2019 17:35:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 46A5A2C7668;
 Mon,  7 Oct 2019 17:35:22 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Oct
 2019 17:35:21 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 7 Oct 2019 17:35:21 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Vikas MANOCHA
 <vikas.manocha@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "Albert Aribaud" <albert.u.boot@aribaud.net>, Patrick DELAUNAY
 <patrick.delaunay@st.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Philippe CORNU <philippe.cornu@st.com>, Jens Wiklander
 <jens.wiklander@linaro.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Goldschmidt
 <simon.k.r.goldschmidt@gmail.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [PATCH v5 00/15] splash screen on the stm32f769 & stm32mp1 boards
Thread-Index: AQHVfRM9ulegZ2SoX0C96KYgvetV5adPLfqA
Date: Mon, 7 Oct 2019 15:35:21 +0000
Message-ID: <b20e2de6-e980-409a-b670-57136ef716f2@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <313E66E97EEB15489155FC753F8EB203@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_03:2019-10-07,2019-10-07 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v5 00/15] splash screen on the stm32f769 &
	stm32mp1 boards
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

T2sgcG91ciBtb2kNCg0KT24gMTAvNy8xOSAzOjI5IFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6
DQo+IFZlcnNpb24gMToNCj4gLSBJbml0aWFsIGNvbW1pdC4NCj4NCj4gVmVyc2lvbiAyOg0KPiAt
IHN3YXAgcGF0Y2hlcyB0byBhdm9pZCBjb21waWxhdGlvbiBpc3N1ZS4NCj4gLSByZW1vdmUgcGFu
ZWwgdGltaW5ncyBmcm9tIGRldmljZSB0cmVlLg0KPg0KPiBWZXJzaW9uIDM6DQo+IC0gU2hhcmUg
c2FtZSBpbmNsdWRlIGZpbGUgbWlwaV9kaXNwbGF5Lmggd2l0aCBrZXJuZWwgbGludXguDQo+IC0g
UmV3b3JrIGx0ZGMgZHJpdmVyIHdpdGggbGFzdCBjb21tZW50cyBvZiBBbmF0b2xpaiBHdXN0c2hp
bi4NCj4gLSBDaGVjayBvcmRlcmluZyAoZmlsZSBkd19taXBpX2RzaS5jKS4NCj4gLSBSZW5hbWUg
bWlwaV9kaXNwbGF5LmMgdG8gbWlwaV9kc2kuYy4NCj4NCj4gVmVyc2lvbiA0Og0KPiAtIEFkZCBw
aHlzaWNhbCBzZXQgbW9kZSBvcGVyYXRpb24NCj4gLSBJbXByb3ZlIGRlYnVnIHRyYWNlIChkaXNw
bGF5IGNvbnRyb2xsZXIgbHRkYykNCj4gLSBSZWZyZXNoIHRpbWluZ3Mgb2YgcGFuZWxzDQo+IC0g
QWRkIHJlZ3VsYXRvciAoZHNpIGNvbnRyb2xsZXIpDQo+IC0gQWRkIG5ldyBjbGFzcyBEU0lfSE9T
VA0KPiAtIFN1cHBvcnQgb2YgcGFuZWxzIE9UTTgwMEEgJiBSTTY4MjAwDQo+DQo+IFZlcnNpb24g
NToNCj4gLSBSZXdvcmsgZHNpIGhvc3QgcGF0Y2ggd2l0aCBsYXN0IGNvbW1lbnRzIG9mIFNpbW9u
IEdsYXNzLg0KPg0KPiBUaGlzIHNlcmllIGNvbnRhaW5zIGFsbCBwYXRjaHNldHMgbmVlZGVkIGZv
ciBkaXNwbGF5aW5nIGEgc3BsYXNoIHNjcmVlbg0KPiBvbiB0aGUgc3RtMzJmNzY5ICYgc3RtMzJt
cDEgYm9hcmRzLg0KPiBBIG5ldyBjb25maWcgaGFzIGJlZW4gY3JlYXRlZCBjb25maWdzL3N0bTMy
Zjc2OS1kaXNjb19kZWZjb25maWcuDQo+IFRoaXMgaXMgbmVjZXNzYXJ5IGR1ZSB0byB0aGUgZGlm
ZmVyZW5jZSBvZiBwYW5lbHMgYmV0d2VlbiBzdG0zMmY3NjktZGlzY28sDQo+IHN0bTMyZjc0Ni1k
aXNjbyBib2FyZHMgJiBzdG0zMm1wMSBib2FyZHMuDQo+IEEgbmV3IGNsYXNzIERTSV9IT1NUIGhh
dmUgYmVlbiBjcmVhdGVkIHRvIG1hbmFnZSBhIGRzaSBob3N0IGJldHdlZW4gdGhlDQo+IGRzaSBj
b250cm9sbGVyICYgZGlzcGxheSBjb250cm9sbGVyLg0KPg0KPiBZYW5uaWNrIEZlcnRyw6kgKDE1
KToNCj4gICB2aWRlbzogYm1wOiBjaGVjayByZXNvbHV0aW9ucyBvZiBwYW5lbC9iaXRtYXANCj4g
ICB2aWRlbzogc3RtMzI6IHN0bTMyX2x0ZGM6IGFkZCBicmlkZ2UgdG8gZGlzcGxheSBjb250cm9s
bGVyDQo+ICAgaW5jbHVkZTogQWRkIG5ldyBEQ1MgY29tbWFuZHMgaW4gdGhlIGVudW0gbGlzdA0K
PiAgIHZpZGVvOiBhZGQgc3VwcG9ydCBvZiBNSVBJIERTSSBpbnRlcmZhY2UNCj4gICBkbTogQWRk
IGEgZHNpIGhvc3QgdWNsYXNzDQo+ICAgdmlkZW86IGFkZCBNSVBJIERTSSBob3N0IGNvbnRyb2xs
ZXIgYnJpZGdlDQo+ICAgdmlkZW86IGFkZCBzdXBwb3J0IG9mIFNUTTMyIE1JUEkgRFNJIGNvbnRy
b2xsZXIgZHJpdmVyDQo+ICAgdmlkZW86IGFkZCBzdXBwb3J0IG9mIHBhbmVsIE9UTTgwMDlBDQo+
ICAgdmlkZW86IGFkZCBzdXBwb3J0IG9mIHBhbmVsIFJNNjgyMDANCj4gICBib2FyZDogQWRkIFNU
TTMyRjc2OSBTb0MsIGRpc2NvdmVyeSBib2FyZCBzdXBwb3J0DQo+ICAgQVJNOiBkdHM6IHN0bTMy
Zjc2OTogYWRkIGRpc3BsYXkgZm9yIFNUTTMyRjc2OSBkaXNjbyBib2FyZA0KPiAgIEFSTTogZHRz
OiBzdG0zMm1wMTogYWRkIGRzaSBob3N0IGZvciBzdG0zMm1wMTU3Yy1ldjEgYm9hcmQNCj4gICBB
Uk06IGR0czogc3RtMzJtcDE6IGFkZCBkc2kgaG9zdCBmb3Igc3RtMzJtcDE1N2MtZGsyIGJvYXJk
DQo+ICAgc3RtMzJtcDE6IGNvbmZpZ3M6IHVwZGF0ZSB2aWRlbw0KPiAgIHN0bTMybXAxOiBjb25m
aWdzOiBhZGQgZGlzcGxheSBkZXZpY2VzDQo+DQo+ICBhcmNoL2FybS9kdHMvc3RtMzJmNzY5LWRp
c2NvLXUtYm9vdC5kdHNpIHwgIDYyICsrKw0KPiAgYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdjLWRr
Mi11LWJvb3QuZHRzaSB8ICAgNyArDQo+ICBhcmNoL2FybS9kdHMvc3RtMzJtcDE1N2MtZXYxLXUt
Ym9vdC5kdHNpIHwgICA1ICsNCj4gIGFyY2gvc2FuZGJveC9kdHMvc2FuZGJveC5kdHMgICAgICAg
ICAgICAgfCAgIDYgKy0NCj4gIGNvbmZpZ3Mvc2FuZGJveF9kZWZjb25maWcgICAgICAgICAgICAg
ICAgfCAgIDEgKw0KPiAgY29uZmlncy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmlnICAgICAgICB8
ICA2MyArKysNCj4gIGNvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZyAgICAgICAgfCAg
IDYgKw0KPiAgY29uZmlncy9zdG0zMm1wMTVfb3B0ZWVfZGVmY29uZmlnICAgICAgICB8ICAgNiAr
DQo+ICBjb25maWdzL3N0bTMybXAxNV90cnVzdGVkX2RlZmNvbmZpZyAgICAgIHwgICA2ICsNCj4g
IGRyaXZlcnMvdmlkZW8vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgNDcgKysNCj4gIGRy
aXZlcnMvdmlkZW8vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDYgKw0KPiAgZHJpdmVy
cy92aWRlby9kc2ktaG9zdC11Y2xhc3MuYyAgICAgICAgICB8ICAzOSArKw0KPiAgZHJpdmVycy92
aWRlby9kd19taXBpX2RzaS5jICAgICAgICAgICAgICB8IDgzOCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ICBkcml2ZXJzL3ZpZGVvL21pcGlfZHNpLmMgICAgICAgICAgICAgICAg
IHwgODI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy92aWRlby9v
cmlzZXRlY2hfb3RtODAwOWEuYyAgICAgICB8IDM3OSArKysrKysrKysrKysrKw0KPiAgZHJpdmVy
cy92aWRlby9yYXlkaXVtLXJtNjgyMDAuYyAgICAgICAgICB8IDM1MSArKysrKysrKysrKysrDQo+
ICBkcml2ZXJzL3ZpZGVvL3NhbmRib3hfZHNpX2hvc3QuYyAgICAgICAgIHwgIDkwICsrKysNCj4g
IGRyaXZlcnMvdmlkZW8vc3RtMzIvS2NvbmZpZyAgICAgICAgICAgICAgfCAgIDkgKw0KPiAgZHJp
dmVycy92aWRlby9zdG0zMi9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJz
L3ZpZGVvL3N0bTMyL3N0bTMyX2RzaS5jICAgICAgICAgIHwgNDkwICsrKysrKysrKysrKysrKysr
Kw0KPiAgZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9sdGRjLmMgICAgICAgICB8IDE0MyArKyst
LS0NCj4gIGRyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMgICAgICAgICAgICAgICAgfCAgIDcgKw0K
PiAgaW5jbHVkZS9jb25maWdzL3N0bTMybXAxLmggICAgICAgICAgICAgICB8ICAgNyArDQo+ICBp
bmNsdWRlL2RtL3VjbGFzcy1pZC5oICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gIGluY2x1
ZGUvZHNpX2hvc3QuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgNzMgKysrDQo+ICBpbmNsdWRl
L21pcGlfZGlzcGxheS5oICAgICAgICAgICAgICAgICAgIHwgICA4ICsNCj4gIGluY2x1ZGUvbWlw
aV9kc2kuaCAgICAgICAgICAgICAgICAgICAgICAgfCA0NjYgKysrKysrKysrKysrKysrKysNCj4g
IHRlc3QvZG0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgdGVz
dC9kbS9kc2lfaG9zdC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA1OCArKysNCj4gIDI5IGZp
bGVzIGNoYW5nZWQsIDM5NDMgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pDQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgY29uZmlncy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmlnDQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9kc2ktaG9zdC11Y2xhc3MuYw0KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vZHdfbWlwaV9kc2kuYw0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvdmlkZW8vbWlwaV9kc2kuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvdmlkZW8vb3Jpc2V0ZWNoX290bTgwMDlhLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3ZpZGVvL3JheWRpdW0tcm02ODIwMC5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy92aWRlby9zYW5kYm94X2RzaV9ob3N0LmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2RzaS5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9kc2lfaG9zdC5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9taXBpX2RzaS5oDQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdC9kbS9kc2lfaG9zdC5jDQo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlz
dApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
