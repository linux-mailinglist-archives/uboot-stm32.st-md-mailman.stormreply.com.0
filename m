Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E9418A005
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 16:57:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F3CDC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 15:57:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68E1CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 15:57:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IFmVjV010196; Wed, 18 Mar 2020 16:57:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+nbVyHXfWBOQg2hgjKzB33hP3fsN92YFGHd6V+TijHk=;
 b=LZ+rRoKEgolCM4vF1QXRMTYOC3P25OwfN1yJFvhnUd+q+olhkmN6D/bMvQG6CAbpBzdO
 wACQTZ4NXFISV6XpjgMvSLBvSDpirGU/LrzBaXq/QcpomW0yUFmqUmfxDm0CcPDOJeX2
 QQT/LsBqNHelCd8i01dRDjCXLQxs0I8/grnkSFCqWn/Nzqc12Ak1tq2Xmii7s2bYd3vM
 eoKkSGpfKBecR71xzAG/Jj9xal0oGlDDHWm4oy5aN4cx+j2XJrHLfGhrkwNgEj2Uq+wT
 k2YAEpZ+8r/ESpvKs3crflYCvy5gojQoEPhMF3K/ajAsKFY+jmIdr8DsakOSvm1DeUK0 Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95umhcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 16:57:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B986100039;
 Wed, 18 Mar 2020 16:57:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F85C2BEC64;
 Wed, 18 Mar 2020 16:57:20 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 16:57:19 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 16:57:19 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [RFC RFT PATCH] env: spl: filter the variables in default
 environment of SPL or TPL
Thread-Index: AQHV/TKR0OU7sA0LVEqg1rEJ2C76P6hOXioAgAAaOaA=
Date: Wed, 18 Mar 2020 15:57:19 +0000
Message-ID: <069ea804b0e94fabbc03a08c550c9903@SFHDAG6NODE3.st.com>
References: <20200318143602.23253-1-patrick.delaunay@st.com>
 <20200318145110.8E58024003E@gemini.denx.de>
In-Reply-To: <20200318145110.8E58024003E@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_07:2020-03-18,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>, Joe
 Hershberger <joe.hershberger@ni.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [Uboot-stm32] [RFC RFT PATCH] env: spl: filter the variables in
 default environment of SPL or TPL
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

SGkgV29sZmdhbmcsDQoNCj4gRnJvbTogV29sZmdhbmcgRGVuayA8d2RAZGVueC5kZT4NCj4gU2Vu
dDogbWVyY3JlZGkgMTggbWFycyAyMDIwIDE1OjUxDQo+IFRvOiBQYXRyaWNrIERFTEFVTkFZIDxw
YXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4NCj4gQ2M6IHUtYm9vdEBsaXN0cy5kZW54LmRlOyBCaW4g
TWVuZyA8Ym1lbmcuY25AZ21haWwuY29tPjsgRmFiaW8gRXN0ZXZhbQ0KPiA8ZmVzdGV2YW1AZ21h
aWwuY29tPjsgSGVpbnJpY2ggU2NodWNoYXJkdCA8eHlwcm9uLmdscGtAZ214LmRlPjsgSmFnYW4N
Cj4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+OyBKb2UgSGVyc2hiZXJnZXINCj4g
PGpvZS5oZXJzaGJlcmdlckBuaS5jb20+OyBLZXZlciBZYW5nIDxrZXZlci55YW5nQHJvY2stY2hp
cHMuY29tPjsgTWFyZWsNCj4gVmFzdXQgPG1hcmV4QGRlbnguZGU+OyBTaW1vbiBHbGFzcyA8c2pn
QGNocm9taXVtLm9yZz47IFUtQm9vdCBTVE0zMg0KPiA8dWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUkZUIFBBVENIXSBlbnY6IHNw
bDogZmlsdGVyIHRoZSB2YXJpYWJsZXMgaW4gZGVmYXVsdA0KPiBlbnZpcm9ubWVudCBvZiBTUEwg
b3IgVFBMDQo+IA0KPiBEZWFyIFBhdHJpY2ssDQo+IA0KPiBJbiBtZXNzYWdlIDwyMDIwMDMxODE0
MzYwMi4yMzI1My0xLXBhdHJpY2suZGVsYXVuYXlAc3QuY29tPiB5b3Ugd3JvdGU6DQo+ID4gVXNl
IGEgbmV3IG9wdGlvbiBDT05GSUdfU1BMX0VOVl9WQVJTIHRvIGZpbHRlciB0aGUgdmFyaWFibGVz
IGluY2x1ZGVkDQo+ID4gaW4gdGhlIGRlZmF1bHQgZW52aXJvbm1lbnQgdXNlZCBpbiBTUEwgKGFu
ZCBUUEwpLg0KPiA+DQo+ID4gVGhhdCBhbGxvd3MgdG8gcmVkdWNlIHRoZSBzaXplIG9mIGRlZmF1
bHRfZW52aXJvbm1lbnRbXS4NCj4gDQo+IFNvcnJ5LCBidXQgTkFLLiAgd2UgaGFkIHRoaXMgZGlz
Y3Vzc2lvbiBhIGNvdXBsZSBvZiB0aW1lcyBiZWZvcmUuDQo+IEl0IGlzIG1hbmRhdG9yeSB0aGF0
IGJvdGggU1BMIGFuZCBVLUJvb3QgcHJvcGVyIHdpbGwgdXNlIHRoZSBfc2FtZV8gZW52aXJvbm1l
bnQsDQo+IGluY2x1ZGluZyB0aGUgc2FtZSBkZWZhdWx0IGVudmlyb25tZW50LCBvciBhbGwga2lu
ZCBvZiBoYXZvYyBtYXkgcmVzdWx0LiAgSnVzdCB0aGluaw0KPiBvZiBzaXR1YXRpb25zIHdoZXJl
IEZhbGNvbiBNb2RlIGlzIGJlaW5nIHVzZWQgYW5kIFNQTCBhbmQgVS1Cb290IHByb3BlciB3b3Vs
ZA0KPiBiZSB1c2luZyBkaWZmZXJlbnQgc2V0dGluZ3MuDQo+IA0KPiBJZiB5b3VyIGRlZmF1bHQg
ZW52aXJvbm1lbnQgaXMgdG9vIGJpZyBmb3IgdGhlIFNQTCwgdGhlbiBtYWtlIGl0IHNtYWxsZXIu
ICBJZiB5b3UNCj4gbmVlZCBhZGRpdGlvbmFsIHNldHRpbmdzIGluIFUtQm9vdCwgdGhlcmUgYXJl
IG1hbnkgd2F5cyB0byBsb2FkIHRoaXNlIHRoZXJlLg0KDQpUaGFua3MgZm9yIHRoZSBhbnN3ZXIs
IA0Kc28gaXQgd2FzIGNsZWFybHkgbm90IGFuIG9wdGlvbiBhbmQgSSBhYmFuZG9uIHRoaXMgcGF0
Y2guDQoNClRvIGNvbXBsZXRlIG15IGFuc3dlciwgdG9kYXkgSSBkb24ndCBoYXZlIGlzc3VlIHdp
dGggU1BMIGVudmlyb25tZW50IHNpemUgb24gdGhlIHN0bTMyIHRhcmdldHMsDQoNCkkgcHJvcG9z
ZSB0aGlzIHBhdGNoIG9ubHkgdG8gc29sdmUgaXNzdWUgd2l0aCBteSBwcmV2aW91cyBwcm9wb3Nl
ZCBwYXRjaCBvbiBvdGhlciB0YXJnZXQNCg0KLSBbVS1Cb290LHY0LDMvM10gZW52OiBBZGQgQ09O
RklHX0VOVl9GVUxMX1NVUFBPUlQNCi0gW1UtQm9vdCx2NCwyLzNdIGVudjogaW50cm9kdWNlIG1h
Y3JvIEVOVl9JU19JTl9TT01FV0hFUkUNCg0KVGhpcyBwcm9wb3NhbCByYWlzZSBtYW55IHNpemUg
aXNzdWUgZm9yIG90aGVyIGJvYXJkcyB3aGVuIEkgYWN0aXZhdGVkDQpDT05GSUdfU1BMX0VOVl9T
VVBQT1JUIGFuZCBDT05GSUdfU1BMX0VOVl9JU19OT1dIRVJFIGJ5IGRlZmF1bHQuLi4uDQoNClRv
ZGF5IEkgZG9u4oCZdCBzZWUgc29sdXRpb24gZXhjZXB0IGFjY2VwdCB0aGUgY3VycmVudCBzaXR1
YXRpb246DQpmb3Igc29tZSB0YXJnZXQsIHRoZSBlbnZpcm9ubWVudCBpc24ndCBzdXBwb3J0ZWQv
YWN0aXZhdGVkIGluIFNQTCwgZXZlbiBkZWZhdWx0IG9uZQ0KKHdoZW4gQ09ORklHX1NQTF9FTlZf
U1VQUE9SVCBub3QgYWN0aXZhdGVkLCB0aGUgZW52IHNvdXJjZSBmaWxlcyBhcmVuJ3QgY29tcGls
ZWQpDQoNClNvIEkgd2lsbCBhbHNvIGFiYW5kb24gdGhlIHByZXZpb3VzIHBhdGNoc2V0DQotIGh0
dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMTcxMTgwLyANCi0gaHR0cDovL3BhdGNo
d29yay5vemxhYnMub3JnL3BhdGNoLzExNzEwOTgvDQoNClBhdHJpY2sNCg0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IA0KPiBXb2xmZ2FuZyBEZW5rDQo+IA0KPiAtLQ0KPiBERU5YIFNvZnR3YXJlIEVuZ2lu
ZWVyaW5nIEdtYkgsICAgICAgTWFuYWdpbmcgRGlyZWN0b3I6IFdvbGZnYW5nIERlbmsNCj4gSFJC
IDE2NTIzNSBNdW5pY2gsIE9mZmljZTogS2lyY2hlbnN0ci41LCBELTgyMTk0IEdyb2ViZW56ZWxs
LCBHZXJtYW55DQo+IFBob25lOiAoKzQ5KS04MTQyLTY2OTg5LTEwIEZheDogKCs0OSktODE0Mi02
Njk4OS04MCBFbWFpbDogd2RAZGVueC5kZSAiSWYNCj4gdGhhdCBtYWtlcyBhbnkgc2Vuc2UgdG8g
eW91LCB5b3UgaGF2ZSBhIGJpZyBwcm9ibGVtLiINCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIEMuIER1cmFuY2UsIENvbXB1dGVyIFNjaWVuY2UgMjM0DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
