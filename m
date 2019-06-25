Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDBD52898
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 11:53:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BED89C0D2A5
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 09:53:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FD4EC0D2A3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 09:53:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P9kZrW030005; Tue, 25 Jun 2019 11:53:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/4nHHW1OQmk7hmRo8YNns6l7jXNLeKelxRDljrLbEpQ=;
 b=fn+cRISBzbDLESM6cUdlaqLp+FSCCVDTC+K4h+0cwyq7qKn6i26BsmQmpj2Nf0HTPTUA
 dzlYteJnjZSVPxG7UqlgFs+xaPX8V3W7X/VGTH8NxnrrGoUmykrlCBsekuYeDeqCNfyW
 WFXmkch4sP1ghlO1L7JuLK6WXWCPkH5C4OmYjE4c23aBvINRjxOT5Kxpn/VEBx0vTtM+
 3N56chuYkZa/3u6bxfL1Foy3iKBakQyCAizU37uEM9j4W4Zv8i+ylhVbG7vA3iZmLUhC
 1EEuhdA34dkHp2Hc6oF1s3JKZvj8w0gTlxomHPqukiPYXfzGKCJVnsZ216tKWdr0B7A5 hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2wgnac-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 11:53:40 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DF7238;
 Tue, 25 Jun 2019 09:53:38 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6433D25CD;
 Tue, 25 Jun 2019 09:53:38 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 25 Jun
 2019 11:53:37 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 11:53:37 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] mach-stm32: Fix MPU region size dedicated to SDRAM for
 STM32F4
Thread-Index: AQHVKy0UbrFypR5q6k+/vx9qFBvmDaasFb7w///qGIA=
Date: Tue, 25 Jun 2019 09:53:37 +0000
Message-ID: <5d32669f-1639-00e0-cea0-71be7414a6ab@st.com>
References: <20190625080745.21813-1-patrice.chotard@st.com>
 <3c271bb781a348ea9ebc40c465671561@SFHDAG6NODE3.st.com>
In-Reply-To: <3c271bb781a348ea9ebc40c465671561@SFHDAG6NODE3.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <A8B8BFA3F8DCD747B1EA251EAC49A74C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] mach-stm32: Fix MPU region size dedicated
 to SDRAM for STM32F4
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

SGkgUGF0cmljaw0KDQpPbiA2LzI1LzE5IDExOjE4IEFNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3Rl
Og0KPiBIaSBQYXRyaWNlLA0KPg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZy
b206IFBhdHJpY2UgQ0hPVEFSRCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCj4+IFNlbnQ6IG1h
cmRpIDI1IGp1aW4gMjAxOSAxMDowOA0KPj4gVG86IHUtYm9vdEBsaXN0cy5kZW54LmRlDQo+PiBD
YzogUGF0cmljZSBDSE9UQVJEIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPjsgUGF0cmljayBERUxB
VU5BWQ0KPj4gPHBhdHJpY2suZGVsYXVuYXlAc3QuY29tPjsgVS1Cb290IFNUTTMyIDx1Ym9vdC1z
dG0zMkBzdC1tZC0NCj4+IG1haWxtYW4uc3Rvcm1yZXBseS5jb20+OyBBbGJlcnQgQXJpYmF1ZCA8
YWxiZXJ0LnUuYm9vdEBhcmliYXVkLm5ldD47IFZpa2FzDQo+PiBNQU5PQ0hBIDx2aWthcy5tYW5v
Y2hhQHN0LmNvbT4NCj4+IFN1YmplY3Q6IFtQQVRDSF0gbWFjaC1zdG0zMjogRml4IE1QVSByZWdp
b24gc2l6ZSBkZWRpY2F0ZWQgdG8gU0RSQU0gZm9yDQo+PiBTVE0zMkY0DQo+PiBJbXBvcnRhbmNl
OiBIaWdoDQo+Pg0KPj4gVGhlIE1QVSByZWdpb24gZGVkaWNhdGVkIGZvciBTRFJBTSBmb3IgU1RN
MzJGNCBTb0NzIGZhbWlseSB3YXMgc2V0IHRvDQo+PiAxNk1CLCBidXQgU1RNMzJGNDI5IEV2YWx1
YXRpb24gYm9hcmQgaGF2ZSAzMk1CIG9mIFNEUkFNLg0KPj4NCj4+IFdoZW4ga2VybmVsIHN0YXJ0
cywgb25seSBmaXJzdCAxNk1CIG9mIFNEUkFNIGFyZSBjb25maWd1cmVkIHdpdGggWE4gKGVYZWN1
dGUNCj4+IE5ldmVyKSBiaXQgZGlzYWJsZWQsIHdoZXJlYXMga2VybmVsIGlzIHVzaW5nIDMyTUIu
DQo+Pg0KPj4gSXQgZml4ZXMgdGhlIGZvbGxvd2luZyB1c2VyIGxhbmQgZXhjZXB0aW9uIG9uIFNU
TTMyRjQyOSBFdmFsdWF0aW9uIGJvYXJkIDoNCj4+DQo+PiBbICAgIDEuNzEzMDAyXSBWRlM6IE1v
dW50ZWQgcm9vdCAoZXh0NCBmaWxlc3lzdGVtKSByZWFkb25seSBvbiBkZXZpY2UgMTc5OjIuDQo+
PiBbICAgIDEuNzIyNjA1XSBkZXZ0bXBmczogbW91bnRlZA0KPj4gWyAgICAxLjczMzA1N10gRnJl
ZWluZyB1bnVzZWQga2VybmVsIG1lbW9yeTogNzJLDQo+PiBbICAgIDEuNzM3NjIyXSBUaGlzIGFy
Y2hpdGVjdHVyZSBkb2VzIG5vdCBoYXZlIGtlcm5lbCBtZW1vcnkgcHJvdGVjdGlvbi4NCj4+IFsg
ICAgMS43NDQwNzBdIFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2Vzcw0KPj4gWyAgICAxLjkw
Njg1MF0NCj4+IFsgICAgMS45MDY4NTBdIFVuaGFuZGxlZCBleGNlcHRpb246IElQU1IgPSAwMDAw
MDAwNCBMUiA9IGZmZmZmZmZkDQo+PiBbICAgIDEuOTE0MjgyXSBDUFU6IDAgUElEOiAxIENvbW06
IGluaXQgTm90IHRhaW50ZWQgNS4xLjAtMDAwMDItZ2NmOWNhNTcxOTk1NCAjNg0KPj4gWyAgICAx
LjkyMTQzM10gSGFyZHdhcmUgbmFtZTogU1RNMzIgKERldmljZSBUcmVlIFN1cHBvcnQpDQo+PiBb
ICAgIDEuOTI2NjAxXSBQQyBpcyBhdCAweDFhMDBiNjQNCj4+IFsgICAgMS45Mjk2NDJdIExSIGlz
IGF0ICAgKG51bGwpDQo+PiBbICAgIDEuOTMyNjY5XSBwYyA6IFs8MDFhMDBiNjQ+XSAgICBsciA6
IFs8MDAwMDAwMDA+XSAgICBwc3I6IDAxMDAwMDAwDQo+PiBbICAgIDEuOTM4OTkzXSBzcCA6IDAx
YTVjZmIwICBpcCA6IDAwMDAwMDAwICBmcCA6IDAwMDAwMDAwDQo+PiBbICAgIDEuOTQ0MjY5XSBy
MTA6IDAxYTQzYjAwICByOSA6IDAwMDAwMDAwICByOCA6IDAwMDAwMDAwDQo+PiBbICAgIDEuOTQ5
NTY0XSByNyA6IDAwMDAwMDAwICByNiA6IDAwMDAwMDAwICByNSA6IDAwMDAwMDAwICByNCA6IDAw
MDAwMDAwDQo+PiBbICAgIDEuOTU2MTY4XSByMyA6IDAwMDAwMDAwICByMiA6IDAwMDAwMDAwICBy
MSA6IDAwMDAwMDAwICByMCA6IDAwMDAwMDAwDQo+PiBbICAgIDEuOTYyNzAxXSB4UFNSOiAwMTAw
MDAwMA0KPj4gWyAgICAxLjk2NTUwNl0gQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0YWlu
dGVkIDUuMS4wLTAwMDAyLWdjZjljYTU3MTk5NTQgIzYNCj4+IFsgICAgMS45NzI2NThdIEhhcmR3
YXJlIG5hbWU6IFNUTTMyIChEZXZpY2UgVHJlZSBTdXBwb3J0KQ0KPj4gWyAgICAxLjk3ODEzMl0g
WzwwMDAwYzAwOT5dICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8MDAwMGIyNGY+XQ0KPj4gKHNo
b3dfc3RhY2srMHhiLzB4YykNCj4+IFsgICAgMS45ODYwMjRdIFs8MDAwMGIyNGY+XSAoc2hvd19z
dGFjaykgZnJvbSBbPDAwMDBiOTQ3Pl0NCj4+IChfX2ludmFsaWRfZW50cnkrMHg0Yi8weDRjKQ0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0
LmNvbT4NCj4+IC0tLQ0KPj4NCj4+ICBhcmNoL2FybS9tYWNoLXN0bTMyL3NvYy5jIHwgMiArLQ0K
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMyL3NvYy5jIGIvYXJjaC9hcm0vbWFjaC1z
dG0zMi9zb2MuYyBpbmRleA0KPj4gNmFlMzFkM2ExZi4uNzdiYjE4NjM4ZiAxMDA2NDQNCj4+IC0t
LSBhL2FyY2gvYXJtL21hY2gtc3RtMzIvc29jLmMNCj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3Rt
MzIvc29jLmMNCj4+IEBAIC0xOCw3ICsxOCw3IEBAIGludCBhcmNoX2NwdV9pbml0KHZvaWQpDQo+
PiAgCQkgKi8NCj4+ICAjaWYgZGVmaW5lZChDT05GSUdfU1RNMzJGNCkNCj4+ICAJCXsgMHgwMDAw
MDAwMCwgUkVHSU9OXzAsIFhOX0RJUywgUFJJVl9SV19VU1JfUlcsDQo+PiAtCQlPX0lfV0JfUkRf
V1JfQUxMT0MsIFJFR0lPTl8xNk1CIH0sDQo+PiArCQlPX0lfV0JfUkRfV1JfQUxMT0MsIFJFR0lP
Tl8zMk1CIH0sDQo+IEZvciB0aGVzZSBib2FyZHMsIFNZU0NGR19NRU1STVAuTUVNX01PREUgPSAw
eDQNCj4NCj4gLi9hcmNoL2FybS9kdHMvc3RtMzI0MjlpLWV2YWwtdS1ib290LmR0c2k6NDE6CQkJ
c3QsbWVtX3JlbWFwID0gPDQ+Ow0KPiAuL2FyY2gvYXJtL2R0cy9zdG0zMmY0NjktZGlzY28tdS1i
b290LmR0c2k6NDE6CQkJc3QsbWVtX3JlbWFwID0gPDQ+Ow0KPg0KPiA9PiAxMDA6IEZNQy9TRFJB
TSBCYW5rIDEgbWFwcGVkIGF0IDB4MDAwMCAwMDAwDQo+DQo+IFNvIHNpemUgd2hlbiByZW1hcCBz
aG91bCBiZSA1MTJNQiBoZXJlIHRvIGJlIHJlYWR5IHdpdGggZ3JldGVyIFNEUkFNIHNpemUgPw0K
PiBBbmQgb25seSBpZiByZW1hcCBpcyByZXF1ZXN0ZWQgPw0KDQpZb3UgYXJlIHJpZ2h0LCBzaG91
bGQgYmUgYmV0dGVyIHRvIGV4dGVuZCB0aGlzIE1QVSByZWdpb27CoCB0byA1MTJNQi4NCg0KDQo+
DQo+IEVsc2UgaW50ZXJuYWwgRkxBU0ggaXMgdXNlZCAoMDAwOiBNYWluIEZsYXNoIG1lbW9yeSBt
YXBwZWQgYXQgMHgwMDAwIDAwMDApDQo+ID0+IG1heCBTaXplIGlzIDJNQiAgPw0KDQpPbmx5IFNU
TTMyRjQyOS1EaXNjb3ZlcnkgYm9hcmQgaXMgdXNpbmcgdGhpcyBzZXR1cC4NCg0KRm9yIHRoaXMg
Ym9hcmQsIGkgb25seSB0ZXN0IHRoYXQgVS1Cb290IGlzIHN0YXJ0aW5nLiBJIGRpZG4ndCB0ZXN0
IGtlcm5lbCBib290IGluIFhJUCBjb25maWd1cmF0aW9uLg0KDQpQYXRyaWNlDQoNCg0KPg0KPj4g
ICNlbmRpZg0KPj4NCj4+ICAJCXsgMHg5MDAwMDAwMCwgUkVHSU9OXzEsIFhOX0RJUywgUFJJVl9S
V19VU1JfUlcsDQo+PiAtLQ0KPj4gMi4xNy4xDQo+IFJlZ2FyZHMNCj4NCj4gUGF0cmljawpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
