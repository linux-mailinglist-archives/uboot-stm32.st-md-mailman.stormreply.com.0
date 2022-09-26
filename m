Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 892855EABC9
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 17:56:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50BC5C5F1ED;
	Mon, 26 Sep 2022 15:56:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 460E4C5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:56:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QFLpsu025779;
 Mon, 26 Sep 2022 17:56:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=09wMQtE7QnDWAbLfKf1S6WLH7GUyQLXhKsFomzPyc5I=;
 b=fC8fsIcrmbB9jDEXFLYyR2+BK1EQmLXAx2S9c7Y8fcwUh3BBqU6K4m1nxPPt6tx8mB9K
 rNjp2MGVor0RSNUDUK4Fhl3zzMPEbyHftr6A1iZM4G8D47kohSGmUcLClJIopEOftZnK
 3fGNljxF2spDpjGgkFEcV0ThgF/06LtrufVPCM+9Xq4sl0IohXk2W2ztI+7qddEWSTqY
 oBau/s8zIDegnCgG3yT8BZ8p6Vx9B/n3nliKR/sUKRka+xLAeSI5JqFQwGYBVWbShVVs
 JKMZRLk4+fkHtEhwfv33fLhlButDb4h88G/53/ktRb/BX6SGI19WRdMr5RBp1TnXcoas Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsqam413f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 17:56:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 922D210002A;
 Mon, 26 Sep 2022 17:56:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E98A23BDFF;
 Mon, 26 Sep 2022 17:56:54 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 17:56:54 +0200
Message-ID: <01bece29-7afc-4612-8a7d-20b443370186@foss.st.com>
Date: Mon, 26 Sep 2022 17:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-8-patrice.chotard@foss.st.com>
 <01128599-d947-0057-9309-5fbd48e15b8e@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <01128599-d947-0057-9309-5fbd48e15b8e@foss.st.com>
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 7/7] configs: stm32f746-disco: Remove
 CONFIG_SYS_UBOOT_START flag
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

CgpPbiA5LzI2LzIyIDE1OjAyLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDkvMjAvMjIgMTg6MDQsIFBhdHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4gQnkgcHJlc3NpbmcgImMi
IGtleSBkdXJpbmcgU1BMIGV4ZWN1dGlvbiwgd2UgZm9yY2UgVS1ib290IGV4ZWN1dGlvbgo+PiBp
bnN0ZWFkIG9mIGEga2VybmVsIFhJUCBpbWFnZS4KPj4KPj4gVGhpcyBmaXhlcyBhIGhhcmQgZmF1
bHQgd2hlbiBib290aW5nIHN0bTMyZjc0Ni1kaXNjbyBpbiBTUEwgd2l0aCAiYyIKPj4ga2V5IHBy
ZXNzZWQgZHVyaW5nIFNQTCBleGVjdXRpb24uCj4+Cj4+IFUtQm9vdCBTUEwgMjAyMi4xMC1yYzUt
MDAwMDktZzQwZDAyYmFhOTEgKFNlcCAyMCAyMDIyIC0gMTc6MjE6MjEgKzAyMDApCj4+IFRyeWlu
ZyB0byBib290IGZyb20gWElQCj4+IEhhcmQgZmF1bHQKPj4gcGMgOiAwODAwODNmY8KgwqDCoCBs
ciA6IDA4MDAwZDFiwqDCoMKgIHhQU1IgOiAyMTAwMDAwMAo+PiByMTIgOiAyMDA0ZjEwOMKgwqAg
cjMgOiAwODAwODNmZMKgwqDCoCByMiA6IDAwMDAwMDI4Cj4+IHIxIDogMjAwNGYwYzjCoMKgwqAg
cjAgOiAyMDA0ZjBlNAo+PiBSZXNldHRpbmcgQ1BVIC4uLgo+Pgo+PiBUaGlzIGlzIGR1ZSB0byBT
WVNfVUJPT1RfU1RBUlQgZmxhZyBzZXQgdG8gMHgwODAwODNGRCB3aGljaCBpcyBub3QgY29ycmVj
dC4KPj4gSWYgdW5zZXQsIFNZU19VQk9PVF9TVEFSVCBpcyBzZXQgYnkgZGVmYXVsdCB0byBDT05G
SUdfU1lTX1RFWFRfQkFTRQo+PiB3aGljaCBtYXRjaCB3aXRoIG91ciByZXF1aXJlbWVudC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5z
dC5jb20+Cj4+IC0tLQo+Pgo+PiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPj4KPj4gwqAgaW5jbHVk
ZS9jb25maWdzL3N0bTMyZjc0Ni1kaXNjby5oIHwgMSAtCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJmNzQ2
LWRpc2NvLmggYi9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJmNzQ2LWRpc2NvLmgKPj4gaW5kZXggNjRj
MWJjN2Q0My4uYjBlYzIyNjExNCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9jb25maWdzL3N0bTMy
Zjc0Ni1kaXNjby5oCj4+ICsrKyBiL2luY2x1ZGUvY29uZmlncy9zdG0zMmY3NDYtZGlzY28uaAo+
PiBAQCAtMzQsNyArMzQsNiBAQAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCT09URU5W
Cj4+IMKgIMKgICNkZWZpbmUgQ09ORklHX1NZU19NT05JVE9SX0xFTsKgwqDCoMKgwqDCoMKgICg1
MTIgKiAxMDI0KQo+PiAtI2RlZmluZSBDT05GSUdfU1lTX1VCT09UX1NUQVJUwqDCoMKgwqDCoMKg
wqAgMHgwODAwODNGRAo+PiDCoCAjZGVmaW5lIENPTkZJR19TWVNfVUJPT1RfQkFTRcKgwqDCoMKg
wqDCoMKgIChDT05GSUdfU1lTX0ZMQVNIX0JBU0UgKyBcCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIENPTkZJR19TUExfUEFEX1RPKQo+PiDCoCAKPiAKPiAK
PiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3Nz
LnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCkFwcGxpZWQgdG8gdS1ib290LXN0bTMy
L25leHQKClRoYW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
