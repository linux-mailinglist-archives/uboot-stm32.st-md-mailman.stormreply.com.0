Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE840F8CF
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Sep 2021 15:06:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64655C5A4F6;
	Fri, 17 Sep 2021 13:06:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6C68C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Sep 2021 13:06:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18HAX6Rw022052; 
 Fri, 17 Sep 2021 15:06:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MIuUCtHyJZIFdGSzeLawigZRSO1DOiP7rQrL0x8bt+4=;
 b=UbKHdwvXnG5XAa0Z5Ta0X+bAWdI3jmx62yXg4tS8PANHm7KaB5M5xKJkYZYT+Rk5hwEB
 703bl8ydHa1iSvkoyUE7NdzvWHkOL6mXuRiOVOy1kS7jUlk/V7NGef0bmCN3E+xeuFmY
 VHixq9L/LWzMf/QWxsdwhKicL/U6YGxV7k6ap0hyEjDwQHK2WGe6m0bzTfx8J6yRzjkQ
 IjB/D7sGATIZDP+UZ0/hseOx+7Pq3MOCIzFiLjfMIAw2d9JAFx2oIa9mqiD5cwmsMN5c
 7KW0KY/NBxRWeyIXaO1S4yv92vnMrV7XEutlQgF3MBXkFXFSCdlhPr20zNmxFWcdSNCu Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b4msyafsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 15:06:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF8E910002A;
 Fri, 17 Sep 2021 15:06:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74B822C38B9;
 Fri, 17 Sep 2021 15:06:35 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 17 Sep
 2021 15:06:34 +0200
To: <u-boot@lists.denx.de>
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
 <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <5dfd98da-2efd-23e2-64db-ec41dc9b6c6a@foss.st.com>
Date: Fri, 17 Sep 2021 15:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-17_05,2021-09-17_02,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
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

SGkgTWFyZWssCgogPiBNYXJlayBWYXN1dFNlcHQuIDE2LCAyMDIxLCA1OjI3IHAubS4gVVRDIHwg
IzMKID4gT24gOS8xNi8yMSA0OjAxIFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgoKID4gWy4u
Ll0KCiA+ID4gQEAgLTM2NjQsNiArMzY2NiwxMSBAQCBpbnQgc3BpX25vcl9zY2FuKHN0cnVjdCBz
cGlfbm9yICpub3IpCiA+ID7CoMKgIMKgwqDCoCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9ICZub3It
Pm10ZDsKID4gPsKgwqAgwqDCoMKgIHN0cnVjdCBzcGlfc2xhdmUgKnNwaSA9IG5vci0+c3BpOwog
PiA+wqDCoCDCoMKgwqAgaW50IHJldDsKID4gPiArwqDCoMKgIGludCBjZmlfbXRkX25iID0gMDsK
ID4gPiArCiA+ID4gKyNpZmRlZiBDT05GSUdfU1lTX01BWF9GTEFTSF9CQU5LUwogPiA+ICvCoMKg
wqAgY2ZpX210ZF9uYiA9IENPTkZJR19TWVNfTUFYX0ZMQVNIX0JBTktTOwogPiA+ICsjZW5kaWYK
CiA+IEFyZSB3ZSBjb3ZlcmluZyBhbGwgdGhlIE5PUnMgKEhGIGFuZCBjby4pIHdpdGggdGhpcyA/
CgoKWWVzLCBleGNlcHQgaWYgSSBtaXNzIHNvbWV0aGluZwoKCmFueSBOT1IgKGluY2x1ZGluZyBo
eXBlcmZsYXNoKSB3aWNoIHVzZSB0aGUgQ0ZJIGludGVyZmFjZSAvIApDT05GSUdfRkxBU0hfQ0ZJ
X01URAoKZGVmaW5lIHRoZSB0aGUgJ25vciVkJyBuYW1lIHdpdGggdGhlIGNhbGxpbmcgc3RhY2s6
CgoKaW5pdHJfZmxhc2goKQoKPT4gZmxhc2hfaW5pdCgpCgo9PT4gY2ZpX2ZsYXNoX2luaXRfZG0o
KQoKPT0+IGNmaV9tdGRfaW5pdCgpwqDCoCAibm9yJWQiIHdpY2ggdXNlIGxvb3Agb24gQ09ORklH
X1NZU19NQVhfRkxBU0hfQkFOS1MKCgpJIGhhdmUgb25seSBvbmUgY29uY2VybiB0b2RheS4uLgoK
CmlmIG9uZSBjZmkgYmFuayBpcyBtaXNzaW5nIChub3QgYWN0aXZhdGVkIGluIERUIGJ5IGV4YW1w
bGUpCgphbmQgQ09ORklHX1NZU19NQVhfRkxBU0hfQkFOS1NfREVURUNUIGlzIG5vdCBhY3RpdmF0
ZWQKCnNvbWUgaG9sZXMgY2FuIGJlIGRvbmUgaW4gaW5kZXgKCgpleGFtcGxlOgoKd2l0aCBDT05G
SUdfU1lTX01BWF9GTEFTSF9CQU5LUyA9IDIgYnV0IHdpdGggb25seSBvbmUgTk9SIG9uIHRoZSBi
b2FyZAoKPT4gIm5vcjEiIGlzIGFic2VudCBhbmQgd2UgaGF2ZSBvbmx5IDIgTVREIGRldmljZSBu
YW1lZCAibm9yIgoKLSAibm9yMCIgPT4gTk9SIG9yIEhGLCBmaXJzdCBDRkkgYmFuawoKLSAibm9y
MiIgPT4gU1BJLU5PUiAoZmlyc3QpCgoKYnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCBpdCBpcyBibG9j
a2luZwoKCiA+ID7CoMKgIMKgwqDCoCAvKiBSZXNldCBTUEkgcHJvdG9jb2wgZm9yIGFsbCBjb21t
YW5kcy4gKi8KID4gPsKgwqAgwqDCoMKgIG5vci0+cmVnX3Byb3RvID0gU05PUl9QUk9UT18xXzFf
MTsKID4gPiBAQCAtMzcxNSw4ICszNzIyLDEwIEBAIGludCBzcGlfbm9yX3NjYW4oc3RydWN0IHNw
aV9ub3IgKm5vcikKID4gPsKgwqAgwqDCoMKgIGlmIChyZXQpCiA+ID7CoMKgIMKgwqDCoCDCoMKg
wqAgcmV0dXJuIHJldDsKID4gPgogPiA+IC3CoMKgwqAgaWYgKCFtdGQtPm5hbWUpCiA+ID4gLcKg
wqDCoCDCoMKgwqAgbXRkLT5uYW1lID0gaW5mby0+bmFtZTsKID4gPiArwqDCoMKgIGlmICghbXRk
LT5uYW1lKSB7CiA+ID4gK8KgwqDCoCDCoMKgwqAgc3ByaW50Zihub3ItPm10ZF9uYW1lLCAibm9y
JWQiLMKgIGNmaV9tdGRfbmIgKyAKZGV2X3NlcShub3ItPmRldikpOwogPiA+ICvCoMKgwqAgwqDC
oMKgIG10ZC0+bmFtZSA9IG5vci0+bXRkX25hbWU7CiA+ID4gK8KgwqDCoCB9CiA+ID7CoMKgIMKg
wqDCoCBtdGQtPmRldiA9IG5vci0+ZGV2OwogPiA+wqDCoCDCoMKgwqAgbXRkLT5wcml2ID0gbm9y
OwogPiA+wqDCoCDCoMKgwqAgbXRkLT50eXBlID0gTVREX05PUkZMQVNIOwogPiA+IEBAIC0zODIx
LDcgKzM4MzAsNyBAQCBpbnQgc3BpX25vcl9zY2FuKHN0cnVjdCBzcGlfbm9yICpub3IpCiA+ID4K
ID4gPsKgwqAgwqDCoMKgIG5vci0+cmRzcl9kdW1teSA9IHBhcmFtcy5yZHNyX2R1bW15OwogPiA+
wqDCoCDCoMKgwqAgbm9yLT5yZHNyX2FkZHJfbmJ5dGVzID0gcGFyYW1zLnJkc3JfYWRkcl9uYnl0
ZXM7CiA+ID4gLcKgwqDCoCBub3ItPm5hbWUgPSBtdGQtPm5hbWU7CiA+ID4gK8KgwqDCoCBub3It
Pm5hbWUgPSBpbmZvLT5uYW1lOwogPiA+wqDCoCDCoMKgwqAgbm9yLT5zaXplID0gbXRkLT5zaXpl
OwogPiA+wqDCoCDCoMKgwqAgbm9yLT5lcmFzZV9zaXplID0gbXRkLT5lcmFzZXNpemU7CiA+ID7C
oMKgIMKgwqDCoCBub3ItPnNlY3Rvcl9zaXplID0gbXRkLT5lcmFzZXNpemU7CiA+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaCBiL2luY2x1ZGUvbGludXgvbXRkL3Nw
aS1ub3IuaAogPiA+IGluZGV4IDdkZGM0YmEyYmYuLjhjM2Q1MDMyZTMgMTAwNjQ0CiA+ID4gLS0t
IGEvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oCiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC9t
dGQvc3BpLW5vci5oCiA+ID4gQEAgLTU2MSw2ICs1NjEsNyBAQCBzdHJ1Y3Qgc3BpX25vciB7CiA+
ID7CoMKgIMKgwqDCoCBpbnQgKCpyZWFkeSkoc3RydWN0IHNwaV9ub3IgKm5vcik7CiA+ID4KID4g
PsKgwqAgwqDCoMKgIHZvaWQgKnByaXY7CiA+ID4gK8KgwqDCoCBjaGFyIG10ZF9uYW1lWzEwXTsK
CiA+IHNob3VsZCBiZSAxNCwgYmVjYXVzZSBub3IlZFwwIGNhbiBiZSB1cCB0byAxNCBieXRlcyBs
b25nLgoKbm9ybWFsbHkgRE1fTUFYX1NFUSA9IDk5OSAoYnV0IG5ldmVyIHVzZWQpCgpidXQgT2sg
d2l0aCB5b3UgZm9yIDE0IHdpdGggIm5vciIgPSAzICsgIiVkIiA9IDEwIGZvciBtYXggdTMyIHZh
bHVlICsgCiIvMCIgPSAxCgoKZm9yIGNmaV9tdGRfbmFtZXMgPT4gMTYgYnl0ZSB1c2VkIHdpdGgg
Im5vciVkIgoKIMKgwqDCoCBzdGF0aWMgY2hhciBjZmlfbXRkX25hbWVzW0NGSV9NQVhfRkxBU0hf
QkFOS1NdWzE2XTsKCmZvciBuYW5kID0+IDggYnl0ZXMgKC4vZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZC5jOjU5KQoKIMKgwqDCoCBzdGF0aWMgY2hhciBkZXZfbmFtZVtDT05GSUdfU1lTX01BWF9O
QU5EX0RFVklDRV1bOF07Cgpmb3Igc3BpLW5hbmQgPT4gMjAgYnl0ZXMgKGRyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYzoxMTY5KQoKIMKgwqDCoCBtdGQtPm5hbWUgPSBtYWxsb2MoMjApOwoKClBh
dHJpY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
