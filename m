Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67619115F0
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 11:04:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30BB5C07303
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 09:04:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B88C8C07302
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 09:04:16 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x428unfX027465; Thu, 2 May 2019 11:04:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=clCXNaW2LfGqDc68GCgRTj+VXUk3brI363Czqkccg7I=;
 b=lT06WLDvhEt8s5RoS1hjm9MdywgjsqAhsOdaf+SJyMLivrDNbaHuTE9ydNB4t5JiBIRf
 yC3Q4DnarhHqatRrW3OEcfymrL2JJKiMPsHBsiOJSuZViTVzrkrrd8ZUwVIeI9usc281
 QpSX/tt9IJDC4et+CAYS9bBUSLfcSgmvFl4FM1uiEJVe6Sy7yXTA30bYN55lNdwHRs8K
 CtiVJBXjkyimOQXHQChF7+YxID/fiyJsLJ/0xZCLTUTVGegwUUm0+zSAqezdZRqGEFfS
 eMweJn8JaaiV0nFX5hm2LjzSsT45ZV5ca1XNfxR6nElhnMZkF2MclR9LGnBB77br2643 Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s6xgrq7ab-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 02 May 2019 11:04:13 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 832093D;
 Thu,  2 May 2019 09:04:12 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25BC714F0;
 Thu,  2 May 2019 09:04:12 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 May
 2019 11:04:11 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Thu, 2 May 2019 11:04:11 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Christophe KERELLO <christophe.kerello@st.com>,
 "trini@konsulko.com" <trini@konsulko.com>
Thread-Topic: [PATCH v2 2/3] board: stm32mp1: Add Avenger96 board support
Thread-Index: AQHVALyoiah4Oir8GEOOGGsDWjq8HqZXaQEA
Date: Thu, 2 May 2019 09:04:11 +0000
Message-ID: <fa499b84-f91c-39fb-4688-5d0cfb44287f@st.com>
References: <20190502075645.19901-1-manivannan.sadhasivam@linaro.org>
 <20190502075645.19901-3-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190502075645.19901-3-manivannan.sadhasivam@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <C8AC926D6A5DA94B816FCE9EE496600C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_04:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] board: stm32mp1: Add Avenger96
	board support
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

SGkgTWFuaXZhbm5hbg0KDQpPbiA1LzIvMTkgOTo1NiBBTSwgTWFuaXZhbm5hbiBTYWRoYXNpdmFt
IHdyb3RlOg0KPiBBZGQgc3VwcG9ydCBmb3IgQXZlbmdlcjk2IGJvYXJkIGZyb20gQXJyb3cgRWxl
Y3Ryb25pY3MgYmFzZWQgb24gU1RNMzJNUDE1Nw0KPiBNUFUuIFRoaXMgYm9hcmQgaXMgb25lIG9m
IHRoZSBDb25zdW1lciBFZGl0aW9uIChDRSkgYm9hcmRzIG9mIHRoZSA5NkJvYXJkcw0KPiBmYW1p
bHkgYW5kIGhhcyB0aGUgZm9sbG93aW5nIGZlYXR1cmVzOg0KPiANCj4gU29DOiBTVE0zMk1QMTU3
QUFDDQo+IFBNSUM6IFNUUE1JQzFBDQo+IFJBTTogMTAyNCBNYnl0ZSBAIDUzM01Ieg0KPiBTdG9y
YWdlOiBlTU1DIHY0LjUxOiA4IEdieXRlDQo+ICAgICAgICAgIG1pY3JvU0QgU29ja2V0OiBVSFMt
MSB2My4wMQ0KPiBFdGhlcm5ldCBQb3J0OiAxMC8xMDAvMTAwMCBNYml0L3MsIElFRUUgODAyLjMg
Q29tcGxpYW50DQo+IFdpcmVsZXNzOiBXaUZpIDUgR0h6ICYgMi40R0h6IElFRUUgODAyLjExYS9i
L2cvbi9hYw0KPiAgICAgICAgICAgQmx1ZXRvb3Rowq52NC4yIChCUi9FRFIvQkxFKQ0KPiBVU0I6
IDJ4IFR5cGUgQSAoVVNCIDIuMCkgSG9zdCBhbmQgMXggTWljcm8gQiAoVVNCIDIuMCkgT1RHDQo+
IERpc3BsYXk6IEhETUk6IFdYR0EgKDEzNjZ4NzY4KUAgNjAgZnBzLCBIRE1JIDEuNA0KPiBMRUQ6
IDR4IFVzZXIgTEVELCAxeCBXaUZpIExFRCwgMXggQlQgTEVEDQo+IA0KPiBNb3JlIGluZm9ybWF0
aW9uIGFib3V0IHRoaXMgYm9hcmQgY2FuIGJlIGZvdW5kIGluIDk2Qm9hcmRzIHdlYnNpdGU6DQo+
IGh0dHBzOi8vd3d3Ljk2Ym9hcmRzLm9yZy9wcm9kdWN0L2F2ZW5nZXI5Ni8NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxp
bmFyby5vcmc+DQo+IC0tLQ0KPiAgYXJjaC9hcm0vZHRzL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsNCj4gIC4uLi9hcm0vZHRzL3N0bTMybXAxNTdhLWF2ZW5nZXI5Ni11
LWJvb3QuZHRzaSB8IDE5MSArKysrKysrKysNCj4gIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3YS1h
dmVuZ2VyOTYuZHRzICAgICAgICB8IDM2MiArKysrKysrKysrKysrKysrKysNCj4gIGJvYXJkL3N0
L3N0bTMybXAxL1JFQURNRSAgICAgICAgICAgICAgICAgICAgICB8ICAyMyArKw0KPiAgNCBmaWxl
cyBjaGFuZ2VkLCA1NzcgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtL2R0cy9zdG0zMm1wMTU3YS1hdmVuZ2VyOTYtdS1ib290LmR0c2kNCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1N2EtYXZlbmdlcjk2LmR0cw0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9NYWtlZmlsZSBiL2FyY2gvYXJtL2R0cy9NYWtlZmlsZQ0K
PiBpbmRleCBiNGRjNTdlZGJkMS4uOTdhMTgyZjNhYmMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJt
L2R0cy9NYWtlZmlsZQ0KPiArKysgYi9hcmNoL2FybS9kdHMvTWFrZWZpbGUNCj4gQEAgLTcxMSw2
ICs3MTEsNyBAQCBkdGItJChDT05GSUdfQVJDSF9TVEkpICs9IHN0aWg0MTAtYjIyNjAuZHRiDQo+
ICANCj4gIGR0Yi0kKENPTkZJR19UQVJHRVRfU1RNMzJNUDEpICs9IFwNCj4gIAlzdG0zMm1wMTU3
YS1kazEuZHRiIFwNCj4gKwlzdG0zMm1wMTU3YS1hdmVuZ2VyOTYuZHRiIFwNCj4gIAlzdG0zMm1w
MTU3Yy1kazIuZHRiIFwNCj4gIAlzdG0zMm1wMTU3Yy1lZDEuZHRiIFwNCj4gIAlzdG0zMm1wMTU3
Yy1ldjEuZHRiDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1N2EtYXZlbmdl
cjk2LXUtYm9vdC5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdhLWF2ZW5nZXI5Ni11LWJv
b3QuZHRzaQ0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMC4uMWZm
NjgxYWZiODcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1
N2EtYXZlbmdlcjk2LXUtYm9vdC5kdHNpDQo+IEBAIC0wLDAgKzEsMTkxIEBADQo+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTMtQ2xhdXNlKQ0KPiArLyoNCj4g
KyAqIENvcHlyaWdodCA6IFNUTWljcm9lbGVjdHJvbmljcyAyMDE4DQo+ICsgKg0KPiArICogQ29w
eXJpZ2h0IChDKSBMaW5hcm8gTHRkIDIwMTkgLSBBbGwgUmlnaHRzIFJlc2VydmVkDQo+ICsgKiBB
dXRob3I6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFy
by5vcmc+DQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N0bTMy
bXAxLWNsa3NyYy5oPg0KPiArI2luY2x1ZGUgInN0bTMybXAxNTctdS1ib290LmR0c2kiDQo+ICsj
aW5jbHVkZSAic3RtMzJtcDE1LWRkcjMtMng0R2ItMTA2Ni1iaW5HLmR0c2kiDQo+ICsNCj4gKy8g
ew0KPiArCWFsaWFzZXMgew0KPiArCQltbWMwID0gJnNkbW1jMTsNCj4gKwkJbW1jMSA9ICZzZG1t
YzI7DQo+ICsJCXVzYjAgPSAmdXNib3RnX2hzOw0KPiArCX07DQo+ICsNCj4gKwljb25maWcgew0K
PiArCQl1LWJvb3QsYm9vdC1sZWQgPSAibGVkMSI7DQo+ICsJCXUtYm9vdCxlcnJvci1sZWQgPSAi
bGVkNCI7DQo+ICsJfTsNCj4gK307DQo+ICsNCj4gKyZpMmM0IHsNCj4gKwl1LWJvb3QsZG0tcHJl
LXJlbG9jOw0KPiArfTsNCj4gKw0KPiArJmkyYzRfcGluc19hIHsNCj4gKwl1LWJvb3QsZG0tcHJl
LXJlbG9jOw0KPiArCXBpbnMgew0KPiArCQl1LWJvb3QsZG0tcHJlLXJlbG9jOw0KPiArCX07DQo+
ICt9Ow0KPiArDQo+ICsmcG1pYyB7DQo+ICsJdS1ib290LGRtLXByZS1yZWxvYzsNCj4gK307DQo+
ICsNCj4gKyZyY2Mgew0KPiArCXN0LGNsa3NyYyA9IDwNCj4gKwkJQ0xLX01QVV9QTEwxUA0KPiAr
CQlDTEtfQVhJX1BMTDJQDQo+ICsJCUNMS19NQ1VfUExMM1ANCj4gKwkJQ0xLX1BMTDEyX0hTRQ0K
PiArCQlDTEtfUExMM19IU0UNCj4gKwkJQ0xLX1BMTDRfSFNFDQo+ICsJCUNMS19SVENfTFNFDQo+
ICsJCUNMS19NQ08xX0RJU0FCTEVEDQo+ICsJCUNMS19NQ08yX0RJU0FCTEVEDQo+ICsJPjsNCj4g
Kw0KPiArCXN0LGNsa2RpdiA9IDwNCj4gKwkJMSAvKk1QVSovDQo+ICsJCTAgLypBWEkqLw0KPiAr
CQkwIC8qTUNVKi8NCj4gKwkJMSAvKkFQQjEqLw0KPiArCQkxIC8qQVBCMiovDQo+ICsJCTEgLypB
UEIzKi8NCj4gKwkJMSAvKkFQQjQqLw0KPiArCQkyIC8qQVBCNSovDQo+ICsJCTIzIC8qUlRDKi8N
Cj4gKwkJMCAvKk1DTzEqLw0KPiArCQkwIC8qTUNPMiovDQo+ICsJPjsNCj4gKw0KPiArCXN0LHBr
Y3MgPSA8DQo+ICsJCUNMS19DS1BFUl9IU0UNCj4gKwkJQ0xLX0ZNQ19BQ0xLDQo+ICsJCUNMS19R
U1BJX0FDTEsNCj4gKwkJQ0xLX0VUSF9ESVNBQkxFRA0KPiArCQlDTEtfU0RNTUMxMl9QTEw0UA0K
PiArCQlDTEtfRFNJX0RTSVBMTA0KPiArCQlDTEtfU1RHRU5fSFNFDQo+ICsJCUNMS19VU0JQSFlf
SFNFDQo+ICsJCUNMS19TUEkyUzFfUExMM1ENCj4gKwkJQ0xLX1NQSTJTMjNfUExMM1ENCj4gKwkJ
Q0xLX1NQSTQ1X0hTSQ0KPiArCQlDTEtfU1BJNl9IU0kNCj4gKwkJQ0xLX0kyQzQ2X0hTSQ0KPiAr
CQlDTEtfU0RNTUMzX1BMTDRQDQo+ICsJCUNMS19VU0JPX1VTQlBIWQ0KPiArCQlDTEtfQURDX0NL
UEVSDQo+ICsJCUNMS19DRUNfTFNFDQo+ICsJCUNMS19JMkMxMl9IU0kNCj4gKwkJQ0xLX0kyQzM1
X0hTSQ0KPiArCQlDTEtfVUFSVDFfSFNJDQo+ICsJCUNMS19VQVJUMjRfSFNJDQo+ICsJCUNMS19V
QVJUMzVfSFNJDQo+ICsJCUNMS19VQVJUNl9IU0kNCj4gKwkJQ0xLX1VBUlQ3OF9IU0kNCj4gKwkJ
Q0xLX1NQRElGX1BMTDRQDQo+ICsJCUNMS19GRENBTl9QTEw0UQ0KPiArCQlDTEtfU0FJMV9QTEwz
UQ0KPiArCQlDTEtfU0FJMl9QTEwzUQ0KPiArCQlDTEtfU0FJM19QTEwzUQ0KPiArCQlDTEtfU0FJ
NF9QTEwzUQ0KPiArCQlDTEtfUk5HMV9MU0kNCj4gKwkJQ0xLX1JORzJfTFNJDQo+ICsJCUNMS19M
UFRJTTFfUENMSzENCj4gKwkJQ0xLX0xQVElNMjNfUENMSzMNCj4gKwkJQ0xLX0xQVElNNDVfTFNF
DQo+ICsJPjsNCj4gKw0KPiArCS8qIFZDTyA9IDEzMDAuMCBNSHogPT4gUCA9IDY1MCAoQ1BVKSAq
Lw0KPiArCXBsbDE6IHN0LHBsbEAwIHsNCj4gKwkJY2ZnID0gPCAyIDgwIDAgMCAwIFBRUigxLDAs
MCkgPjsNCj4gKwkJZnJhYyA9IDwgMHg4MDAgPjsNCj4gKwkJdS1ib290LGRtLXByZS1yZWxvYzsN
Cj4gKwl9Ow0KPiArDQo+ICsJLyogVkNPID0gMTA2Ni4wIE1IeiA9PiBQID0gMjY2IChBWEkpLCBR
ID0gNTMzIChHUFUpLCBSID0gNTMzIChERFIpICovDQo+ICsJcGxsMjogc3QscGxsQDEgew0KPiAr
CQljZmcgPSA8IDIgNjUgMSAwIDAgUFFSKDEsMSwxKSA+Ow0KPiArCQlmcmFjID0gPCAweDE0MDAg
PjsNCj4gKwkJdS1ib290LGRtLXByZS1yZWxvYzsNCj4gKwl9Ow0KPiArDQo+ICsJLyogVkNPID0g
NDE3LjggTUh6ID0+IFAgPSAyMDksIFEgPSAyNCwgUiA9IDExICovDQo+ICsJcGxsMzogc3QscGxs
QDIgew0KPiArCQljZmcgPSA8IDEgMzMgMSAxNiAzNiBQUVIoMSwxLDEpID47DQo+ICsJCWZyYWMg
PSA8IDB4MWEwNCA+Ow0KPiArCQl1LWJvb3QsZG0tcHJlLXJlbG9jOw0KPiArCX07DQo+ICsNCj4g
KwkvKiBWQ08gPSA0ODAuMCBNSHogPT4gUCA9IDEyMCwgUSA9IDQwLCBSID0gOTYgKi8NCj4gKwlw
bGw0OiBzdCxwbGxAMyB7DQo+ICsJCWNmZyA9IDwgMSAzOSAzIDExIDQgUFFSKDEsMSwxKSA+Ow0K
PiArCQl1LWJvb3QsZG0tcHJlLXJlbG9jOw0KPiArCX07DQo+ICt9Ow0KPiArDQo+ICsmc2RtbWMx
IHsNCj4gKwl1LWJvb3QsZG0tc3BsOw0KPiArfTsNCj4gKw0KPiArJnNkbW1jMV9iNF9waW5zX2Eg
ew0KPiArCXUtYm9vdCxkbS1zcGw7DQo+ICsJcGlucyB7DQo+ICsJCXUtYm9vdCxkbS1zcGw7DQo+
ICsJfTsNCj4gK307DQo+ICsNCj4gKyZzZG1tYzFfZGlyX3BpbnNfYSB7DQo+ICsJdS1ib290LGRt
LXNwbDsNCj4gKwlwaW5zIHsNCj4gKwkJdS1ib290LGRtLXNwbDsNCj4gKwl9Ow0KPiArfTsNCj4g
Kw0KPiArJnNkbW1jMiB7DQo+ICsJdS1ib290LGRtLXNwbDsNCj4gK307DQo+ICsNCj4gKyZzZG1t
YzJfYjRfcGluc19hIHsNCj4gKwl1LWJvb3QsZG0tc3BsOw0KPiArCXBpbnMgew0KPiArCQl1LWJv
b3QsZG0tc3BsOw0KPiArCX07DQo+ICt9Ow0KPiArDQo+ICsmc2RtbWMyX2Q0N19waW5zX2Egew0K
PiArCXUtYm9vdCxkbS1zcGw7DQo+ICsJcGlucyB7DQo+ICsJCXUtYm9vdCxkbS1zcGw7DQo+ICsJ
fTsNCj4gK307DQo+ICsNCj4gKyZ1YXJ0NCB7DQo+ICsJdS1ib290LGRtLXByZS1yZWxvYzsNCj4g
K307DQo+ICsNCj4gKyZ1YXJ0NF9waW5zX2Igew0KPiArCXUtYm9vdCxkbS1wcmUtcmVsb2M7DQo+
ICsJcGluczEgew0KPiArCQl1LWJvb3QsZG0tcHJlLXJlbG9jOw0KPiArCX07DQo+ICsJcGluczIg
ew0KPiArCQl1LWJvb3QsZG0tcHJlLXJlbG9jOw0KPiArCX07DQo+ICt9Ow0KPiArDQo+ICsmdXNi
b3RnX2hzIHsNCj4gKwl1LWJvb3QsZm9yY2UtYi1zZXNzaW9uLXZhbGlkOw0KPiArCWhucC1zcnAt
ZGlzYWJsZTsNCj4gK307DQo+ICsNCj4gKyZ2M3YzIHsNCj4gKwlyZWd1bGF0b3ItYWx3YXlzLW9u
Ow0KPiArfTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTU3YS1hdmVuZ2Vy
OTYuZHRzIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdhLWF2ZW5nZXI5Ni5kdHMNCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAuLmRkMDg1OTc2OWJmDQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAxNTdhLWF2ZW5nZXI5Ni5kdHMN
Cj4gQEAgLTAsMCArMSwzNjIgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBCU0QtMy1DbGF1c2UpDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChDKSBTVE1pY3Jv
ZWxlY3Ryb25pY3MgMjAxOSAtIEFsbCBSaWdodHMgUmVzZXJ2ZWQNCj4gKyAqIEF1dGhvcjogQWxl
eGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+IGZvciBTVE1pY3JvZWxlY3Ry
b25pY3MuDQo+ICsgKg0KPiArICogQ29weXJpZ2h0IChDKSBMaW5hcm8gTHRkIDIwMTkgLSBBbGwg
UmlnaHRzIFJlc2VydmVkDQo+ICsgKiBBdXRob3I6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFu
aXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+DQo+ICsgKi8NCj4gKw0KPiArL2R0cy12MS87
DQo+ICsNCj4gKyNpbmNsdWRlICJzdG0zMm1wMTU3Yy5kdHNpIg0KPiArI2luY2x1ZGUgInN0bTMy
bXAxNTctcGluY3RybC5kdHNpIg0KPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5o
Pg0KPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL21mZC9zdCxzdHBtaWMxLmg+DQo+ICsNCj4gKy8g
ew0KPiArCW1vZGVsID0gIkFycm93IEVsZWN0cm9uaWNzIFNUTTMyTVAxNTdBIEF2ZW5nZXI5NiBi
b2FyZCI7DQo+ICsJY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTU3YS1hdmVuZ2VyOTYiLCAic3Qs
c3RtMzJtcDE1NyI7DQo+ICsNCj4gKwlhbGlhc2VzIHsNCj4gKwkJZXRoZXJuZXQwID0gJmV0aGVy
bmV0MDsNCj4gKwkJc2VyaWFsMCA9ICZ1YXJ0NDsNCj4gKwl9Ow0KPiArDQo+ICsJY2hvc2VuIHsN
Cj4gKwkJc3Rkb3V0LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7DQo+ICsJfTsNCj4gKw0KPiAr
CW1lbW9yeUBjMDAwMDAwMCB7DQo+ICsJCXJlZyA9IDwweGMwMDAwMDAwIDB4NDAwMDAwMDA+Ow0K
PiArCX07DQo+ICsNCj4gKwlsZWQgew0KPiArCQljb21wYXRpYmxlID0gImdwaW8tbGVkcyI7DQo+
ICsJCWxlZDEgew0KPiArCQkJbGFiZWwgPSAiZ3JlZW46dXNlcjEiOw0KPiArCQkJZ3Bpb3MgPSA8
JmdwaW96IDcgR1BJT19BQ1RJVkVfSElHSD47DQo+ICsJCQlsaW51eCxkZWZhdWx0LXRyaWdnZXIg
PSAiaGVhcnRiZWF0IjsNCj4gKwkJCWRlZmF1bHQtc3RhdGUgPSAib2ZmIjsNCj4gKwkJfTsNCj4g
Kw0KPiArCQlsZWQyIHsNCj4gKwkJCWxhYmVsID0gImdyZWVuOnVzZXIyIjsNCj4gKwkJCWdwaW9z
ID0gPCZncGlvZiAzIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiArCQkJbGludXgsZGVmYXVsdC10cmln
Z2VyID0gIm1tYzAiOw0KPiArCQkJZGVmYXVsdC1zdGF0ZSA9ICJvZmYiOw0KPiArCQl9Ow0KPiAr
DQo+ICsJCWxlZDMgew0KPiArCQkJbGFiZWwgPSAiZ3JlZW46dXNlcjMiOw0KPiArCQkJZ3Bpb3Mg
PSA8JmdwaW9nIDAgR1BJT19BQ1RJVkVfSElHSD47DQo+ICsJCQlsaW51eCxkZWZhdWx0LXRyaWdn
ZXIgPSAibW1jMSI7DQo+ICsJCQlkZWZhdWx0LXN0YXRlID0gIm9mZiI7DQo+ICsJCX07DQo+ICsN
Cj4gKwkJbGVkNCB7DQo+ICsJCQlsYWJlbCA9ICJncmVlbjp1c2VyMyI7DQo+ICsJCQlncGlvcyA9
IDwmZ3Bpb2cgMSBHUElPX0FDVElWRV9ISUdIPjsNCj4gKwkJCWxpbnV4LGRlZmF1bHQtdHJpZ2dl
ciA9ICJub25lIjsNCj4gKwkJCWRlZmF1bHQtc3RhdGUgPSAib2ZmIjsNCj4gKwkJCXBhbmljLWlu
ZGljYXRvcjsNCj4gKwkJfTsNCj4gKw0KPiArCQlsZWQ1IHsNCj4gKwkJCWxhYmVsID0gInllbGxv
dzp3aWZpIjsNCj4gKwkJCWdwaW9zID0gPCZncGlveiAzIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiAr
CQkJbGludXgsZGVmYXVsdC10cmlnZ2VyID0gInBoeTB0eCI7DQo+ICsJCQlkZWZhdWx0LXN0YXRl
ID0gIm9mZiI7DQo+ICsJCX07DQo+ICsNCj4gKwkJbGVkNiB7DQo+ICsJCQlsYWJlbCA9ICJibHVl
OmJ0IjsNCj4gKwkJCWdwaW9zID0gPCZncGlveiA2IEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiArCQkJ
bGludXgsZGVmYXVsdC10cmlnZ2VyID0gImJsdWV0b290aC1wb3dlciI7DQo+ICsJCQlkZWZhdWx0
LXN0YXRlID0gIm9mZiI7DQo+ICsJCX07DQo+ICsJfTsNCj4gK307DQo+ICsNCj4gKyZldGhlcm5l
dDAgew0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gKwlwaW5jdHJsLTAgPSA8JmV0aGVybmV0MF9y
Z21paV9waW5zX2E+Ow0KPiArCXBpbmN0cmwtMSA9IDwmZXRoZXJuZXQwX3JnbWlpX3BpbnNfc2xl
ZXBfYT47DQo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIjsNCj4gKwlwaHkt
bW9kZSA9ICJyZ21paSI7DQo+ICsJbWF4LXNwZWVkID0gPDEwMDA+Ow0KPiArCXBoeS1oYW5kbGUg
PSA8JnBoeTA+Ow0KPiArDQo+ICsJbWRpbzAgew0KPiArCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4gKwkJI3NpemUtY2VsbHMgPSA8MD47DQo+ICsJCWNvbXBhdGlibGUgPSAic25wcyxkd21hYy1t
ZGlvIjsNCj4gKwkJcGh5MDogZXRoZXJuZXQtcGh5QDcgew0KPiArCQkJcmVnID0gPDc+Ow0KPiAr
CQl9Ow0KPiArCX07DQo+ICt9Ow0KPiArDQo+ICsmaTJjMSB7DQo+ICsJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsNCj4gKwlwaW5jdHJsLTAgPSA8JmkyYzFfcGluc19iPjsNCj4gKwlpMmMtc2Ns
LXJpc2luZy10aW1lLW5zID0gPDE4NT47DQo+ICsJaTJjLXNjbC1mYWxsaW5nLXRpbWUtbnMgPSA8
MjA+Ow0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gKwkvZGVsZXRlLXByb3BlcnR5L2RtYXM7DQo+
ICsJL2RlbGV0ZS1wcm9wZXJ0eS9kbWEtbmFtZXM7DQo+ICt9Ow0KPiArDQo+ICsmaTJjMiB7DQo+
ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwlwaW5jdHJsLTAgPSA8JmkyYzJfcGlu
c19iPjsNCj4gKwlpMmMtc2NsLXJpc2luZy10aW1lLW5zID0gPDE4NT47DQo+ICsJaTJjLXNjbC1m
YWxsaW5nLXRpbWUtbnMgPSA8MjA+Ow0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gKwkvZGVsZXRl
LXByb3BlcnR5L2RtYXM7DQo+ICsJL2RlbGV0ZS1wcm9wZXJ0eS9kbWEtbmFtZXM7DQo+ICt9Ow0K
PiArDQo+ICsmaTJjNCB7DQo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwlwaW5j
dHJsLTAgPSA8JmkyYzRfcGluc19hPjsNCj4gKwlpMmMtc2NsLXJpc2luZy10aW1lLW5zID0gPDE4
NT47DQo+ICsJaTJjLXNjbC1mYWxsaW5nLXRpbWUtbnMgPSA8MjA+Ow0KPiArCXN0YXR1cyA9ICJv
a2F5IjsNCj4gKwkvZGVsZXRlLXByb3BlcnR5L2RtYXM7DQo+ICsJL2RlbGV0ZS1wcm9wZXJ0eS9k
bWEtbmFtZXM7DQo+ICsNCj4gKwlwbWljOiBzdHBtaWNAMzMgew0KPiArCQljb21wYXRpYmxlID0g
InN0LHN0cG1pYzEiOw0KPiArCQlyZWcgPSA8MHgzMz47DQo+ICsJCWludGVycnVwdHMtZXh0ZW5k
ZWQgPSA8JmV4dGkgNTUgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsNCj4gKwkJaW50ZXJydXB0LWNv
bnRyb2xsZXI7DQo+ICsJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47DQo+ICsJCXN0YXR1cyA9ICJv
a2F5IjsNCj4gKw0KPiArCQlzdCxtYWluLWNvbnRyb2wtcmVnaXN0ZXIgPSA8MHgwND47DQo+ICsJ
CXN0LHZpbi1jb250cm9sLXJlZ2lzdGVyID0gPDB4YzA+Ow0KPiArCQlzdCx1c2ItY29udHJvbC1y
ZWdpc3RlciA9IDwweDMwPjsNCj4gKw0KPiArCQlyZWd1bGF0b3JzIHsNCj4gKwkJCWNvbXBhdGli
bGUgPSAic3Qsc3RwbWljMS1yZWd1bGF0b3JzIjsNCj4gKw0KPiArCQkJbGRvMS1zdXBwbHkgPSA8
JnYzdjM+Ow0KPiArCQkJbGRvMi1zdXBwbHkgPSA8JnYzdjM+Ow0KPiArCQkJbGRvMy1zdXBwbHkg
PSA8JnZkZF9kZHI+Ow0KPiArCQkJbGRvNS1zdXBwbHkgPSA8JnYzdjM+Ow0KPiArCQkJbGRvNi1z
dXBwbHkgPSA8JnYzdjM+Ow0KPiArCQkJcHdyX3N3MS1zdXBwbHkgPSA8JmJzdF9vdXQ+Ow0KPiAr
CQkJcHdyX3N3Mi1zdXBwbHkgPSA8JmJzdF9vdXQ+Ow0KPiArDQo+ICsJCQl2ZGRjb3JlOiBidWNr
MSB7DQo+ICsJCQkJcmVndWxhdG9yLW5hbWUgPSAidmRkY29yZSI7DQo+ICsJCQkJcmVndWxhdG9y
LW1pbi1taWNyb3ZvbHQgPSA8ODAwMDAwPjsNCj4gKwkJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9s
dCA9IDwxMzUwMDAwPjsNCj4gKwkJCQlyZWd1bGF0b3ItYWx3YXlzLW9uOw0KPiArCQkJCXJlZ3Vs
YXRvci1pbml0aWFsLW1vZGUgPSA8Mj47DQo+ICsJCQkJcmVndWxhdG9yLW92ZXItY3VycmVudC1w
cm90ZWN0aW9uOw0KPiArCQkJfTsNCj4gKw0KPiArCQkJdmRkX2RkcjogYnVjazIgew0KPiArCQkJ
CXJlZ3VsYXRvci1uYW1lID0gInZkZF9kZHIiOw0KPiArCQkJCXJlZ3VsYXRvci1taW4tbWljcm92
b2x0ID0gPDEzNTAwMDA+Ow0KPiArCQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDEzNTAw
MDA+Ow0KPiArCQkJCXJlZ3VsYXRvci1hbHdheXMtb247DQo+ICsJCQkJcmVndWxhdG9yLWluaXRp
YWwtbW9kZSA9IDwyPjsNCj4gKwkJCQlyZWd1bGF0b3Itb3Zlci1jdXJyZW50LXByb3RlY3Rpb247
DQo+ICsJCQl9Ow0KPiArDQo+ICsJCQl2ZGQ6IGJ1Y2szIHsNCj4gKwkJCQlyZWd1bGF0b3ItbmFt
ZSA9ICJ2ZGQiOw0KPiArCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDI1MDAwMDA+Ow0K
PiArCQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDI1MDAwMDA+Ow0KPiArCQkJCXJlZ3Vs
YXRvci1hbHdheXMtb247DQo+ICsJCQkJc3QsbWFza19yZXNldDsNCj4gKwkJCQlyZWd1bGF0b3It
aW5pdGlhbC1tb2RlID0gPDg+Ow0KPiArCQkJCXJlZ3VsYXRvci1vdmVyLWN1cnJlbnQtcHJvdGVj
dGlvbjsNCj4gKwkJCX07DQo+ICsNCj4gKwkJCXYzdjM6IGJ1Y2s0IHsNCj4gKwkJCQlyZWd1bGF0
b3ItbmFtZSA9ICJ2M3YzIjsNCj4gKwkJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAw
MDAwPjsNCj4gKwkJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsNCj4gKwkJ
CQlyZWd1bGF0b3ItYWx3YXlzLW9uOw0KPiArCQkJCXJlZ3VsYXRvci1vdmVyLWN1cnJlbnQtcHJv
dGVjdGlvbjsNCj4gKwkJCQlyZWd1bGF0b3ItaW5pdGlhbC1tb2RlID0gPDg+Ow0KPiArCQkJfTsN
Cj4gKw0KPiArCQkJdmRkYTogbGRvMSB7DQo+ICsJCQkJcmVndWxhdG9yLW5hbWUgPSAidmRkYSI7
DQo+ICsJCQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MjkwMDAwMD47DQo+ICsJCQkJcmVn
dWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MjkwMDAwMD47DQo+ICsJCQkJaW50ZXJydXB0cyA9IDxJ
VF9DVVJMSU1fTERPMSAwPjsNCj4gKwkJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbWljPjsNCj4g
KwkJCX07DQo+ICsNCj4gKwkJCXYydjg6IGxkbzIgew0KPiArCQkJCXJlZ3VsYXRvci1uYW1lID0g
InYydjgiOw0KPiArCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDI4MDAwMDA+Ow0KPiAr
CQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDI4MDAwMDA+Ow0KPiArCQkJCWludGVycnVw
dHMgPSA8SVRfQ1VSTElNX0xETzIgMD47DQo+ICsJCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmcG1p
Yz47DQo+ICsJCQl9Ow0KPiArDQo+ICsJCQl2dHRfZGRyOiBsZG8zIHsNCj4gKwkJCQlyZWd1bGF0
b3ItbmFtZSA9ICJ2dHRfZGRyIjsNCj4gKwkJCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDww
MDAwMDAwPjsNCj4gKwkJCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxMDAwMDAwPjsNCj4g
KwkJCQlyZWd1bGF0b3ItYWx3YXlzLW9uOw0KPiArCQkJCXJlZ3VsYXRvci1vdmVyLWN1cnJlbnQt
cHJvdGVjdGlvbjsNCj4gKwkJCX07DQo+ICsNCj4gKwkJCXZkZF91c2I6IGxkbzQgew0KPiArCQkJ
CXJlZ3VsYXRvci1uYW1lID0gInZkZF91c2IiOw0KPiArCQkJCXJlZ3VsYXRvci1taW4tbWljcm92
b2x0ID0gPDMzMDAwMDA+Ow0KPiArCQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAw
MDA+Ow0KPiArCQkJCWludGVycnVwdHMgPSA8SVRfQ1VSTElNX0xETzQgMD47DQo+ICsJCQkJaW50
ZXJydXB0LXBhcmVudCA9IDwmcG1pYz47DQo+ICsJCQl9Ow0KPiArDQo+ICsJCQl2ZGRfc2Q6IGxk
bzUgew0KPiArCQkJCXJlZ3VsYXRvci1uYW1lID0gInZkZF9zZCI7DQo+ICsJCQkJcmVndWxhdG9y
LW1pbi1taWNyb3ZvbHQgPSA8MjkwMDAwMD47DQo+ICsJCQkJcmVndWxhdG9yLW1heC1taWNyb3Zv
bHQgPSA8MjkwMDAwMD47DQo+ICsJCQkJaW50ZXJydXB0cyA9IDxJVF9DVVJMSU1fTERPNSAwPjsN
Cj4gKwkJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbWljPjsNCj4gKwkJCQlyZWd1bGF0b3ItYm9v
dC1vbjsNCj4gKwkJCX07DQo+ICsNCj4gKwkJCXYxdjg6IGxkbzYgew0KPiArCQkJCXJlZ3VsYXRv
ci1uYW1lID0gInYxdjgiOw0KPiArCQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAw
MDA+Ow0KPiArCQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDE4MDAwMDA+Ow0KPiArCQkJ
CWludGVycnVwdHMgPSA8SVRfQ1VSTElNX0xETzYgMD47DQo+ICsJCQkJaW50ZXJydXB0LXBhcmVu
dCA9IDwmcG1pYz47DQo+ICsJCQl9Ow0KPiArDQo+ICsJCQl2cmVmX2RkcjogdnJlZl9kZHIgew0K
PiArCQkJCXJlZ3VsYXRvci1uYW1lID0gInZyZWZfZGRyIjsNCj4gKwkJCQlyZWd1bGF0b3ItYWx3
YXlzLW9uOw0KPiArCQkJCXJlZ3VsYXRvci1vdmVyLWN1cnJlbnQtcHJvdGVjdGlvbjsNCj4gKwkJ
CX07DQo+ICsNCj4gKwkJCWJzdF9vdXQ6IGJvb3N0IHsNCj4gKwkJCQlyZWd1bGF0b3ItbmFtZSA9
ICJic3Rfb3V0IjsNCj4gKwkJCQlpbnRlcnJ1cHRzID0gPElUX09DUF9CT09TVCAwPjsNCj4gKwkJ
CQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbWljPjsNCj4gKwkJCX07DQo+ICsNCj4gKwkJCXZidXNf
b3RnOiBwd3Jfc3cxIHsNCj4gKwkJCQlyZWd1bGF0b3ItbmFtZSA9ICJ2YnVzX290ZyI7DQo+ICsJ
CQkJaW50ZXJydXB0cyA9IDxJVF9PQ1BfT1RHIDA+Ow0KPiArCQkJCWludGVycnVwdC1wYXJlbnQg
PSA8JnBtaWM+Ow0KPiArCQkJCXJlZ3VsYXRvci1hY3RpdmUtZGlzY2hhcmdlOw0KPiArCQkJfTsN
Cj4gKw0KPiArCQkJdmJ1c19zdzogcHdyX3N3MiB7DQo+ICsJCQkJcmVndWxhdG9yLW5hbWUgPSAi
dmJ1c19zdyI7DQo+ICsJCQkJaW50ZXJydXB0cyA9IDxJVF9PQ1BfU1dPVVQgMD47DQo+ICsJCQkJ
aW50ZXJydXB0LXBhcmVudCA9IDwmcG1pYz47DQo+ICsJCQkJcmVndWxhdG9yLWFjdGl2ZS1kaXNj
aGFyZ2U7DQo+ICsJCQl9Ow0KPiArCQl9Ow0KPiArDQo+ICsJCW9ua2V5IHsNCj4gKwkJCWNvbXBh
dGlibGUgPSAic3Qsc3RwbWljMS1vbmtleSI7DQo+ICsJCQlpbnRlcnJ1cHRzID0gPElUX1BPTktF
WV9GIDA+LCA8SVRfUE9OS0VZX1IgMT47DQo+ICsJCQlpbnRlcnJ1cHQtbmFtZXMgPSAib25rZXkt
ZmFsbGluZyIsICJvbmtleS1yaXNpbmciOw0KPiArCQkJc3RhdHVzID0gIm9rYXkiOw0KPiArCQl9
Ow0KPiArDQo+ICsJCXdhdGNoZG9nIHsNCj4gKwkJCWNvbXBhdGlibGUgPSAic3Qsc3RwbWljMS13
ZHQiOw0KPiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gKwkJfTsNCj4gKwl9Ow0KPiArfTsN
Cj4gKw0KPiArJml3ZGcyIHsNCj4gKwl0aW1lb3V0LXNlYyA9IDwzMj47DQo+ICsJc3RhdHVzID0g
Im9rYXkiOw0KPiArfTsNCj4gKw0KPiArJnB3ciB7DQo+ICsJcHdyLXN1cHBseSA9IDwmdmRkPjsN
Cj4gK307DQo+ICsNCj4gKyZybmcxIHsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICt9Ow0KPiAr
DQo+ICsmcnRjIHsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICt9Ow0KPiArDQo+ICsmc2RtbWMx
IHsNCj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiArCXBpbmN0cmwtMCA9IDwmc2Rt
bWMxX2I0X3BpbnNfYSAmc2RtbWMxX2Rpcl9waW5zX2E+Ow0KPiArCWJyb2tlbi1jZDsNCj4gKwlz
dCxzaWctZGlyOw0KPiArCXN0LG5lZy1lZGdlOw0KPiArCXN0LHVzZS1ja2luOw0KPiArCWJ1cy13
aWR0aCA9IDw0PjsNCj4gKwl2bW1jLXN1cHBseSA9IDwmdmRkX3NkPjsNCj4gKwlzdGF0dXMgPSAi
b2theSI7DQo+ICt9Ow0KPiArDQo+ICsmc2RtbWMyIHsNCj4gKwlwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOw0KPiArCXBpbmN0cmwtMCA9IDwmc2RtbWMyX2I0X3BpbnNfYSAmc2RtbWMyX2Q0N19w
aW5zX2E+Ow0KPiArCW5vbi1yZW1vdmFibGU7DQo+ICsJbm8tc2Q7DQo+ICsJbm8tc2RpbzsNCj4g
KwlzdCxuZWctZWRnZTsNCj4gKwlidXMtd2lkdGggPSA8OD47DQo+ICsJdm1tYy1zdXBwbHkgPSA8
JnYzdjM+Ow0KPiArCW1tYy1kZHItM18zdjsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICt9Ow0K
PiArDQo+ICsmc3BpMiB7DQo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwlwaW5j
dHJsLTAgPSA8JnNwaTJfcGluc19hPjsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICt9Ow0KPiAr
DQo+ICsmdWFydDQgew0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3Ry
bC0wID0gPCZ1YXJ0NF9waW5zX2I+Ow0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gK307DQo+ICsN
Cj4gKyZ1YXJ0NyB7DQo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwlwaW5jdHJs
LTAgPSA8JnVhcnQ3X3BpbnNfYT47DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArfTsNCj4gKw0K
PiArJnVzYmhfZWhjaSB7DQo+ICsJcGh5cyA9IDwmdXNicGh5Y19wb3J0MD47DQo+ICsJcGh5LW5h
bWVzID0gInVzYiI7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArfTsNCj4gKw0KPiArJnVzYm90
Z19ocyB7DQo+ICsJZHJfbW9kZSA9ICJwZXJpcGhlcmFsIjsNCj4gKwlwaHlzID0gPCZ1c2JwaHlj
X3BvcnQxIDA+Ow0KPiArCXBoeS1uYW1lcyA9ICJ1c2IyLXBoeSI7DQo+ICsJc3RhdHVzID0gIm9r
YXkiOw0KPiArfTsNCj4gKw0KPiArJnVzYnBoeWMgew0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4g
K307DQo+ICsNCj4gKyZ1c2JwaHljX3BvcnQwIHsNCj4gKwlwaHktc3VwcGx5ID0gPCZ2ZGRfdXNi
PjsNCj4gK307DQo+ICsNCj4gKyZ1c2JwaHljX3BvcnQxIHsNCj4gKwlwaHktc3VwcGx5ID0gPCZ2
ZGRfdXNiPjsNCj4gK307DQo+IGRpZmYgLS1naXQgYS9ib2FyZC9zdC9zdG0zMm1wMS9SRUFETUUg
Yi9ib2FyZC9zdC9zdG0zMm1wMS9SRUFETUUNCj4gaW5kZXggMWNkMzUzNGFlNGUuLmIwYzgzMjUw
NjEyIDEwMDY0NA0KPiAtLS0gYS9ib2FyZC9zdC9zdG0zMm1wMS9SRUFETUUNCj4gKysrIGIvYm9h
cmQvc3Qvc3RtMzJtcDEvUkVBRE1FDQo+IEBAIC0zNyw2ICszNyw3IEBAIEN1cnJlbnRseSB0aGUg
Zm9sbG93aW5nIGJvYXJkcyBhcmUgc3VwcG9ydGVkOg0KPiAgKyBzdG0zMm1wMTU3Yy1lZDENCj4g
ICsgc3RtMzJtcDE1N2EtZGsxDQo+ICArIHN0bTMybXAxNTdjLWRrMg0KPiArKyBzdG0zMm1wMTU3
YS1hdmVuZ2VyOTYNCj4gIA0KPiAgMy4gQm9vdCBTZXF1ZW5jZXMNCj4gID09PT09PT09PT09PT09
PT09DQo+IEBAIC04NCw2ICs4NSw5IEBAIHRoZSBzdXBwb3J0ZWQgZGV2aWNlIHRyZWVzIGZvciBz
dG0zMm1wMTU3IGFyZToNCj4gICsgZGsyOiBEaXNjb3ZlcnkgYm9hcmQgPSBkazEgd2l0aCBhIEJU
L1dpRkkgY29tYm8gYW5kIGEgRFNJIHBhbmVsDQo+ICAgIGR0czogc3RtMzJtcDE1N2MtZGsyDQo+
ICANCj4gKysgYXZlbmdlcjk2OiBBdmVuZ2VyOTYgYm9hcmQgZnJvbSBBcnJvdyBFbGVjdHJvbmlj
cw0KPiArICBkdHM6IHN0bTMybXAxNTdhLWF2ZW5nZXI5Ng0KPiArDQo+ICA1LiBCdWlsZCBQcm9j
ZWR1cmUNCj4gID09PT09PT09PT09PT09PT09PQ0KPiAgDQo+IEBAIC0xNDAsNiArMTQ0LDExIEBA
IHRoZSBzdXBwb3J0ZWQgZGV2aWNlIHRyZWVzIGZvciBzdG0zMm1wMTU3IGFyZToNCj4gIAkjIG1h
a2Ugc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZw0KPiAgCSMgbWFrZSBERVZJQ0VfVFJFRT1zdG0z
Mm1wMTU3Yy1kazIgYWxsDQo+ICANCj4gKyAgZCkgYmFzaWMgYm9vdCBvbiBhdmVuZ2VyOTYNCj4g
KwkjIGV4cG9ydCBLQlVJTERfT1VUUFVUPXN0bTMybXAxNV9iYXNpYw0KPiArCSMgbWFrZSBzdG0z
Mm1wMTVfYmFzaWNfZGVmY29uZmlnDQo+ICsJIyBtYWtlIERFVklDRV9UUkVFPXN0bTMybXAxNTdh
LWF2ZW5nZXI5NiBhbGwNCj4gKw0KPiAgNi4gT3V0cHV0IGZpbGVzDQo+ICANCj4gICAgQm9vdFJv
bSBhbmQgVEYtQSBleHBlY3QgYmluYXJpZXMgd2l0aCBTVE0zMiBpbWFnZSBoZWFkZXINCj4gQEAg
LTE4Miw2ICsxOTEsMjAgQEAgWW91IGNhbiBzZWxlY3QgdGhlIGJvb3QgbW9kZSwgb24gdGhlIGJv
YXJkIGVkMSB3aXRoIHRoZSBzd2l0Y2ggU1cxDQo+ICAgIFNELUNhcmQJMSAgICAgIDENCj4gICAg
UmVjb3ZlcnkJMCAgICAgIDANCj4gIA0KPiArLSBCb290IG1vZGUgb2YgQXZlbmdlcjk2IGNhbiBi
ZSBzZWxlY3RlZCB1c2luZyBzd2l0Y2ggUzMNCj4gKw0KPiArIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ICsgIEJvb3QgTW9kZSAgIEJPT1QyICAgQk9PVDEgICBCT09UMA0K
PiArIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsgIFJlY292ZXJ5CTAJ
MAkwDQo+ICsgIE5PUgkJMAkwCTENCj4gKyAgU0QtQ2FyZAkxCTAJMQ0KPiArICBlTU1DCQkwCTEJ
MA0KPiArICBOQU5ECQkwCTEJMQ0KPiArICBSZXNlcnZlZAkxCTAJMA0KPiArICBSZWNvdmVyeQkx
CTEJMA0KPiArICBTRC1DYXJkCTEJMQkxDQo+ICsNCj4gIFJlY292ZXJ5IGlzIGEgYm9vdCBmcm9t
IHNlcmlhbCBsaW5rIChVQVJUL1VTQikgYW5kIGl0IGlzIHVzZWQgd2l0aA0KPiAgU1RNMzJDdWJl
UHJvZ3JhbW1lciB0b29sIHRvIGxvYWQgZXhlY3V0YWJsZSBpbiBSQU0gYW5kIHRvIHVwZGF0ZSB0
aGUgZmxhc2gNCj4gIGRldmljZXMgYXZhaWxhYmxlIG9uIHRoZSBib2FyZCAoTk9SL05BTkQvZU1N
Qy9TRENBUkQpLg0KPiANCg0KUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQHN0LmNvbT4NCg0KVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
