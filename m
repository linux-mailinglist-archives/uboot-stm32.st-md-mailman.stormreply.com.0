Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 621A91B5C9D
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Apr 2020 15:32:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23B37C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Apr 2020 13:32:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6ABBFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 13:32:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NDSUl6025560
 for <uboot-stm32@st-md-mailman.stormreply.com>; Thu, 23 Apr 2020 15:32:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=KmiGelEJXZIZN4YW52+QHCLRycvRJ3UupJdw21qg26s=;
 b=oeDAXuKUDwnBmEX1oxoi6gTIeV2enp0ix5cBoK7O+Tsc87pnmQR9MDtEQHLanp1wd6+k
 zkKX+IFmIx2sanYnct2LqsE+UwmQFDJnf0AKvoVtRreUJpoUHiVPde4HN5p/ahY1Con+
 ROzwCyxgghg4YCec+R30L8robbroOzSlyBfnuPQHEkyKVq4KR825RCBMPTb1hB9nzLgG
 VgpkTG7Fue1o5XY54mc4trhhiFEzk6mFqFnZ3xlZzRQythaoQ0ofp30b+4AKj7veNyWL
 Bo3dhPSdILozi4RHr05fc8SvTEFbk32Xrs5gR+VI9pi+Fghb61tNF4A48VrBCfVAMwqb pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fregw2xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Thu, 23 Apr 2020 15:32:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D858D100034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 15:32:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCED82BF9A5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 15:32:07 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 15:32:07 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Apr 2020 15:32:07 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [Uboot-stm32] [PATCH v1 2/2] cmd: bind: allow to bind driver
 with driver data
Thread-Index: AQHWGXOVoKhbHDFf9keQ8aLWc7lXiA==
Date: Thu, 23 Apr 2020 13:32:07 +0000
Message-ID: <d2cb3b39-60c0-f1bf-2819-0f95ca0d197f@st.com>
References: <20200421140840.25729-1-patrice.chotard@st.com>
 <20200421140840.25729-3-patrice.chotard@st.com>
 <CAPnjgZ2h+xuUshDeUCtGQu81oHJ+poproR1B4oXiuS=yFzA-Yw@mail.gmail.com>
 <7f7534e9-5351-c6de-8784-a62d284d6d0b@st.com>
 <CAPnjgZ1=DVA_g2Os4Ur2Z4hiJTq7ULBw=x0C-d4GBvnuAyOH2Q@mail.gmail.com>
In-Reply-To: <CAPnjgZ1=DVA_g2Os4Ur2Z4hiJTq7ULBw=x0C-d4GBvnuAyOH2Q@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <DA317B6DDBD11E48AE7BCE7C2176AE9E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_10:2020-04-23,
 2020-04-23 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] cmd: bind: allow to bind driver
 with driver data
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

SGkgU2ltb24NCg0KT24gNC8yMi8yMCA2OjMyIFBNLCBTaW1vbiBHbGFzcyB3cm90ZToNCj4gSGkg
UGF0cmljZSwNCj4NCj4gT24gV2VkLCAyMiBBcHIgMjAyMCBhdCAwMjoxMywgUGF0cmljZSBDSE9U
QVJEIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPiB3cm90ZToNCj4+DQo+PiBPbiA0LzIxLzIwIDc6
MzYgUE0sIFNpbW9uIEdsYXNzIHdyb3RlOg0KPj4+IEhpIFBhdHJpY2UsDQo+Pj4NCj4+PiBPbiBU
dWUsIDIxIEFwciAyMDIwIGF0IDA4OjA5LCBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFy
ZEBzdC5jb20+IHdyb3RlOg0KPj4+PiBJbml0aWFsIGltcGxlbWVudGF0aW9uIGludm9rZXMgZGV2
aWNlX2JpbmRfd2l0aF9kcml2ZXJfZGF0YSgpDQo+Pj4+IHdpdGggZHJpdmVyX2RhdGEgcGFyYW1l
dGVyIGVxdWFsIHRvIDAuDQo+Pj4+IEZvciBkcml2ZXIgd2l0aCBkcml2ZXIgZGF0YSwgdGhlIGJp
bmQgY29tbWFuZCBjYW4ndCBiaW5kDQo+Pj4+IGNvcnJlY3RseSB0aGlzIGRyaXZlciBvciBldmVu
IHdvcnNlIGNhdXNlcyBkYXRhIGFib3J0Lg0KPj4+Pg0KPj4+PiBBZGQgZmluZF91ZGV2aWNlX2lk
KCkgdG8gcGFyc2UgdGhlIGRyaXZlcidzIG9mX21hdGNoIGxpc3QNCj4+Pj4gYW5kIHJldHVybiB0
aGUgZW50cnkgY29ycmVzcG9uZGluZyB0byB0aGUgZHJpdmVyIGNvbXBhdGlibGUgc3RyaW5nLg0K
Pj4+PiBUaGlzIGFsbG93cyB0byBnZXQgYWNjZXNzIHRvIGRyaXZlcl9kYXRhIGFuZCB0byB1c2Ug
aXQgYXMNCj4+Pj4gcGFyYW1ldGVycyBvZiBkZXZpY2VfYmluZF93aXRoX2RyaXZlcl9kYXRhKCku
DQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90
YXJkQHN0LmNvbT4NCj4+Pj4gQ2M6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNv
bT4NCj4+Pj4NCj4+Pj4gLS0tDQo+Pj4+DQo+Pj4+ICBjbWQvYmluZC5jIHwgMjkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0NCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+DQo+Pj4gVGhlIHRoaW5nIEkgZG9uJ3QgcXVpdGUgZ2V0
IGhlcmUgaXMgd2h5IHRoZSBkcml2ZXIgbmFtZSBuZWVkcyB0byBiZQ0KPj4+IHNwZWNpZmllZC4g
SWYgdGhlIGRldmljZSB0cmVlIG5vZGUgaXMgcHJlc2VudCwgYW5kIGl0IGhhcyBhIGNvbXBhdGli
bGUNCj4+IFNvcnJ5LCBpIGRpZG4ndCBnZXQgeW91ciBwb2ludCB3aGVuIHlvdSBzYWlkICJ3aHkg
dGhlIGRyaXZlciBuYW1lIG5lZWRzIHRvIGJlIHNwZWNpZmllZCINCj4gSXQncyBqdXN0IHRoYXQg
SSBkb24ndCB1bmRlcnN0YW5kIGl0IGF0IGFsbC4gSWYgdGhlIGNvbXBhdGlibGUgc3RyaW5nDQo+
IGlzIGF2YWlsYWJsZSwgd2h5IG5vdCB1c2UgbGlzdHNfYmluZF9mZHQoKT8NCg0KT2sgaSBnb3Qg
aXQgIcKgIFNvcnJ5IGkgd2FzIHRvbyBtdWNoIGZvY3VzZWQgb24gZGV2aWNlX2JpbmRfd2l0aF9k
cml2ZXJfZGF0YSgpIHVzYWdlIDstKQ0KDQpZZXMgeW91IGFyZSByaWdodCwgbGlzdF9iaW5kX2Zk
dCgpIG11c3QgYmUgdXNlZCBoZXJlIHRvIHNvbHZlIHRoZSBpc3N1ZS4NCg0KSSB3aWxsIHJlcG9z
dCB3aXRoIGxpc3RzX2JpbmRfZmR0KCkgdXNhZ2UgLg0KDQo+DQo+PiBXaGljaCBwYXJ0IG9mIHRo
aXMgcGF0Y2ggZG8geW91IG1hZGUgcmVmZXJlbmNlIHRvID8NCj4gVGhlIHdob2xlIHRoaW5nLCBi
ZWNhdXNlIEkganVzdCBkb24ndCB1bmRlcnN0YW5kIHRoZSBiaW5kIGNvbW1hbmQuDQo+DQo+Pj4g
c3RyaW5nLCBjYW4ndCBETSBmaW5kIHRoZSBkcml2ZXIgYW5kIGJpbmQgYSBkZXZpY2UgYXV0b21h
dGljYWxseT8NCj4+Pg0KPj4+IEFsc28sIGlzIHRoZXJlIGFueSBkb2NzIGZvciB0aGlzIGNvbW1h
bmQ/IEl0IHdvdWxkIGJlIGdvb2QgdG8gYWRkIHRvDQo+PiBJcyB3aGF0IGluIGNtZC9iaW5kLmMg
bm90IGVub3VnaCA/DQo+IEkgYW0ganVzdCBjb25mdXNlZCBoZXJlLiBZb3Ugb2J2aW91c2x5IGhh
dmUgYSB1c2UgY2FzZSBpbiBtaW5kLCBidXQNCj4gdGhlIGhlbHAgYmVsb3cgaXMgbm90IHN1ZmZp
Y2llbnQgdG8gdW5kZXJzdGFuZCB3aGF0IGlzIGdvaW5nIG9uLiBBcyBJDQo+IHNhaWQsIGlmIHlv
dSBoYXZlIGEgZGV2aWNlLXRyZWUgbm9kZSB5b3UgY2FuIGZpbmQgdGhlIGRyaXZlci4gSSBhbQ0K
PiBqdXN0IG5vdCBzdXJlIHdoYXQgdGhpcyBpcyBmb3IuDQpTb3JyeSwgaSB3YXMgbm90IGNsZWFy
IGVub3VnaCBpbiB0aGUgcmVhc29uIG9mIHRoaXMgcGF0Y2guDQoNCkZvciBkZWJ1ZyBwdXJwb3Nl
IG9uIFNUTTMyTVAxIHBsYXRmb3JtLCBpIG5lZWRlZCB0byB1bmJpbmQvYmluZCB0aGUgZXRoZXJu
ZXQgZHJpdmVyIChkd2NfZXRoX3Fvcy5jKS4NCg0KVGhpcyBkcml2ZXIgaXMgdXNpbmcgZHJpdmVy
IGRhdGEgYXMgc2hvd24gYmVsb3c6DQoNCnN0YXRpYyBjb25zdCBzdHJ1Y3QgdWRldmljZV9pZCBl
cW9zX2lkc1tdID0gew0KwqDCoMKgIHsNCsKgwqDCoCDCoMKgwqAgLmNvbXBhdGlibGUgPSAibnZp
ZGlhLHRlZ3JhMTg2LWVxb3MiLA0KwqDCoMKgIMKgwqDCoCAuZGF0YSA9ICh1bG9uZykmZXFvc190
ZWdyYTE4Nl9jb25maWcNCsKgwqDCoCB9LA0KwqDCoMKgIHsNCsKgwqDCoCDCoMKgwqAgLmNvbXBh
dGlibGUgPSAic25wcyxkd21hYy00LjIwYSIsDQrCoMKgwqAgwqDCoMKgIC5kYXRhID0gKHVsb25n
KSZlcW9zX3N0bTMyX2NvbmZpZw0KwqDCoMKgIH0sDQoNCsKgwqDCoCB7IH0NCn07DQoNCkFmdGVy
IHVuYmluZGluZy9iaW5kaW5nIHRoaXMgZHJpdmVyIGFuZCBwcm9iaW5nIGl0ICh3aXRoIHRoZSBk
aGNwIGNvbW1hbmQgKSwgd2UgZ290IGEgcHJlZmV0Y2ggYWJvcnQgYXMgYmVsb3c6DQoNClNUTTMy
TVA+IHVuYmluZCBldGggZXRoZXJuZXRANTgwMGEwMDANClNUTTMyTVA+IGJpbmQgL3NvYy9ldGhl
cm5ldEA1ODAwYTAwMCBldGhfZXFvcw0KU1RNMzJNUD4gZGhjcA0KcHJlZmV0Y2ggYWJvcnQNCnBj
IDogWzw0MzEwODAxYz5dwqDCoMKgwqDCoMKgwqDCoMKgIGxyIDogWzxmZmM4ZjRhZD5dDQpyZWxv
YyBwYyA6IFs8MDM1YmEwMWM+XcKgwqDCoCBsciA6IFs8YzAxNDE0YWQ+XQ0Kc3AgOiBmZGFmMTli
MMKgIGlwIDogZmZjZWE4M2PCoMKgwqDCoCBmcCA6IDAwMDAwMDAxDQpyMTA6IGZmY2ZkNGEwwqAg
cjkgOiBmZGFmZmVkMMKgwqDCoMKgIHI4IDogMDAwMDAwMDANCnI3IDogZmZjZmYzMDTCoCByNiA6
IGZkYzYzMjIwwqDCoMKgwqAgcjUgOiAwMDAwMDAwMMKgIHI0IDogZmRjNWIxMDgNCnIzIDogNDMx
MDgwMjDCoCByMiA6IDAwMDAzZDM5wqDCoMKgwqAgcjEgOiBmZmNlYTU0NMKgIHIwIDogZmRjNjMy
MjANCkZsYWdzOiBuWkN2wqAgSVJRcyBvZmbCoCBGSVFzIG9mZsKgIE1vZGUgU1ZDXzMyDQpDb2Rl
OiBkYXRhIGFib3J0DQpwYyA6IFs8ZmZjNGY5YzA+XcKgwqDCoMKgwqDCoMKgwqDCoCBsciA6IFs8
ZmZjNGY5YWQ+XQ0KcmVsb2MgcGMgOiBbPGMwMTAxOWMwPl3CoMKgwqAgbHIgOiBbPGMwMTAxOWFk
Pl0NCnNwIDogZmRhZjE4YjjCoCBpcCA6IDAwMDAwMDAwwqDCoMKgwqAgZnAgOiAwMDAwMDAwMQ0K
cjEwOiBmZmNkNjliMsKgIHI5IDogZmRhZmZlZDDCoMKgwqDCoCByOCA6IGZmY2Q2OWFhDQpyNyA6
IDAwMDAwMDAwwqAgcjYgOiAwMDAwMDAwOMKgwqDCoMKgIHI1IDogNDMxMDgwMWPCoCByNCA6IGZm
ZmZmZmZjDQpyMyA6IDAwMDAwMDAxwqAgcjIgOiAwMDAwMDAyOMKgwqDCoMKgIHIxIDogMDAwMDAw
MDDCoCByMCA6IDAwMDAwMDA2DQpGbGFnczogTnpDdsKgIElSUXMgb27CoCBGSVFzIG9uwqAgTW9k
ZSBTVkNfMzIgKFQpDQpDb2RlOiAyZjAwIGQxZTkgMmMwMCBkY2U5IChmODU1KSAyMDI0DQpSZXNl
dHRpbmcgQ1BVIC4uLg0KDQpUaGlzIHdhcyBkdWUgdG8gdGhlIGZhY3QgdGhhdCwgY3VycmVudGx5
IGJpbmQgY29tbWFuZCBpcyBwYXNzaW5nIDAgYXMgZHJpdmVyX2RhdGEgcGFyYW1ldGVyIHRvIGRl
dmljZV9iaW5kX3dpdGhfZHJpdmVyX2RhdGEoKQ0KDQp3aGljaCB3YXMgbm90IGNvcnJlY3QgYW5k
IGNhbid0IGFsbG93IHRoZSBkd2NfZXRoX3FvcyBkcml2ZXIgdG8gYmUgcHJvYmVkIHdpdGggaXRz
IGNvcnJlY3QgZHJpdmVyIGRhdGEuDQoNClBhdHJpY2UNCg0KDQo+IEl0IGNvdWxkIHJlYWxseSB1
c2UgYSBzaG9ydCBkb2N1bWVudCBhcyBJIHNhaWQsIHRvIGV4cGxhaW4gdGhlIHVzZXMgb2YNCj4g
dGhpcyBjb21tYW5kIGFuZCB3aGF0IGl0IGRvZXMgaW4gYSBiaXQgbW9yZSBkZXRhaWwuDQoNCj4N
Cj4+DQo+PiBVX0JPT1RfQ01EKA0KPj4gICAgIGJpbmQsICAgIDQsICAgIDAsICAgIGRvX2JpbmRf
dW5iaW5kLA0KPj4gICAgICJCaW5kIGEgZGV2aWNlIHRvIGEgZHJpdmVyIiwNCj4+ICAgICAiPG5v
ZGUgcGF0aD4gPGRyaXZlcj5cbiINCj4+ICAgICAiYmluZCA8Y2xhc3M+IDxpbmRleD4gPGRyaXZl
cj5cbiINCj4+ICk7DQo+Pg0KPj4gVV9CT09UX0NNRCgNCj4+ICAgICB1bmJpbmQsICAgIDQsICAg
IDAsICAgIGRvX2JpbmRfdW5iaW5kLA0KPj4gICAgICJVbmJpbmQgYSBkZXZpY2UgZnJvbSBhIGRy
aXZlciIsDQo+PiAgICAgIjxub2RlIHBhdGg+XG4iDQo+PiAgICAgInVuYmluZCA8Y2xhc3M+IDxp
bmRleD5cbiINCj4+ICAgICAidW5iaW5kIDxjbGFzcz4gPGluZGV4PiA8ZHJpdmVyPlxuIg0KPj4g
KTsNCj4+DQo+Pg0KPj4+IGRvYy9kcml2ZXItbW9kZWwgYW5kIGFsc28gYWRkIGEgc2ltcGxlIHRl
c3QuDQo+PiBPayBpIHdpbGwgYWRkIGFuIGFkZGl0aW9ubmFsIHRlc3QgdG8gdGVzdC9weS90ZXN0
cy90ZXN0X2JpbmQucHkNCj4gT0sgdGhhbmtzLg0KPg0KPiBSZWdhcmRzLA0KPiBTSW1vbg0KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QNCj4gVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQ0KPiBodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby91Ym9vdC1zdG0zMgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
