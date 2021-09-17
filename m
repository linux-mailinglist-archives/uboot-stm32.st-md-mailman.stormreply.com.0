Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346640F99B
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Sep 2021 15:53:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAC8EC5A4F8;
	Fri, 17 Sep 2021 13:53:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AE4CC5A4F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Sep 2021 13:53:09 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6FBDB83217;
 Fri, 17 Sep 2021 15:53:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1631886789;
 bh=3nWFZaTV2LjY/GeKeeLTPRdw89cz+RLujN4q7lMJ9Ts=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CJw6v5IP8lZdnbTLmsXHIOcNqCUnydqIqFaQks7O/xwtPr0wLKP5FXKILi418bjFj
 gP5di/DEJAA5i8afe1Wfm4fdTwEgocvG9iUli/2bgvru9TaQ1pO0u+K4yA6tfZhsiA
 mlDLb88swLBvRb0tJEivrpxvkjLkLX9OKBw2UrQMUbNEUrrE5PnVEp33KyUCHxHmBo
 0x+3eNa07t9eW4Ij8Qxb5N6gvk9gsNxstcCf7658MiN+ua8XU3tsU69f+Mb0oXvSPh
 8NXu6oxU+jqtCswdWQE8RFntQfpT1hFAyKXMPumr8GCeQekm5iRiz14LBY67bWchF7
 FF2hyrQRsz/PQ==
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
 <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
 <5dfd98da-2efd-23e2-64db-ec41dc9b6c6a@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <8344dd03-b847-8fef-be30-68cff2bc78a9@denx.de>
Date: Fri, 17 Sep 2021 15:39:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5dfd98da-2efd-23e2-64db-ec41dc9b6c6a@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v3 2/2] mtd: spi: nor: force mtd name to
	"nor%d"
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

T24gOS8xNy8yMSAzOjA2IFBNLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpIE1hcmVrLAo+
IAo+ICA+IE1hcmVrIFZhc3V0U2VwdC4gMTYsIDIwMjEsIDU6MjcgcC5tLiBVVEMgfCAjMwo+ICA+
IE9uIDkvMTYvMjEgNDowMSBQTSwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPiAKPiAgPiBbLi4u
XQo+IAo+ICA+ID4gQEAgLTM2NjQsNiArMzY2NiwxMSBAQCBpbnQgc3BpX25vcl9zY2FuKHN0cnVj
dCBzcGlfbm9yICpub3IpCj4gID4gPsKgwqAgwqDCoMKgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0g
Jm5vci0+bXRkOwo+ICA+ID7CoMKgIMKgwqDCoCBzdHJ1Y3Qgc3BpX3NsYXZlICpzcGkgPSBub3It
PnNwaTsKPiAgPiA+wqDCoCDCoMKgwqAgaW50IHJldDsKPiAgPiA+ICvCoMKgwqAgaW50IGNmaV9t
dGRfbmIgPSAwOwo+ICA+ID4gKwo+ICA+ID4gKyNpZmRlZiBDT05GSUdfU1lTX01BWF9GTEFTSF9C
QU5LUwo+ICA+ID4gK8KgwqDCoCBjZmlfbXRkX25iID0gQ09ORklHX1NZU19NQVhfRkxBU0hfQkFO
S1M7Cj4gID4gPiArI2VuZGlmCj4gCj4gID4gQXJlIHdlIGNvdmVyaW5nIGFsbCB0aGUgTk9ScyAo
SEYgYW5kIGNvLikgd2l0aCB0aGlzID8KPiAKPiAKPiBZZXMsIGV4Y2VwdCBpZiBJIG1pc3Mgc29t
ZXRoaW5nCj4gCj4gCj4gYW55IE5PUiAoaW5jbHVkaW5nIGh5cGVyZmxhc2gpIHdpY2ggdXNlIHRo
ZSBDRkkgaW50ZXJmYWNlIC8gCj4gQ09ORklHX0ZMQVNIX0NGSV9NVEQKPiAKPiBkZWZpbmUgdGhl
IHRoZSAnbm9yJWQnIG5hbWUgd2l0aCB0aGUgY2FsbGluZyBzdGFjazoKClllcwoKPiBpbml0cl9m
bGFzaCgpCj4gCj4gPT4gZmxhc2hfaW5pdCgpCj4gCj4gPT0+IGNmaV9mbGFzaF9pbml0X2RtKCkK
PiAKPiA9PT4gY2ZpX210ZF9pbml0KCnCoMKgICJub3IlZCIgd2ljaCB1c2UgbG9vcCBvbiBDT05G
SUdfU1lTX01BWF9GTEFTSF9CQU5LUwo+IAo+IAo+IEkgaGF2ZSBvbmx5IG9uZSBjb25jZXJuIHRv
ZGF5Li4uCj4gCj4gCj4gaWYgb25lIGNmaSBiYW5rIGlzIG1pc3NpbmcgKG5vdCBhY3RpdmF0ZWQg
aW4gRFQgYnkgZXhhbXBsZSkKPiAKPiBhbmQgQ09ORklHX1NZU19NQVhfRkxBU0hfQkFOS1NfREVU
RUNUIGlzIG5vdCBhY3RpdmF0ZWQKPiAKPiBzb21lIGhvbGVzIGNhbiBiZSBkb25lIGluIGluZGV4
Cj4gCj4gCj4gZXhhbXBsZToKPiAKPiB3aXRoIENPTkZJR19TWVNfTUFYX0ZMQVNIX0JBTktTID0g
MiBidXQgd2l0aCBvbmx5IG9uZSBOT1Igb24gdGhlIGJvYXJkCj4gCj4gPT4gIm5vcjEiIGlzIGFi
c2VudCBhbmQgd2UgaGF2ZSBvbmx5IDIgTVREIGRldmljZSBuYW1lZCAibm9yIgo+IAo+IC0gIm5v
cjAiID0+IE5PUiBvciBIRiwgZmlyc3QgQ0ZJIGJhbmsKPiAKPiAtICJub3IyIiA9PiBTUEktTk9S
IChmaXJzdCkKPiAKPiAKPiBidXQgSSBkb24ndCB0aGluayB0aGF0IGl0IGlzIGJsb2NraW5nCgpX
YXNuJ3QgdGhlIG9sZCBiZWhhdmlvciBleGFjdGx5IHRoZSBzYW1lIGFueXdheSA/Cgo+ICA+ID7C
oMKgIMKgwqDCoCAvKiBSZXNldCBTUEkgcHJvdG9jb2wgZm9yIGFsbCBjb21tYW5kcy4gKi8KPiAg
PiA+wqDCoCDCoMKgwqAgbm9yLT5yZWdfcHJvdG8gPSBTTk9SX1BST1RPXzFfMV8xOwo+ICA+ID4g
QEAgLTM3MTUsOCArMzcyMiwxMCBAQCBpbnQgc3BpX25vcl9zY2FuKHN0cnVjdCBzcGlfbm9yICpu
b3IpCj4gID4gPsKgwqAgwqDCoMKgIGlmIChyZXQpCj4gID4gPsKgwqAgwqDCoMKgIMKgwqDCoCBy
ZXR1cm4gcmV0Owo+ICA+ID4KPiAgPiA+IC3CoMKgwqAgaWYgKCFtdGQtPm5hbWUpCj4gID4gPiAt
wqDCoMKgIMKgwqDCoCBtdGQtPm5hbWUgPSBpbmZvLT5uYW1lOwo+ICA+ID4gK8KgwqDCoCBpZiAo
IW10ZC0+bmFtZSkgewo+ICA+ID4gK8KgwqDCoCDCoMKgwqAgc3ByaW50Zihub3ItPm10ZF9uYW1l
LCAibm9yJWQiLMKgIGNmaV9tdGRfbmIgKyAKPiBkZXZfc2VxKG5vci0+ZGV2KSk7Cj4gID4gPiAr
wqDCoMKgIMKgwqDCoCBtdGQtPm5hbWUgPSBub3ItPm10ZF9uYW1lOwo+ICA+ID4gK8KgwqDCoCB9
Cj4gID4gPsKgwqAgwqDCoMKgIG10ZC0+ZGV2ID0gbm9yLT5kZXY7Cj4gID4gPsKgwqAgwqDCoMKg
IG10ZC0+cHJpdiA9IG5vcjsKPiAgPiA+wqDCoCDCoMKgwqAgbXRkLT50eXBlID0gTVREX05PUkZM
QVNIOwo+ICA+ID4gQEAgLTM4MjEsNyArMzgzMCw3IEBAIGludCBzcGlfbm9yX3NjYW4oc3RydWN0
IHNwaV9ub3IgKm5vcikKPiAgPiA+Cj4gID4gPsKgwqAgwqDCoMKgIG5vci0+cmRzcl9kdW1teSA9
IHBhcmFtcy5yZHNyX2R1bW15Owo+ICA+ID7CoMKgIMKgwqDCoCBub3ItPnJkc3JfYWRkcl9uYnl0
ZXMgPSBwYXJhbXMucmRzcl9hZGRyX25ieXRlczsKPiAgPiA+IC3CoMKgwqAgbm9yLT5uYW1lID0g
bXRkLT5uYW1lOwo+ICA+ID4gK8KgwqDCoCBub3ItPm5hbWUgPSBpbmZvLT5uYW1lOwo+ICA+ID7C
oMKgIMKgwqDCoCBub3ItPnNpemUgPSBtdGQtPnNpemU7Cj4gID4gPsKgwqAgwqDCoMKgIG5vci0+
ZXJhc2Vfc2l6ZSA9IG10ZC0+ZXJhc2VzaXplOwo+ICA+ID7CoMKgIMKgwqDCoCBub3ItPnNlY3Rv
cl9zaXplID0gbXRkLT5lcmFzZXNpemU7Cj4gID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tdGQvc3BpLW5vci5oIGIvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oCj4gID4gPiBpbmRl
eCA3ZGRjNGJhMmJmLi44YzNkNTAzMmUzIDEwMDY0NAo+ICA+ID4gLS0tIGEvaW5jbHVkZS9saW51
eC9tdGQvc3BpLW5vci5oCj4gID4gPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmgK
PiAgPiA+IEBAIC01NjEsNiArNTYxLDcgQEAgc3RydWN0IHNwaV9ub3Igewo+ICA+ID7CoMKgIMKg
wqDCoCBpbnQgKCpyZWFkeSkoc3RydWN0IHNwaV9ub3IgKm5vcik7Cj4gID4gPgo+ICA+ID7CoMKg
IMKgwqDCoCB2b2lkICpwcml2Owo+ICA+ID4gK8KgwqDCoCBjaGFyIG10ZF9uYW1lWzEwXTsKPiAK
PiAgPiBzaG91bGQgYmUgMTQsIGJlY2F1c2Ugbm9yJWRcMCBjYW4gYmUgdXAgdG8gMTQgYnl0ZXMg
bG9uZy4KPiAKPiBub3JtYWxseSBETV9NQVhfU0VRID0gOTk5IChidXQgbmV2ZXIgdXNlZCkKPiAK
PiBidXQgT2sgd2l0aCB5b3UgZm9yIDE0IHdpdGggIm5vciIgPSAzICsgIiVkIiA9IDEwIGZvciBt
YXggdTMyIHZhbHVlICsgCj4gIi8wIiA9IDEKPiAKPiAKPiBmb3IgY2ZpX210ZF9uYW1lcyA9PiAx
NiBieXRlIHVzZWQgd2l0aCAibm9yJWQiCj4gCj4gIMKgwqDCoCBzdGF0aWMgY2hhciBjZmlfbXRk
X25hbWVzW0NGSV9NQVhfRkxBU0hfQkFOS1NdWzE2XTsKPiAKPiBmb3IgbmFuZCA9PiA4IGJ5dGVz
ICguL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmQuYzo1OSkKPiAKPiAgwqDCoMKgIHN0YXRpYyBj
aGFyIGRldl9uYW1lW0NPTkZJR19TWVNfTUFYX05BTkRfREVWSUNFXVs4XTsKPiAKPiBmb3Igc3Bp
LW5hbmQgPT4gMjAgYnl0ZXMgKGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYzoxMTY5KQo+IAo+
ICDCoMKgwqAgbXRkLT5uYW1lID0gbWFsbG9jKDIwKTsKCk1heWJlIHdlIG5lZWQgYSBtYWNybyBm
b3IgdGhpcyBsZW5ndGggb2YgRE0gc2VxIHN0cmluZyB3aGljaCB3ZSBjb3VsZCAKdXNlIGluIHRo
ZXNlIGVtYmVkZGVkIGFycmF5IGNhc2VzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
