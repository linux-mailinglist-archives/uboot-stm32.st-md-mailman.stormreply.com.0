Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7768E0435
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2019 14:53:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6052C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2019 12:53:59 +0000 (UTC)
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D5C7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2019 12:53:58 +0000 (UTC)
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id EF15D7CD87E;
 Tue, 22 Oct 2019 14:53:50 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 22 Oct
 2019 14:53:50 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Tue, 22 Oct 2019 14:53:50 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Jagan Teki <jagan@amarulasolutions.com>
Thread-Topic: [U-Boot] [PATCH 2/3] stm32mp1: configs: Add
 CONFIG_SPL_SPI_FLASH_MTD
Thread-Index: AQHVaoSy12LfEaTQNUKdlZQmpgzfaKddiHeAgADs/ICACEN7gA==
Date: Tue, 22 Oct 2019 12:53:50 +0000
Message-ID: <fc9cb551-87ab-a8ce-c719-c7fc498c13da@kontron.de>
References: <20190913224242.21054-1-frieder.schrempf@kontron.de>
 <20190913224242.21054-2-frieder.schrempf@kontron.de>
 <CAMty3ZCZgL4wrZpwXcPLZAaGzG2uMHs2zftoPkjSV8b2geNw8g@mail.gmail.com>
 <7dc4a580-c49f-7371-56f2-a2d56198a060@kontron.de>
In-Reply-To: <7dc4a580-c49f-7371-56f2-a2d56198a060@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <8D15291309D24B44B15C160F92BD221A@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: EF15D7CD87E.A080A
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: jagan@amarulasolutions.com, lukma@denx.de,
 patrick.delaunay@st.com, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
X-Spam-Status: No
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, "lukma@denx.de" <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 2/3] stm32mp1: configs: Add
 CONFIG_SPL_SPI_FLASH_MTD
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

SGkgSmFnYW4sDQoNCk9uIDE3LjEwLjE5IDA4OjQyLCBGcmllZGVyIFNjaHJlbXBmIHdyb3RlOg0K
PiBIaSBKYWdhbiwNCj4gDQo+IE9uIDE2LjEwLjE5IDE4OjM0LCBKYWdhbiBUZWtpIHdyb3RlOg0K
Pj4gT24gU2F0LCBTZXAgMTQsIDIwMTkgYXQgNDoxOCBBTSBTY2hyZW1wZiBGcmllZGVyDQo+PiA8
ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPiB3cm90ZToNCj4+Pg0KPj4+IEZyb206IEZyaWVk
ZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4NCj4+Pg0KPj4+IEFzIFNQ
SV9GTEFTSF9NVEQgaXMgdXNlZCBpbiBTUEwgYW5kIFUtQm9vdCBwcm9wZXIsIHdlIGVuYWJsZSBi
b3RoLA0KPj4+IG5vdyB0aGF0IGEgc2VwYXJhdGUgb3B0aW9uIGZvciBTUEwgd2FzIGludHJvZHVj
ZWQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNj
aHJlbXBmQGtvbnRyb24uZGU+DQo+Pj4gLS0tDQo+Pj4gwqAgY29uZmlncy9zdG0zMm1wMTVfYmFz
aWNfZGVmY29uZmlnIHwgMyArKy0NCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9zdG0zMm1w
MTVfYmFzaWNfZGVmY29uZmlnIA0KPj4+IGIvY29uZmlncy9zdG0zMm1wMTVfYmFzaWNfZGVmY29u
ZmlnDQo+Pj4gaW5kZXggMDk3ODViNWRjMS4uMzkwMzE5NjU3ZiAxMDA2NDQNCj4+PiAtLS0gYS9j
b25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWcNCj4+PiArKysgYi9jb25maWdzL3N0bTMy
bXAxNV9iYXNpY19kZWZjb25maWcNCj4+PiBAQCAtNywxMCArNywxMCBAQCBDT05GSUdfVEFSR0VU
X1NUTTMyTVAxPXkNCj4+PiDCoCBDT05GSUdfU1BMX1NQSV9GTEFTSF9TVVBQT1JUPXkNCj4+PiDC
oCBDT05GSUdfU1BMX1NQSV9TVVBQT1JUPXkNCj4+PiDCoCAjIENPTkZJR19BUk1WN19WSVJUIGlz
IG5vdCBzZXQNCj4+PiArQ09ORklHX1NQTF9URVhUX0JBU0U9MHgyRkZDMjUwMA0KPj4+IMKgIENP
TkZJR19ESVNUUk9fREVGQVVMVFM9eQ0KPj4+IMKgIENPTkZJR19GSVQ9eQ0KPj4+IMKgIENPTkZJ
R19CT09UQ09NTUFORD0icnVuIGJvb3RjbWRfc3RtMzJtcCINCj4+PiAtQ09ORklHX1NQTF9URVhU
X0JBU0U9MHgyRkZDMjUwMA0KPj4NCj4+IFVucmVsYXRlZCBjaGFuZ2Ugd3J0IHRvIGNvbW1pdCBt
ZXNzYWdlPw0KPiANCj4gWWVzLCB0aGlzIGlzIHVucmVsYXRlZCwgYnV0IHRoYXQncyB3aGF0ICdt
ZW51Y29uZmlnJyBhbmQgJ3NhdmVkZWZjb25maWcnIA0KPiBnYXZlIG1lIGFzIG91dHB1dC4gU28g
SSB3b3VsZCB0aGluayBpdCdzIG9rLiBJZiB5b3UgZG9uJ3QgdGhpbmsgc28sIGZlZWwgDQo+IGZy
ZWUgdG8gcmVtb3ZlIHRoaXMgY2hhbmdlIG9yIGxldCBtZSBrbm93IGlmIEkgc2hvdWxkIHJlbW92
ZSBpdC4NCg0KSW4gcGF0Y2h3b3JrIGFsbCB0aHJlZSBwYXRjaGVzIG9mIHRoaXMgc2VyaWVzIGFy
ZSBtYXJrZWQgd2l0aCAiQ2hhbmdlcyANClJlcXVlc3RlZCIuIENhbiB5b3UgcGxlYXNlIGxldCBt
ZSBrbm93IHdoYXQgbmVlZHMgdG8gYmUgZml4ZWQ/DQoNClRoYW5rcywNCkZyaWVkZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFp
bGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIK
