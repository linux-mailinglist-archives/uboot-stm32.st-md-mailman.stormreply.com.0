Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C89465EA0F
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Jan 2023 12:38:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D70E7C69067;
	Thu,  5 Jan 2023 11:38:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA2DBC03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jan 2023 11:38:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3059sYj6024071; Thu, 5 Jan 2023 12:38:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gHM3VJyGfSfkQUzZhAOOCsSjZH566/EB5Jn9Bz0rE8M=;
 b=ykn8InafwKckU6OUIr4hhFm7PEE0XN9FBQzQe2LEtidOm+3KRl3jXeocMe40Mc2PfvAI
 6WeiyQbXnqRiuBB+tpNq4Ph22QDeBnY7390NQfOdpJ10jm8fABLljxcI5jxzes1GMl8s
 1rb8WzgwWY7GDGc/X2mnTVny5Hl2Ar9WdZ71Zb7q98y9mf1gLVJR3DUFReXnNfCifgtA
 dOMqZWO3QGTBjV1AzZcVHUcJ7YGjDv3kA+89GYRfCDbQYqUeI9wAUCnIjiJYqF2dwiwB
 Y9hRk07RIhnnuIsL2jJN8dLoayD6DWOaXzUgCvQ32v2TsFuylG8Jo70Xoyv5ynE8yeNG FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mwuw28u2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 12:38:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0DEC110002A;
 Thu,  5 Jan 2023 12:38:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC71F22FA55;
 Thu,  5 Jan 2023 12:38:01 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 5 Jan
 2023 12:37:58 +0100
Message-ID: <89f414c5-306d-8a10-9a72-f32381ec593e@foss.st.com>
Date: Thu, 5 Jan 2023 12:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>
References: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
 <20230103203504.GM3787616@bill-the-cat>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230103203504.GM3787616@bill-the-cat>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-04_02,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] fastboot: remove #ifdef CONFIG when it is
	possible
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

SGkgVG9tLAoKT24gMS8zLzIzIDIxOjM1LCBUb20gUmluaSB3cm90ZToKPiBPbiBUaHUsIERlYyAx
NSwgMjAyMiBhdCAxMDoxNTo1MEFNICswMTAwLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBN
dWNoIG9mIHRoZSBmYXN0Ym9vdCBjb2RlIHByZWRhdGVzIHRoZSBpbnRyb2R1Y3Rpb24gb2YgS2Nv
bmZpZyBhbmQKPj4gaGFzIHF1aXRlIGEgZmV3ICNpZmRlZnMgaW4gaXQgd2hpY2ggaXMgdW5uZWNl
c3Nhcnkgbm93IHRoYXQgd2UgY2FuIHVzZQo+PiBJU19FTkFCTEVEKCkgZXQgYWwuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5j
b20+Cj4+IC0tLQo+Pgo+PiAgIGNtZC9mYXN0Ym9vdC5jICAgICAgICAgICAgICAgICAgfCAgMzUg
KysrKystLS0tLS0KPj4gICBkcml2ZXJzL2Zhc3Rib290L2ZiX2NvbW1hbmQuYyAgIHwgMTA0ICsr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgZHJpdmVycy9mYXN0Ym9vdC9mYl9j
b21tb24uYyAgICB8ICAxMSArKy0tCj4+ICAgZHJpdmVycy9mYXN0Ym9vdC9mYl9nZXR2YXIuYyAg
ICB8ICA0OSArKysrKystLS0tLS0tLS0KPj4gICBkcml2ZXJzL3VzYi9nYWRnZXQvZl9mYXN0Ym9v
dC5jIHwgICA3ICstLQo+PiAgIGluY2x1ZGUvZmFzdGJvb3QuaCAgICAgICAgICAgICAgfCAgMTMg
LS0tLQo+PiAgIG5ldC9mYXN0Ym9vdC5jICAgICAgICAgICAgICAgICAgfCAgIDggKy0tCj4+ICAg
NyBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspLCAxNDUgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9jbWQvZmFzdGJvb3QuYyBiL2NtZC9mYXN0Ym9vdC5jCj4+IGluZGV4IGI0
OThlNGIyMmJiMy4uYjk0ZGJkNTQ4ODQzIDEwMDY0NAo+PiAtLS0gYS9jbWQvZmFzdGJvb3QuYwo+
PiArKysgYi9jbWQvZmFzdGJvb3QuYwo+PiBAQCAtMTksOCArMTksMTQgQEAKPj4gICBzdGF0aWMg
aW50IGRvX2Zhc3Rib290X3VkcChpbnQgYXJnYywgY2hhciAqY29uc3QgYXJndltdLAo+PiAgIAkJ
CSAgIHVpbnRwdHJfdCBidWZfYWRkciwgc2l6ZV90IGJ1Zl9zaXplKQo+PiAgIHsKPj4gLSNpZiBD
T05GSUdfSVNfRU5BQkxFRChVRFBfRlVOQ1RJT05fRkFTVEJPT1QpCj4+IC0JaW50IGVyciA9IG5l
dF9sb29wKEZBU1RCT09UKTsKPj4gKwlpbnQgZXJyOwo+PiArCj4+ICsJaWYgKCFDT05GSUdfSVNf
RU5BQkxFRChVRFBfRlVOQ1RJT05fRkFTVEJPT1QpKSB7Cj4+ICsJCXByX2VycigiRmFzdGJvb3Qg
VURQIG5vdCBlbmFibGVkXG4iKTsKPj4gKwkJcmV0dXJuIENNRF9SRVRfRkFJTFVSRTsKPj4gKwl9
Cj4+ICsKPj4gKwllcnIgPSBuZXRfbG9vcChGQVNUQk9PVCk7Cj4+ICAgCj4+ICAgCWlmIChlcnIg
PCAwKSB7Cj4+ICAgCQlwcmludGYoImZhc3Rib290IHVkcCBlcnJvcjogJWRcbiIsIGVycik7Cj4+
IEBAIC0yOCwyMSArMzQsMjEgQEAgc3RhdGljIGludCBkb19mYXN0Ym9vdF91ZHAoaW50IGFyZ2Ms
IGNoYXIgKmNvbnN0IGFyZ3ZbXSwKPj4gICAJfQo+PiAgIAo+PiAgIAlyZXR1cm4gQ01EX1JFVF9T
VUNDRVNTOwo+PiAtI2Vsc2UKPj4gLQlwcl9lcnIoIkZhc3Rib290IFVEUCBub3QgZW5hYmxlZFxu
Iik7Cj4+IC0JcmV0dXJuIENNRF9SRVRfRkFJTFVSRTsKPj4gLSNlbmRpZgo+PiAgIH0KPiBUaGlz
IHByb2JhYmx5IG5lZWRzIHRvIGJlY29tZSBhbiBpZiAoQ09ORklHX0lTX0VOQUJMRUQoLi4uKSkg
eyAuLi4gfQo+IGVsc2UgeyAuLi4gfSBpbiBvcmRlciB0byByZW1haW4gc2l6ZS1uZXV0cmFsLgoK
CkFyZSB5b3Ugc3VyZSA/CgoKewogwqDCoMKgIGlmICghQ09ORklHX0lTX0VOQUJMRUQoVURQX0ZV
TkNUSU9OX0ZBU1RCT09UKSkgewogwqDCoMKgIMKgwqDCoCAuLi4uCiDCoMKgwqAgwqDCoMKgIHJl
dHVybiBDTURfUkVUX0ZBSUxVUkU7CiDCoMKgwqAgfQoKIMKgwqDCoCAuLi4uCgogwqDCoMKgIHJl
dHVybiBDTURfUkVUX1NVQ0NFU1M7Cn0KCgpGb3IgbWUsIGl0IGlzIGV4YWN0bHkgdGhlIHNhbWUg
c2l6ZSBhZnRlciBjb21waWxlci9saW5rZXIgdGhhbiA6CgoKewogwqDCoMKgIGlmICghQ09ORklH
X0lTX0VOQUJMRUQoVURQX0ZVTkNUSU9OX0ZBU1RCT09UKSkgewogwqDCoMKgIMKgwqDCoCAuLi4u
CiDCoMKgwqAgwqDCoMKgIHJldHVybiBDTURfUkVUX0ZBSUxVUkU7CiDCoMKgwqAgfSBlbHNlIHsK
IMKgwqDCoCAuLi4uCiDCoMKgwqAgwqDCoMKgwqDCoCByZXR1cm4gQ01EX1JFVF9TVUNDRVNTOwoK
IMKgwqDCoCB9Cgp9CgoKaWYgVURQX0ZVTkNUSU9OX0ZBU1RCT09UaXMgYWN0aXZhdGVkIG9yIG5v
dC4uLi4KCm9yIEkgZm9yZ2V0IHNvbWV0aGluZyBkdXJpbmcgdGhlIENocmlzdG1hcyBicmVhay4K
CgpQYXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
