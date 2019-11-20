Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A75103AC2
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 14:09:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E076BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 13:09:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E8B0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 13:09:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKD7KLx024920; Wed, 20 Nov 2019 14:09:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fuWWSss8h5BgspW2fpn6H5GMvXLj55A+miihAEslbas=;
 b=q6mRJuqFZ5Q4ndEkmq6B61Fu0bfpTHriqNFhA9q9zJP4RJ044ajjd9auHUcZ81maTWcl
 cf0+JsddpfSjUgZFSKAHcG6wI3vAAr7MH4STONZxhUjhwNVsIVHFT+ZtqkHK09n+xwQ0
 jZ0bzCQ6O70FOGAl/Mre28fgaxXw5XB87ZxP+oE1zCealqs4JDeR8lVVyoxBuWrKhGtB
 yBSmV2moL+Fi4/mWHvvb/4OW3FfzCCN7L6dk6bZyNj2vdpbUc5EJiaaiSF3H/Elo57BB
 nj2tjYxA9NdGg2/xqn4efR3uSuGdSRXviUeNz7kr72yCU1Y2kC0rWGA2dyzdZRLSux1R 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9uj5t9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 14:09:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39A4810002A;
 Wed, 20 Nov 2019 14:09:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24E302FF5C0;
 Wed, 20 Nov 2019 14:09:34 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 20 Nov
 2019 14:09:33 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 20 Nov 2019 14:09:33 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] video: bmp: Fix video_splash_align_axis()
Thread-Index: AQHVn496cCXyRGxMm0qsyx/7cWT3SKeT1SQAgAAieYA=
Date: Wed, 20 Nov 2019 13:09:33 +0000
Message-ID: <545aaf19-02d4-d2ac-3eb8-05cce8c61d3b@st.com>
References: <20191120104418.1179-1-patrice.chotard@st.com>
 <20191120104418.1179-2-patrice.chotard@st.com>
 <f7540c4f9c3b4869a6752b900c9a14f7@SFHDAG6NODE3.st.com>
In-Reply-To: <f7540c4f9c3b4869a6752b900c9a14f7@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <494D02269C69C447A4BC4459B2A79892@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_03:2019-11-15,2019-11-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Yannick FERTRE <yannick.fertre@st.com>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] video: bmp: Fix
	video_splash_align_axis()
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

DQpPbiAxMS8yMC8xOSAxMjowNiBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToNCj4gSGksDQo+
DQo+PiBGcm9tOiBQYXRyaWNlIENIT1RBUkQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+DQo+PiBT
ZW50OiBtZXJjcmVkaSAyMCBub3ZlbWJyZSAyMDE5IDExOjQ0DQo+Pg0KPj4gSW4gY2FzZSB0aGUg
cGFuZWxfc2l6ZSBpcyBzbWFsbGVyIHRoYW4gcGljdHVyZV9zaXplLCB3ZSBtdXN0IGluc3VyZSB0
aGF0DQo+PiBwYW5lbF9waWN0dXJlX2RlbHRhIHN0b3JlcyB0aGUgYWJzb2x1dGUgdmFsdWUgb2Yg
ZGlmZmVyZW5jZSBiZXR3ZWVuIHBhbmVsX3NpemUNCj4+IGFuZCBwaWN0dXJlX3NpemUuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29t
Pg0KPj4gQ0M6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPg0KPj4gLS0t
DQo+Pg0KPj4gIGRyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMgfCAyICstDQo+PiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMgYi9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIGlu
ZGV4DQo+PiAxOTNmMzdkMjc1Li5kYzYyNThjZTc4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92
aWRlby92aWRlb19ibXAuYw0KPj4gKysrIGIvZHJpdmVycy92aWRlby92aWRlb19ibXAuYw0KPj4g
QEAgLTE1Nyw3ICsxNTcsNyBAQCBfX3dlYWsgdm9pZCBmYl9wdXRfd29yZCh1Y2hhciAqKmZiLCB1
Y2hhciAqKmZyb20pDQo+PiBzdGF0aWMgdm9pZCB2aWRlb19zcGxhc2hfYWxpZ25fYXhpcyhpbnQg
KmF4aXMsIHVuc2lnbmVkIGxvbmcgcGFuZWxfc2l6ZSwNCj4+ICAJCQkJICAgIHVuc2lnbmVkIGxv
bmcgcGljdHVyZV9zaXplKQ0KPj4gIHsNCj4+IC0JdW5zaWduZWQgbG9uZyBwYW5lbF9waWN0dXJl
X2RlbHRhID0gcGFuZWxfc2l6ZSAtIHBpY3R1cmVfc2l6ZTsNCj4+ICsJdW5zaWduZWQgbG9uZyBw
YW5lbF9waWN0dXJlX2RlbHRhID0gYWJzKHBhbmVsX3NpemUgLSBwaWN0dXJlX3NpemUpOw0KPiBJ
IHRoaW5rIHRoaXMgcGF0Y2ggY2F1c2UgYWxpZ25tZW50IGlzc3VlIGlmIHBpY3R1cmVfc2l6ZSA+
IHBhbmVsX3NpemUuIChub3QgYWxsaWduZSBhIHRoZSBsZWZ0L3VwIGNvcm5lcikuDQo+DQo+IEkg
dGhpbmsgaXQgaXMgYmVldGVyIHRvIGNoYW5nZSB0eXBlOg0KPg0KPiArIGxvbmcgcGFuZWxfcGlj
dHVyZV9kZWx0YSA9IHBhbmVsX3NpemUgLSBwaWN0dXJlX3NpemU7DQo+DQo+IEFzIHZhbHVlIGlz
IGNyb3BwZWQgdG8gMCBpbiB0aGUgbmV4dCBsaW5lczoNCj4NCj4gKmF4aXMgPSBtYXgoMCwgKGlu
dClheGlzX2FsaWdubWVudCk7DQo+DQpBZ3JlZSwgaSB3aWxsIHVwZGF0ZSB0aGlzIGluIFYyDQoN
ClRoYW5rcw0KDQo+DQo+PiAgCXVuc2lnbmVkIGxvbmcgYXhpc19hbGlnbm1lbnQ7DQo+Pg0KPj4g
IAlpZiAoKmF4aXMgPT0gQk1QX0FMSUdOX0NFTlRFUikNCj4+IC0tDQo+PiAyLjE3LjENCj4NCj4g
UmVnYXJkcw0KPg0KPiBQYXRyaWNrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
