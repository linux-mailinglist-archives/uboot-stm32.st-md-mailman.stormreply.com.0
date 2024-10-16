Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 179DE9A1168
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2024 20:19:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D17CEC78032;
	Wed, 16 Oct 2024 18:19:04 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E994C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:18:59 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GCuhRh018118;
 Wed, 16 Oct 2024 20:18:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ao3CsPhF4oyDM7f+tidgYIPClyLxjxGFj6rxwuraA/g=; b=5TS5nmuD9FgJaPH+
 0QsVZ6f0v2/2rnO3Dl2kZlWSTDMqa8Y9TGEWOOX6Q+2xQy4MyXNmw9DS2tDsrAVa
 i1YXvHjsXXMAbTQU364DYl7aOuQpzY8ud8Ol4glESGSWGvrVahRavBJTo0vH4hrW
 iHSTEL2r60fZlefr7qOnbv5YhkXBFHpbSwCCgGSFEfsGiXFpJxBsdPgrLVbJePs0
 tkMsckYote93GQEPH0Uq6JekxPCJkSskXJvyv11B/W+Ysr3fJCJcAeN7NQrtb88l
 bEMyyVPMHL0YT2s2+O5WjskbGPtXDZ+dwTecbK581OsydiaIFpEp1kdQ4gIGZozQ
 ySx6ug==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42842jh81x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 20:18:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 83F924009C;
 Wed, 16 Oct 2024 20:17:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22BDF26B63D;
 Wed, 16 Oct 2024 20:15:38 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 20:15:37 +0200
Message-ID: <3a4f1296-307d-401e-ace2-4bfd6729bd2e@foss.st.com>
Date: Wed, 16 Oct 2024 20:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241005011647.436456-1-marex@denx.de>
 <20241005011647.436456-3-marex@denx.de>
 <55842cb0-5199-429a-8e92-5bac71dea67c@foss.st.com>
Content-Language: en-US
In-Reply-To: <55842cb0-5199-429a-8e92-5bac71dea67c@foss.st.com>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] ARM: dts: stm32: Generate
 u-boot.itb using binman on DH STM32 DHSOM
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

SGksCgpPbiAxMC8xMS8yNCAyMDoxNSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPgo+
IE9uIDEwLzUvMjQgMDM6MTUsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBEZXNjcmliZSB0aGUgdS1i
b290Lml0cyBnZW5lcmF0aW9uIGluIHN0bTMybXAxNXh4LWRoc29tLXUtYm9vdC5kdHNpCj4+IGJp
bm1hbiB7fSBEVCBub2RlIGFzIGEgcmVwbGFjZW1lbnQgZm9yIGN1cnJlbnQgQ09ORklHX1NQTF9G
SVRfU09VUkNFCj4+IHVzZSwgZGlzcG9zZSBvZiBib3RoIHUtYm9vdC1kaGNvbS5pdHMgYW5kIHUt
Ym9vdC1kaGNvci5pdHMuCj4+Cj4+IFVzZSBmZHQtU0VRL2NvbmZpZy1TRVEgdG8gZ2VuZXJhdGUg
YSBsaXN0IG9mIGZkdC1OIGZpdEltYWdlIGltYWdlcyB7fSAKPj4gYW5kCj4+IG1hdGNoaW5nIGNv
bmZpZ3VyYXRpb24ge30gbm9kZSBlbnRyaWVzLiBUaGUgY29uZmlndXJhdGlvbiBub2RlIGVudHJ5
IAo+PiBuYW1lcwo+PiBubyBsb25nZXIgZW5jb2RlIF9zb21yZXZOX2JvYXJkcmV2TiBzdWZmaXgs
IHdoaWNoIHdhcyBuZXZlciByZWFsbHkgCj4+IHVzZWQsIHNvCj4+IGRyb3AgdGhpcyBmdW5jdGlv
bmFsaXR5IGJ5IGRlZmF1bHQuIFJld29yayAKPj4gYm9hcmRfZml0X2NvbmZpZ19uYW1lX21hdGNo
KCkgdG8KPj4gbWF0Y2ggb24gdGhlIG5ldyBjb25maWd1cmF0aW9uIG5vZGUgZW50cnkgbmFtZXMu
Cj4+Cj4+IFVzZXJzIHdobyBkbyBuZWVkIHRoZSBtYXRjaCBvbiBfc29tcmV2Tl9ib2FyZHJldk4g
Y2FuIGVpdGhlciByZXBsYWNlIHRoZQo+PiBmZHQtU0VRL2NvbmZpZy1TRVEgd2l0aCBmaXhlZCBm
ZHQtTi9jb25maWctTiBub2RlcyB3aGljaCBlYWNoIGVuY29kZSB0aGUKPj4gbWF0Y2hpbmcgJ2Rl
c2NyaXB0aW9uID0gIk5BTUVfc29tcmV2Tl9ib2FyZHJldk4iJyB0byByZXN0b3JlIHRoZSBvbGQK
Pj4gYmVoYXZpb3IgdmVyYmF0aW0sIG9yIGJldHRlciB1c2UgU1BMIERUIG92ZXJsYXlzIGZvciBV
LUJvb3QgY29udHJvbCBEVAo+PiB0aGUgc2FtZSB3YXkgZS5nLiBpLk1YOE1QIERIQ09NIGRvZXMg
dG8gc3VwcG9ydCBtdWx0aXBsZSBTb00gYW5kIGJvYXJkCj4+IHZhcmlhbnRzLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gLS0tCj4+IENjOiBQYXRy
aWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gQ2M6IFBhdHJpY2sg
RGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IENjOiBTZWFuIEFuZGVy
c29uIDxzZWFuZ2EyQGdtYWlsLmNvbT4KPj4gQ2M6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0u
b3JnPgo+PiBDYzogVG9tIFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4KPj4gQ2M6IHUtYm9vdEBk
aC1lbGVjdHJvbmljcy5jb20KPj4gQ2M6IHUtYm9vdEBsaXN0cy5kZW54LmRlCj4+IENjOiB1Ym9v
dC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IC0tLQo+PiBWMjogTm8gY2hh
bmdlCj4+IC0tLQo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb20tdS1ib290LmR0
c2nCoMKgwqAgfMKgIDEgKwo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItdS1i
b290LmR0c2nCoMKgwqAgfMKgIDEgKwo+PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1eHgtZGhz
b20tdS1ib290LmR0c2nCoMKgwqAgfCA1MyArKysrKysrKysrKwo+PiDCoCBib2FyZC9kaGVsZWN0
cm9uaWNzL2RoX3N0bTMybXAxL2JvYXJkLmPCoMKgwqDCoMKgwqAgfCAxOSArKystCj4+IMKgIC4u
Li9kaF9zdG0zMm1wMS91LWJvb3QtZGhjb20uaXRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCA5MSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgIC4uLi9kaF9zdG0zMm1wMS91LWJvb3QtZGhj
b3IuaXRzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA3MCAtLS0tLS0tLS0tLS0tLQo+PiDC
oCBjb25maWdzL3N0bTMybXAxNV9kaGNvbV9iYXNpY19kZWZjb25maWfCoMKgwqDCoMKgwqAgfMKg
IDIgLQo+PiDCoCBjb25maWdzL3N0bTMybXAxNV9kaGNvcl9iYXNpY19kZWZjb25maWfCoMKgwqDC
oMKgwqAgfMKgIDIgLQo+PiDCoCA4IGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDE2
OSBkZWxldGlvbnMoLSkKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9zdG0z
Mm1wMTV4eC1kaHNvbS11LWJvb3QuZHRzaQo+PiDCoCBkZWxldGUgbW9kZSAxMDA2NDQgYm9hcmQv
ZGhlbGVjdHJvbmljcy9kaF9zdG0zMm1wMS91LWJvb3QtZGhjb20uaXRzCj4+IMKgIGRlbGV0ZSBt
b2RlIDEwMDY0NCBib2FyZC9kaGVsZWN0cm9uaWNzL2RoX3N0bTMybXAxL3UtYm9vdC1kaGNvci5p
dHMKPj4KPgo+IE5pY2UsCj4gSSBkaXNjb3ZlciB0aGUgYmlubWFuIEZJVCBTdWJzdGl0dXRpb25z
IHdpdGggTiAvIFNFUQo+Cj4KPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmlj
ay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPgo+IFRoYW5rcwo+IFBhdHJpY2sKPgo+CgpBcHBsaWVk
IHRvIHUtYm9vdC1zdG0vbWFzdGVyLCB0aGFua3MhCgpSZWdhcmRzClBhdHJpY2sKCj4KPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
