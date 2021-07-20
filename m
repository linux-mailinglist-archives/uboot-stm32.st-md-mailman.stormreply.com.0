Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C693D0128
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:02:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35368C597BD;
	Tue, 20 Jul 2021 18:02:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2911C597B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:02:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KHutej019484; Tue, 20 Jul 2021 20:02:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bzrByxA7dLkFJ0CrDSTGTm3IF/QJWkJH7/Yaf9CuApQ=;
 b=8cg3jyunnJwqUqcJ1EufCObuiemXrXxHA9xlBTehS+cc71POmFXdcYAoT1ycAEhMFImM
 /S5tLXtezv3HEIvNwgPOJu8Jnmpr38+aUXhMVsopHPcKAnNZkrzku54dvKb4+nE4B57w
 GXxDGiXZIt/IC70X8rs0t6rrlo5Q3E/sNfGUQMHchQCqSCKSlrKiQ1X1p6lDXtqVfc0n
 n7YTCjQCph/DEsQT4pXyQ5e1NxyZqAZJG1cNjZxHxa7pAoBNs4b4vBNESznKgC5iL21H
 EzclGVK4nrSP42CGBUYyV+xxSoA1fFHHx1+n4tlmLl0rpEbBcfmDpF//0gh19Nb8cTFr fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wu03u1mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 20:02:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E30610002A;
 Tue, 20 Jul 2021 20:02:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 269AD2C4206;
 Tue, 20 Jul 2021 20:02:43 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul
 2021 20:02:42 +0200
To: <u-boot@lists.denx.de>, Ramon Fried <rfried.dev@gmail.com>
References: <20210426154653.3941-1-patrick.delaunay@foss.st.com>
 <20210426174647.v2.1.I5a50f8eef93c11cb54dfdd3b11183422a82fb373@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <adcb427f-86dd-6e8b-b82c-0f29647245a0@foss.st.com>
Date: Tue, 20 Jul 2021 20:02:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210426174647.v2.1.I5a50f8eef93c11cb54dfdd3b11183422a82fb373@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
Cc: Marek Vasut <marex@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/6] net: eth-phy: add support of
 device tree configuration for gpio reset
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

SGkgUmFtb24sCgoKT24gNC8yNi8yMSA1OjQ2IFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+
IFRoZSBncGlvIHJlc2V0IGFuZCB0aGUgYXNzZXJ0IG9yIGRlYXNzZXJ0IGRlbGF5IGFyZSBkZWZp
bmVkIGluIGdlbmVyaWMKPiBiaW5kaW5nIG9mIHRoZSBldGhlcm5ldCBwaHkgaW4gTGludXg6Cj4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9ldGhlcm5ldC1waHkueWFtbAo+
Cj4gICAgcmVzZXQtZ3Bpb3M6Cj4gICAgICBtYXhJdGVtczogMQo+ICAgICAgZGVzY3JpcHRpb246
Cj4gICAgICAgIFRoZSBHUElPIHBoYW5kbGUgYW5kIHNwZWNpZmllciBmb3IgdGhlIFBIWSByZXNl
dCBzaWduYWwuCj4KPiAgICByZXNldC1hc3NlcnQtdXM6Cj4gICAgICBkZXNjcmlwdGlvbjoKPiAg
ICAgICAgRGVsYXkgYWZ0ZXIgdGhlIHJlc2V0IHdhcyBhc3NlcnRlZCBpbiBtaWNyb3NlY29uZHMu
IElmIHRoaXMKPiAgICAgICAgcHJvcGVydHkgaXMgbWlzc2luZyB0aGUgZGVsYXkgd2lsbCBiZSBz
a2lwcGVkLgo+Cj4gICAgcmVzZXQtZGVhc3NlcnQtdXM6Cj4gICAgICBkZXNjcmlwdGlvbjoKPiAg
ICAgICAgRGVsYXkgYWZ0ZXIgdGhlIHJlc2V0IHdhcyBkZWFzc2VydGVkIGluIG1pY3Jvc2Vjb25k
cy4gSWYKPiAgICAgICAgdGhpcyBwcm9wZXJ0eSBpcyBtaXNzaW5nIHRoZSBkZWxheSB3aWxsIGJl
IHNraXBwZWQuCj4KPiBTZWUgYWxzbyBVLUJvb3Q6IGRvYy9kZXZpY2UtdHJlZS1iaW5kaW5ncy9u
ZXQvcGh5LnR4dAo+Cj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBwYXJzaW5nIG9mIHRoaXMgY29tbW9u
IERUIHByb3BlcnRpZXMgaW4gdGhlCj4gdS1jbGFzcyAiZXRoX3BoeV9nZW5lcmljIiwgdXNlZCBi
eSBkZWZhdWx0IGluIHRoZSBhc3NvY2lhdGVkIGRyaXZlcgo+ICJldGhfcGh5X2dlbmVyaWNfZHJ2
Igo+Cj4gVGhpcyBwYXJzaW5nIGZ1bmN0aW9uIGV0aF9waHlfb2ZfdG9fcGxhdCBjYW4gYmUgcmV1
c2VkIGJ5IG90aGVyCj4gZXRoZXJuZXQgcGh5IGRyaXZlcnMgZm9yIHRoaXMgdWNsYXNzIFVDTEFT
U19FVEhfUEhZLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5k
ZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBVcGRhdGUg
ZXRoLXBoeSBkcml2ZXIgKE5FVykKPgo+ICAgZHJpdmVycy9uZXQvZXRoLXBoeS11Y2xhc3MuYyB8
IDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDUwIGluc2VydGlvbnMoKykKPgoKVGhpcyBwYXRjaCBjYXVzZSBpc3N1ZSBvbiBzb21lIGJv
YXJkIHdpdGhvdXQgQ09ORklHX0RNX0dQSU8KCiDCoMKgIHBvd2VycGM6wqAgdyvCoMKgIGlkczgz
MTMgc29jcmF0ZXMgVUNQMTAyMCBQMzA0MURTIFAzMDQxRFNfTkFORCAKUDMwNDFEU19TRENBUkQg
UDMwNDFEU19TUElGTEFTSCBQNDA4MERTIFA0MDgwRFNfU0RDQVJEIFA0MDgwRFNfU1BJRkxBU0gg
ClA1MDQwRFMgUDUwNDBEU19OQU5EIFA1MDQwRFNfU0RDQVJEIFA1MDQwRFNfU1BJRkxBU0ggTVBD
ODU0OENEUyAKTVBDODU0OENEU18zNkJJVCBNUEM4NTQ4Q0RTX2xlZ2FjeSBUMjA4MFFEUyBUMjA4
MFFEU19OQU5EIApUMjA4MFFEU19TRENBUkQgVDIwODBRRFNfU0VDVVJFX0JPT1QgVDIwODBRRFNf
U1BJRkxBU0ggClQyMDgwUURTX1NSSU9fUENJRV9CT09UIGttY2VudDIgTUNSMzAwMCBNUEM4MzQ5
RU1EUyBNUEM4MzQ5RU1EU19QQ0k2NCAKTVBDODM0OUVNRFNfU0RSQU0gTVBDODM0OUVNRFNfU0xB
VkUgK8KgwqAgTVBDODM3WEVSREIga21jb2dlNW5lIGttZXRlcjEgCmttb3B0aTIga21zdXB4NSBr
bXRlZ3IxIGttdGVwcjIgdHVnZTEgdHV4eDEKK3Bvd2VycGMtbGludXgtbGQuYmZkOiBkcml2ZXJz
L25ldC9ldGgtcGh5LXVjbGFzcy5vOiBpbiBmdW5jdGlvbiAKYGV0aF9waHlfb2ZfdG9fcGxhdCc6
Citkcml2ZXJzL25ldC9ldGgtcGh5LXVjbGFzcy5jOjEzMzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byAKYGdwaW9fcmVxdWVzdF9ieV9uYW1lJworcG93ZXJwYy1saW51eC1sZC5iZmQ6IGRyaXZlcnMv
bmV0L2V0aC1waHktdWNsYXNzLm86IGluIGZ1bmN0aW9uIApgZXRoX3BoeV9yZXNldCc6Citkcml2
ZXJzL25ldC9ldGgtcGh5LXVjbGFzcy5jOjE1MzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byAKYGRt
X2dwaW9fc2V0X3ZhbHVlJworbWFrZVsxXTogKioqIFtNYWtlZmlsZToxNzg4OiB1LWJvb3RdIEVy
cm9yIDEKK21ha2U6ICoqKiBbTWFrZWZpbGU6MTc3OiBzdWItbWFrZV0gRXJyb3IgMgoKCkkgZGV0
ZWN0IHRoZSBpc3N1ZSBpbiBteSBzdG0zMi9uZXh0IGJyYW5jaAoKYnV0IEkgd2lsbCBzZW50IGEg
VjMgb2YgdGhlIHNlcmllIHdpdGggYW4gY29ycmVjdGlvbi4KClBhdHJpY2sKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
