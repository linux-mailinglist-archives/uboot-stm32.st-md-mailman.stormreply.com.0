Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59300ACD83A
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Jun 2025 09:06:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04A54C32E92;
	Wed,  4 Jun 2025 07:06:10 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E49EDC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 07:06:07 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5546LeSk029853;
 Wed, 4 Jun 2025 09:05:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +vnvyFrWsq+TqI/EBxhTjT2bDkUF1GXEbilnWIHwJ2w=; b=O1w+LQmOqiui8A/H
 cabtr6Kd1nBcL63uBgWIU5RbzFQbHW05rmoj5yK2uSFai/XvAeg9BtfNRljLg6uB
 FWtuVgfGPxgZ3tMi+tYlfH+myj1FKvNPnhaub2OYQRjMTSuPzKg+4Zli0l5abFAM
 syynz+vahgWKvUSnKmQDmBaV43wZDIUiuR1v/DC7mXQj5/f8l3gKoWrq1tyJqF+I
 1fXw8+hVzeeUF0LlcAILk9FN5rzAO5EqALaAosWj2zmGbZBUMB2SEQ+EDUSIeE+y
 YYt+h/NJdVCvNK7tWwTBBz4t6nqmCxXkliezx8U100sQfB25lRJB5DLrsjOEHnKd
 WyOWTQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g8syr1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jun 2025 09:05:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C75E24005C;
 Wed,  4 Jun 2025 09:02:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC6DBB054CA;
 Wed,  4 Jun 2025 09:01:55 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 09:01:55 +0200
Message-ID: <f319bd79-6d65-4bd0-af12-4a62f96566e1@foss.st.com>
Date: Wed, 4 Jun 2025 09:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Lukasz
 Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>, Tom Rini
 <trini@konsulko.com>
References: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
 <20250527132755.2169508-5-patrice.chotard@foss.st.com>
 <156e1773-fa76-4b22-80e7-cf26cb7bf7b3@foss.st.com>
 <CAOf5uwmNz3JRoEoEVxMYk1Mb5PnYEMSWKbbh=kMXp=tqufPB2g@mail.gmail.com>
 <05a41190-87a4-4d32-b3d9-44e3101ea858@foss.st.com>
 <CAOf5uwkpj9HA+nhiOTPFz8WTGihyiVgZoCfZDKyCPu68zrRe9A@mail.gmail.com>
 <CAOf5uwn0VBV_swPt=JVJEazWrLh6hzhXDn8P2RSN34dmuu_aNA@mail.gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAOf5uwn0VBV_swPt=JVJEazWrLh6hzhXDn8P2RSN34dmuu_aNA@mail.gmail.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kongyang Liu <seashell11234455@gmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, Alexander Dahl <ada@thorsis.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Tom Rini <trini@konsulko.com>,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [Uboot-stm32] [PATCH v2 04/13] clk: add CONFIG_CLK_AUTO_ID
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

CgpPbiA2LzQvMjUgMDg6NTAsIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSB3cm90ZToKPiBI
aQo+IAo+IE9uIFdlZCwgSnVuIDQsIDIwMjUgYXQgODo0OOKAr0FNIE1pY2hhZWwgTmF6emFyZW5v
IFRyaW1hcmNoaQo+IDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPj4KPj4g
SGkgUGF0cmljZQo+Pgo+PiBPbiBXZWQsIEp1biA0LCAyMDI1IGF0IDg6NDbigK9BTSBQYXRyaWNl
IENIT1RBUkQKPj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4K
Pj4+Cj4+PiBPbiA2LzQvMjUgMDg6MTQsIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSB3cm90
ZToKPj4+PiBIaQo+Pj4+Cj4+Pj4gT24gV2VkLCBKdW4gNCwgMjAyNSBhdCA4OjAy4oCvQU0gUGF0
cmljZSBDSE9UQVJECj4+Pj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+
Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDUvMjcvMjUgMTU6MjcsIFBhdHJpY2UgQ2hvdGFyZCB3
cm90ZToKPj4+Pj4+IEZyb206IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9z
cy5zdC5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gQWRkIGEgbmV3IGNvbmZpZyBDT05GSUdfQ0xLX0FVVE9f
SUQgdG8gc3VwcG9ydCBhIHVuaXF1ZSBjbGsgaWQKPj4+Pj4+IGZvciBhbGwgdGhlIGNsb2NrIHBy
b3ZpZGVycywgbWFuYWdlZCBieSBjbGsgdWNsYXNzLCB3aGVuIHRoZSBjbG9jawo+Pj4+Pj4gcmVm
ZXJlbmNlIGFyZ1swXSBpcyB0aGUgc2FtZS4KPj4+Pj4+Cj4+Pj4+PiBXaGVuIHRoZSBDT05GSUcg
aXMgYWN0aXZhdGVkLCB0aGUgY2xvY2sgaWQgaXMgbGltaXRlZCB0byB0aGUgbG93ZXIKPj4+Pj4+
IENMS19JRF9TWiA9IDI0IGJpdHMgaW4gZGVmYXVsdCBjbG9jayB4bGF0ZSBmdW5jdGlvbgo+Pj4+
Pj4gYW5kIHRoZSBzZXF1ZW5jZSBudW1iZXIgKyAxIG9mIHRoZSBjbGsgcHJvdmlkZXIgZGV2aWNl
IGlzCj4+Pj4+PiBhZGRlZCBmb3IgdGhlIDggaGlnaGVyIGJpdHMuCj4+Pj4+Pgo+Pj4+Pj4gV2Ug
dXNlIHNlcXVlbmNlIG51bWJlciArIDEgdG8gYXZvaWQgdGhlICJkdW1teSIgY2xvY2sgaWQgPSAw
LAo+Pj4+Pj4gdXNlZCBmb3IgaW52YWxpZCBjbG9jayB3aGVuIENDRiBpcyBhY3RpdmF0ZWQuCj4+
Pj4+Pgo+Pj4+Pj4gV2hlbiB0aGlzIGNvbmZpZyBpcyBhY3RpdmF0ZWQsIHRoZSBuZXcgZnVuY3Rp
b24gY2xrX2dldF9pZCgpCj4+Pj4+PiBzaG91bGQgYmUgdXNlZCB0byBnZXQgYmFjayB0aGUgaW50
ZXJuYWwgcmVmZXJlbmNlIHRvIGNsb2NrCj4+Pj4+PiBmb3IgdGhlIGVhY2ggY2xvY2sgcHJvdmlk
ZXIuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmlj
ay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hv
dGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pj4+Pj4gQ2M6IEx1a2FzeiBNYWpl
d3NraSA8bHVrbWFAZGVueC5kZT4KPj4+Pj4+IENjOiBTZWFuIEFuZGVyc29uIDxzZWFuZ2EyQGdt
YWlsLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4KPj4+Pj4+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+
Pj4+Pj4KPj4+Pj4+ICBkcml2ZXJzL2Nsay9LY29uZmlnICAgICAgICAgICAgICAgIHwgMTAgKysr
KysrKysrKwo+Pj4+Pj4gIGRyaXZlcnMvY2xrL2Nsay11Y2xhc3MuYyAgICAgICAgICAgfCAgOSAr
KysrKysrLS0KPj4+Pj4+ICBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzItY29yZS5jIHwgIDMg
KystCj4+Pj4+PiAgaW5jbHVkZS9jbGsuaCAgICAgICAgICAgICAgICAgICAgICB8IDI0ICsrKysr
KysrKysrKysrKysrKysrKysrKwo+Pj4+Pj4gIGluY2x1ZGUvbGludXgvY2xrLXByb3ZpZGVyLmgg
ICAgICAgfCAgOSArKysrKysrKy0KPj4+Pj4+ICA1IGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xrL0tjb25maWcgYi9kcml2ZXJzL2Nsay9LY29uZmlnCj4+Pj4+PiBpbmRleCAxOGJkNjQwYTY4
Yi4uYjJlNTNmZTMyNWUgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9LY29uZmlnCj4+
Pj4+PiArKysgYi9kcml2ZXJzL2Nsay9LY29uZmlnCj4+Pj4+PiBAQCAtMTAsNiArMTAsMTYgQEAg
Y29uZmlnIENMSwo+Pj4+Pj4gICAgICAgICBmZWVkIGludG8gb3RoZXIgY2xvY2tzIGluIGEgdHJl
ZSBzdHJ1Y3R1cmUsIHdpdGggbXVsdGlwbGV4ZXJzIHRvCj4+Pj4+PiAgICAgICAgIGNob29zZSB0
aGUgc291cmNlIGZvciBlYWNoIGNsb2NrLgo+Pj4+Pj4KPj4+Pj4+ICtjb25maWcgQ0xLX0FVVE9f
SUQKPj4+Pj4+ICsgICAgIGJvb2wgIkVuYWJsZSBzdXBwb3J0IG9mIGFuIHVuaXF1ZSBjbG9jayBp
ZCB3aXRoIHNldmVyYWwgcHJvdmlkZXIiCj4+Pj4+PiArICAgICBkZXBlbmRzIG9uIENMSwo+Pj4+
Pj4gKyAgICAgaGVscAo+Pj4+Pj4gKyAgICAgICBBZGQgdGhlIHVjbGFzcyBzZXF1ZW5jZSBudW1i
ZXIgb2YgY2xvY2sgcHJvdmlkZXIgaW4gdGhlIDggaGlnaGVyIGJpdHMKPj4+Pj4+ICsgICAgICAg
b2YgdGhlIGNsayBpZCB0byBndWFyYW50eSBhbiB1bmlxdWUgY2xvY2sgaWRlbnRpZmllciBpbiBj
bGsgdWNsYXNzCj4+Pj4+PiArICAgICAgIHdoZW4gc2V2ZXJhbCBjbG9jayBwcm92aWRlcnMgYXJl
IHByZXNlbnQgb24gdGhlIGRldmljZSBhbmQgd2hlbgo+Pj4+Pj4gKyAgICAgICBkZWZhdWx0IHhs
YXRlIGFyZSB1c2VkLgo+Pj4+Pj4gKyAgICAgICBUaGlzIGZlYXR1cmUgbGltaXQgZWFjaCBpZGVu
dGlmaWVyIGZvciBlYWNoIGNsb2NrIHByb3ZpZGVycyAoMjQgYml0cykuCj4+Pj4+PiArCj4+Pj4+
PiAgY29uZmlnIFNQTF9DTEsKPj4+Pj4+ICAgICAgIGJvb2wgIkVuYWJsZSBjbG9jayBzdXBwb3J0
IGluIFNQTCIKPj4+Pj4+ICAgICAgIGRlcGVuZHMgb24gQ0xLICYmIFNQTCAmJiBTUExfRE0KPj4+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstdWNsYXNzLmMgYi9kcml2ZXJzL2Nsay9j
bGstdWNsYXNzLmMKPj4+Pj4+IGluZGV4IDIxNjdjZDVhZDBmLi43MjYyZTg5YjUxMiAxMDA2NDQK
Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvY2xrL2Nsay11Y2xhc3MuYwo+Pj4+Pj4gKysrIGIvZHJpdmVy
cy9jbGsvY2xrLXVjbGFzcy5jCj4+Pj4+PiBAQCAtMzQsNiArMzQsMTEgQEAgc3RydWN0IGNsayAq
ZGV2X2dldF9jbGtfcHRyKHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4+Pj4+PiAgICAgICByZXR1cm4g
KHN0cnVjdCBjbGsgKilkZXZfZ2V0X3VjbGFzc19wcml2KGRldik7Cj4+Pj4+PiAgfQo+Pj4+Pj4K
Pj4+Pj4+ICt1bG9uZyBjbGtfZ2V0X2lkKGNvbnN0IHN0cnVjdCBjbGsgKmNsaykKPj4+Pj4+ICt7
Cj4+Pj4+PiArICAgICByZXR1cm4gKHVsb25nKShjbGstPmlkICYgQ0xLX0lEX01TSyk7Cj4+Pj4+
PiArfQo+Pj4+Pj4gKwo+Pj4+Pj4gICNpZiBDT05GSUdfSVNfRU5BQkxFRChPRl9QTEFUREFUQSkK
Pj4+Pj4+ICBpbnQgY2xrX2dldF9ieV9waGFuZGxlKHN0cnVjdCB1ZGV2aWNlICpkZXYsIGNvbnN0
IHN0cnVjdCBwaGFuZGxlXzFfYXJnICpjZWxscywKPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBjbGsgKmNsaykKPj4+Pj4+IEBAIC00Myw3ICs0OCw3IEBAIGludCBjbGtfZ2V0X2J5
X3BoYW5kbGUoc3RydWN0IHVkZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0IHBoYW5kbGVfMV9hcmcg
KmNlbGxzLAo+Pj4+Pj4gICAgICAgcmV0ID0gZGV2aWNlX2dldF9ieV9vZnBsYXRfaWR4KGNlbGxz
LT5pZHgsICZjbGstPmRldik7Cj4+Pj4+PiAgICAgICBpZiAocmV0KQo+Pj4+Pj4gICAgICAgICAg
ICAgICByZXR1cm4gcmV0Owo+Pj4+Pj4gLSAgICAgY2xrLT5pZCA9IGNlbGxzLT5hcmdbMF07Cj4+
Pj4+PiArICAgICBjbGstPmlkID0gQ0xLX0lEKGRldiwgY2VsbHMtPmFyZ1swXSk7Cj4+Pj4+Pgo+
Pj4+Pj4gICAgICAgcmV0dXJuIDA7Cj4+Pj4+PiAgfQo+Pj4+Pj4gQEAgLTYxLDcgKzY2LDcgQEAg
c3RhdGljIGludCBjbGtfb2ZfeGxhdGVfZGVmYXVsdChzdHJ1Y3QgY2xrICpjbGssCj4+Pj4+PiAg
ICAgICB9Cj4+Pj4+Pgo+Pj4+Pj4gICAgICAgaWYgKGFyZ3MtPmFyZ3NfY291bnQpCj4+Pj4+PiAt
ICAgICAgICAgICAgIGNsay0+aWQgPSBhcmdzLT5hcmdzWzBdOwo+Pj4+Pj4gKyAgICAgICAgICAg
ICBjbGstPmlkID0gQ0xLX0lEKGNsay0+ZGV2LCBhcmdzLT5hcmdzWzBdKTsKPj4+Pj4+ICAgICAg
IGVsc2UKPj4+Pj4+ICAgICAgICAgICAgICAgY2xrLT5pZCA9IDA7Cj4+Pj4+Pgo+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N0bTMyL2Nsay1zdG0zMi1jb3JlLmMgYi9kcml2ZXJzL2Ns
ay9zdG0zMi9jbGstc3RtMzItY29yZS5jCj4+Pj4+PiBpbmRleCAzNThlZTU2NjgyYS4uZGYzYjM1
YjEwMDMgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzItY29y
ZS5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzItY29yZS5jCj4+Pj4+
PiBAQCAtNDYsNyArNDYsOCBAQCBpbnQgc3RtMzJfcmNjX2luaXQoc3RydWN0IHVkZXZpY2UgKmRl
diwKPj4+Pj4+Cj4+Pj4+PiAgICAgICAgICAgICAgIGlmIChjZmctPnNldHVwKSB7Cj4+Pj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgY2xrID0gY2ZnLT5zZXR1cChkZXYsIGNmZyk7Cj4+Pj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgY2xrLT5pZCA9IGNmZy0+aWQ7Cj4+Pj4+PiArICAgICAgICAg
ICAgICAgICAgICAgLyogc2V0IGlkZW50aWZpZXIgb2YgY2xvY2sgcHJvdmlkZXIqLwo+Pj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgIGRldl9jbGtfZG0oZGV2LCBjZmctPmlkLCBjbGspOwo+Pj4+
Pj4gICAgICAgICAgICAgICB9IGVsc2Ugewo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIGRl
dl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGNsb2NrICVzXG4iLCBjZmctPm5hbWUpOwo+
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+Pj4+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvY2xrLmggYi9pbmNsdWRlL2Nsay5oCj4+Pj4+PiBpbmRleCBhNmVmNGUw
MjY5Mi4uZjk0MTM1ZmY3NzggMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2Nsay5oCj4+Pj4+
PiArKysgYi9pbmNsdWRlL2Nsay5oCj4+Pj4+PiBAQCAtMTMsNiArMTMsMTUgQEAKPj4+Pj4+ICAj
aW5jbHVkZSA8bGludXgvZXJybm8uaD4KPj4+Pj4+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4K
Pj4+Pj4+Cj4+Pj4+PiArI2lmZGVmIENPTkZJR19DTEtfQVVUT19JRAo+Pj4+Pj4gKyNkZWZpbmUg
Q0xLX0lEX1NaICAgIDI0Cj4+Pj4+PiArI2RlZmluZSBDTEtfSURfTVNLICAgR0VOTUFTSygyMywg
MCkKPj4+Pj4+ICsjZGVmaW5lIENMS19JRChkZXYsIGlkKSAgICAgICgoKGRldl9zZXEoZGV2KSAr
IDEpIDw8IENMS19JRF9TWikgfCAoKGlkKSAmIENMS19JRF9NU0spKQo+Pj4+Pj4gKyNlbHNlCj4+
Pj4+PiArI2RlZmluZSBDTEtfSURfTVNLICAgKH4wVUwpCj4+Pj4+PiArI2RlZmluZSBDTEtfSUQo
ZGV2LCBpZCkgICAgICBpZAo+Pj4+Pj4gKyNlbmRpZgo+Pj4+Pj4gKwo+Pj4+Pj4gIC8qKgo+Pj4+
Pj4gICAqIERPQzogT3ZlcnZpZXcKPj4+Pj4+ICAgKgo+Pj4+Pj4gQEAgLTU3MCw2ICs1NzksMTYg
QEAgaW50IGNsa19nZXRfYnlfaWQodWxvbmcgaWQsIHN0cnVjdCBjbGsgKipjbGtwKTsKPj4+Pj4+
ICAgKi8KPj4+Pj4+ICBib29sIGNsa19kZXZfYmluZGVkKHN0cnVjdCBjbGsgKmNsayk7Cj4+Pj4+
Pgo+Pj4+Pj4gKy8qKgo+Pj4+Pj4gKyAqIGNsa19nZXRfaWQgLSBnZXQgY2xrIGlkCj4+Pj4+PiAr
ICoKPj4+Pj4+ICsgKiBAY2xrOiAgICAgQSBjbG9jayBzdHJ1Y3QKPj4+Pj4+ICsgKgo+Pj4+Pj4g
KyAqIFJldHVybjogdGhlIGNsb2NrIGlkZW50aWZpZXIgYXMgaXQgaXMgZGVmaW5lZCBieSB0aGUg
Y2xvY2sgcHJvdmlkZXIgaW4KPj4+Pj4+ICsgKiBkZXZpY2UgdHJlZSBvciBpbiBwbGF0ZGF0YQo+
Pj4+Pj4gKyAqLwo+Pj4+Pj4gK3Vsb25nIGNsa19nZXRfaWQoY29uc3Qgc3RydWN0IGNsayAqY2xr
KTsKPj4+Pj4+ICsKPj4+Pj4+ICAjZWxzZSAvKiBDT05GSUdfSVNfRU5BQkxFRChDTEspICovCj4+
Pj4+Pgo+Pj4+Pj4gIHN0YXRpYyBpbmxpbmUgaW50IGNsa19yZXF1ZXN0KHN0cnVjdCB1ZGV2aWNl
ICpkZXYsIHN0cnVjdCBjbGsgKmNsaykKPj4+Pj4+IEBAIC02NDEsNiArNjYwLDExIEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCBjbGtfZGV2X2JpbmRlZChzdHJ1Y3QgY2xrICpjbGspCj4+Pj4+PiAgewo+
Pj4+Pj4gICAgICAgcmV0dXJuIGZhbHNlOwo+Pj4+Pj4gIH0KPj4+Pj4+ICsKPj4+Pj4+ICtzdGF0
aWMgaW5saW5lIHVsb25nIGNsa19nZXRfaWQoY29uc3Qgc3RydWN0IGNsayAqY2xrKQo+Pj4+Pj4g
K3sKPj4+Pj4+ICsgICAgIHJldHVybiAwOwo+Pj4+Pj4gK30KPj4+Pj4+ICAjZW5kaWYgLyogQ09O
RklHX0lTX0VOQUJMRUQoQ0xLKSAqLwo+Pj4+Pj4KPj4+Pj4+ICAvKioKPj4+Pj4+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2Nsay1wcm92aWRlci5oIGIvaW5jbHVkZS9saW51eC9jbGstcHJv
dmlkZXIuaAo+Pj4+Pj4gaW5kZXggMjY3NzU3OTM5ZTAuLjJkNzU0ZmE0Mjg3IDEwMDY0NAo+Pj4+
Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9jbGstcHJvdmlkZXIuaAo+Pj4+Pj4gKysrIGIvaW5jbHVk
ZS9saW51eC9jbGstcHJvdmlkZXIuaAo+Pj4+Pj4gQEAgLTE1LDEwICsxNSwxNyBAQAo+Pj4+Pj4K
Pj4+Pj4+ICBzdHJ1Y3QgdWRldmljZTsKPj4+Pj4+Cj4+Pj4+PiArLyogdXBkYXRlIGNsb2NrIElE
IGZvciB0aGUgZGV2ID0gY2xvY2sgcHJvdmlkZXIsIGNvbXBhdGlibGUgd2l0aCBDTEtfQVVUT19J
RCAqLwo+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBkZXZfY2xrX2RtKGNvbnN0IHN0cnVjdCB1
ZGV2aWNlICpkZXYsIHVsb25nIGlkLCBzdHJ1Y3QgY2xrICpjbGspCj4+Pj4+PiArewo+Pj4+Pj4g
KyAgICAgaWYgKCFJU19FUlIoY2xrKSkKPj4+Pj4+ICsgICAgICAgICAgICAgY2xrLT5pZCA9IENM
S19JRChkZXYsIGlkKTsKPj4+Pj4+ICt9Cj4+Pj4+PiArCj4+Pj4+PiAgc3RhdGljIGlubGluZSB2
b2lkIGNsa19kbSh1bG9uZyBpZCwgc3RydWN0IGNsayAqY2xrKQo+Pj4+Pj4gIHsKPj4+Pj4+ICAg
ICAgIGlmICghSVNfRVJSKGNsaykpCj4+Pj4+PiAtICAgICAgICAgICAgIGNsay0+aWQgPSBpZDsK
Pj4+Pj4+ICsgICAgICAgICAgICAgY2xrLT5pZCA9IENMS19JRChjbGstPmRldiwgaWQpOwo+Pj4+
Pj4gIH0KPj4+Pj4+Cj4+Pj4+PiAgLyoKPj4+Pj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFy
ZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+Pj4+Pgo+Pj4+Cj4+Pj4gSSB0aGluayB5
b3Ugc2hvdWxkIGFzayB0byBiZSBwaWNrZWQgYnkgVG9tLiBJIGRvbid0IGhhdmUgb2JqZWN0aW9u
IG9uIHRoaXMgcGF0Y2gKPj4+Pgo+Pj4+IE1pY2hhZWwKPj4+Cj4+PiBIaSBNaWNoYWVsCj4+Pgo+
Pj4gRm9yIHdoaWNoIHJlYXNvbiA/Cj4+PiBGb3IgaW5mb3JtYXRpb24sIHRoaXMgc2VyaWVzIGhh
cyBiZWVuIHN1Ym1pdHRlZCB0byBDSSB0ZXN0IDogaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJv
b3QvY3VzdG9kaWFucy91LWJvb3Qtc3RtLy0vcGlwZWxpbmVzLzI2MzU4Cj4+PiB3aXRob3V0IGFu
eSBpc3N1ZS4KPj4KPj4gQmVjYXVzZSBJIGhhdmVuJ3Qgc2VlbiBhY3Rpdml0eSBvbiB0aGUgY2xv
Y2sgbWFpbnRhaW5lciBmb3IgbW9udGhzLgo+Pgo+IAo+IEkgdGhpbmsgeW91IG1pc3JlYWQgaXQg
KG9yIG15IGVuZ2xpc2ggd2FzIHJlYWxseSBiYWQpLiBBbnl3YXkgSSdtIGZpbmUKPiB3aXRoIHRo
aXMgY2hhbmdlCgpObyB3b3JyaWVzLCB5b3VyIGVuZ2xpc2ggaXMgY29ycmVjdCA7LSkKSSBqdXN0
IHdvbmRlcmVkIHdoeSB5b3UgcmVxdWVzdGVkIG1lIHRvIGFzayB0byBUb20gdG8gcGljayB1cCB0
aGlzIHBhdGNoLgoKWW91IGFyZSByaWdodCwgbm8gb25lIGVsc2UgcmVhY3RlZCB0byB0aGlzIHBh
dGNoLgoKVG9tLCAKCldpbGwgeW91IHBpY2sgdGhpcyBwYXRjaCBhbmQgYWxzbyBwYXRjaGVzIDUv
Ni83IHRvIGJlIGNvaGVyZW50IG9uIHlvdXIgc2lkZSA/CklmIG5vdCwgaSBleHBlY3QgdG8gc3Vi
bWl0IGEgU1RNMzIgcHVsbCByZXF1ZXN0IGJlZm9yZSBlbmQgb2YgdGhpcyB3ZWVrIGluY2x1ZGVk
IHRoZXNlIHBhdGNoZXMgPwoKVGhhbmtzClBhdHJpY2UKCj4gCj4gTWljaGFlbAo+IAo+IAo+PiBN
aWNoYWVsCj4+Cj4+Cj4+Pgo+Pj4gVGhhbmtzCj4+PiBQYXRyaWNlCj4+Pgo+Pj4+Cj4+Pj4+IFRo
YW5rcwo+Pj4+PiBQYXRyaWNlCj4+Pj4KPj4+Pgo+Pj4+Cj4+Cj4+Cj4+Cj4+IC0tCj4+IE1pY2hh
ZWwgTmF6emFyZW5vIFRyaW1hcmNoaQo+PiBDby1Gb3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9m
ZmljZXIKPj4gTS4gKzM5IDM0NyA5MTMgMjE3MAo+PiBtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4KPj4gQW1hcnVsYSBT
b2x1dGlvbnMgQlYKPj4gSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1zdGVyZGFtLCBO
TAo+PiBULiArMzEgKDApODUgMTExIDkxNzIKPj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+
PiB3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KPiAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
