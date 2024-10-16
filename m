Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 262EC9A116A
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2024 20:19:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3B36C78032;
	Wed, 16 Oct 2024 18:19:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B92AFC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:19:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GDWlXk011442;
 Wed, 16 Oct 2024 20:18:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UOhz6TaqMQJKfNF2jOZ0xgysoE5O7+DZGplRdIL+xrM=; b=50ZK/NT4LEu/PYWO
 WNYJzTB2Ogq0OosczAS8h6IxVXnWfU/ID1YUhVRy4nO5fUhtwM2kRioDoFMz3e/K
 aOXgQeiGH/JvHXLexDYdHvTkcBvhUceshOhU+3Xx6SwvW6JEESNJFOxiQFvd3ek2
 SRKlRPjXGpatKz0bvEHsIubPErtptleGvrcdbDeUsQinbDqWuIdzbuk0ykEI6g0d
 jyHwsqlyoY8DfEVEZNcURPMt9eyTvMN/o2PwCVnAg2gsw207VXBzjJLjWsE4Rt8R
 BKuMhxk0ZUQhrMOpLI73x7dPdxqm4wqSgLkYVTBizH56PXaxdpscy/AujdZoo/PT
 Lytofw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 429qybex57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2024 20:18:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EB842400B9;
 Wed, 16 Oct 2024 20:17:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0839E26E52A;
 Wed, 16 Oct 2024 20:16:08 +0200 (CEST)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 16 Oct
 2024 20:16:07 +0200
Message-ID: <e80ce86a-cfba-451c-be7e-f6c498cc66c6@foss.st.com>
Date: Wed, 16 Oct 2024 20:16:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241005011647.436456-1-marex@denx.de>
 <4c1eabf9-5919-4a45-ba2d-4441e76a9bd6@foss.st.com>
Content-Language: en-US
In-Reply-To: <4c1eabf9-5919-4a45-ba2d-4441e76a9bd6@foss.st.com>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] ARM: dts: stm32: Duplicate
 cpu0-opp-table node into stm32mp15-u-boot.dtsi
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

SGksCgpPbiAxMC8xMS8yNCAxOTo1NywgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPgo+
IE9uIDEwLzUvMjQgMDM6MTUsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBUaGUgY3B1MC1vcHAtdGFi
bGUge30gbm9kZSBkb2VzIG5vdCBleGlzdCBpbiB1cHN0cmVhbSBMaW51eCAKPj4gc3RtMzJtcDE1
MS5kdHNpCj4+IGZpbGUsIGluIG9yZGVyIHRvIGVuYWJsZSBjb252ZXJzaW9uIHRvIE9GX1VQU1RS
RUFNLCBkdXBsaWNhdGUgdGhlIAo+PiBub2RlIGZyb20KPj4gY3VycmVudCBVLUJvb3Qgc3RtMzJt
cDE1MS5kdHNpIGludG8gc3RtMzJtcDE1LXUtYm9vdC5kdHNpLiBUaGlzIG1ha2VzIAo+PiBTVE0z
Mgo+PiBEVHMgYnVpbGRhYmxlIGV2ZW4gd2l0aCBPRl9VUFNUUkVBTSBlbmFibGVkLiBObyBmdW5j
dGlvbmFsIGNoYW5nZSwgCj4+IHNpbmNlIHRoZQo+PiBjdXJyZW50IFUtQm9vdCBzdG0zMm1wMTUx
LmR0c2kgYWxyZWFkeSBjb250YWlucyB0aGUgY3B1MC1vcHAtdGFibGUge30gCj4+IG5vZGUsCj4+
IHN0bTMybXAxNS11LWJvb3QuZHRzaSBpcyBhcHBsaWVkIGF0IHRoZSBlbmQsIGFuZCBkb2VzIG5v
dCBicmluZyBpbiAKPj4gYW55IG5ldwo+PiBjb250ZW50Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBN
YXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gLS0tCj4+IENjOiBQYXRyaWNlIENob3RhcmQg
PHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBh
dHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IENjOiBTZWFuIEFuZGVyc29uIDxzZWFuZ2Ey
QGdtYWlsLmNvbT4KPj4gQ2M6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgo+PiBDYzog
VG9tIFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4KPj4gQ2M6IHUtYm9vdEBkaC1lbGVjdHJvbmlj
cy5jb20KPj4gQ2M6IHUtYm9vdEBsaXN0cy5kZW54LmRlCj4+IENjOiB1Ym9vdC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IC0tLQo+PiBWMjogTm8gY2hhbmdlCj4+IC0tLQo+
PiDCoCBhcmNoL2FybS9kdHMvc3RtMzJtcDE1LXUtYm9vdC5kdHNpIHwgMzAgKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQo+Pgo+IC4uLi4KPgo+Cj4gU29ycnkgZm9yIHByZXZpb3VzIG1lc3Nh
Z2UsCj4KPiBSZTogW1BBVENIIDEvM10gQVJNOiBkdHM6IHN0bTMyOiBEdXBsaWNhdGUgY3B1MC1v
cHAtdGFibGUgbm9kZSBpbnRvIAo+IHN0bTMybXAxNS11LWJvb3QuZHRzaQo+Cj4gSSBhbnN3ZXJl
ZCBvbiBWMSBieSBlcnJvci4KPgo+Cj4KPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPgo+IFRoYW5rcwo+IFBhdHJpY2sKCgpBcHBs
aWVkIHRvIHUtYm9vdC1zdG0vbWFzdGVyLCB0aGFua3MhCgpSZWdhcmRzClBhdHJpY2sKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
