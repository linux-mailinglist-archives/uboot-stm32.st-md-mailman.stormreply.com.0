Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF65520F63
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 10:06:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8E3FC5F1D3;
	Tue, 10 May 2022 08:06:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B35DC5EC6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 08:06:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A4jToq028024;
 Tue, 10 May 2022 10:06:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=O+j0uQyMbqqC2oBQPgnIhLSMVHPJcVgP0MnOJDCTVR0=;
 b=z+/RhNR4uVLrHuB1fZT/PoOM4LCietdWuof6kogTSkK7nqRKASB7x+3hDc5bgg5z0YGj
 94v/Cklls5Z7hKc3zqbMUkLD/0wV7jRYKKgvNdpNVUQS/aWUUTqmW3QxPnda9JQhpjV3
 rAuSyeFkGC9HdmmKd33/+QB7z+e1GK0k+NvrEKoIpSM622wGV++QjvXfwIj3oFVnedPv
 NLfySGOi7v/3ykm+7noLqn8EC8Fh7XUeoGKQHRxPE7Wpb4JHmQgtTn62Zy5FsXLYlEIv
 DvsGrJjvQDmEsy428sqWrpNGQWByKWOWeWXzKPk+G7bZlDxknp/tG59J9XCT6o3dU0le vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kprte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:06:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 913BB10002A;
 Tue, 10 May 2022 10:06:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B2072132C2;
 Tue, 10 May 2022 10:06:25 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 10:06:25 +0200
Message-ID: <73beca2a-517f-a951-98aa-f70b21d9e4ec@foss.st.com>
Date: Tue, 10 May 2022 10:06:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220422073831.15538-1-patrice.chotard@foss.st.com>
 <20220422073831.15538-2-patrice.chotard@foss.st.com>
 <3a8926cc-07ef-c26b-832d-25fca29e7b1b@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3a8926cc-07ef-c26b-832d-25fca29e7b1b@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] pinctrl: pinctrl_stm32: Use
 GPIOF_UNKNOWN to indicate not mapped pins
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

CgpPbiA1LzYvMjIgMTA6MzcsIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGksCj4gCj4gT24g
NC8yMi8yMiAwOTozOCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBHUElPRl9VTktOT1dOIGJl
Y29tZXMgYSB2YWxpZCBwaW4gbXV4aW5nIGluZm9ybWF0aW9uIHRvIGluZGljYXRlCj4+IHRoYXQg
YSBwaW4gaXMgbm90IG1hcHBlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJk
IDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiDCoCBkcml2ZXJzL3Bp
bmN0cmwvcGluY3RybF9zdG0zMi5jIHwgMiAtLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsX3N0bTMy
LmMgYi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybF9zdG0zMi5jCj4+IGluZGV4IDVkOGUxNTZkNjIu
LjM3M2Y1MWYwNDYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsX3N0bTMy
LmMKPj4gKysrIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmxfc3RtMzIuYwo+PiBAQCAtMjIwLDgg
KzIyMCw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfcGluY3RybF9nZXRfcGluX211eGluZyhzdHJ1Y3Qg
dWRldmljZSAqZGV2LAo+PiDCoCDCoMKgwqDCoMKgIHN3aXRjaCAobW9kZSkgewo+PiDCoMKgwqDC
oMKgIGNhc2UgR1BJT0ZfVU5LTk9XTjoKPj4gLcKgwqDCoMKgwqDCoMKgIC8qIHNob3VsZCBuZXZl
ciBoYXBwZW4gKi8KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiDCoMKgwqDC
oMKgIGNhc2UgR1BJT0ZfVU5VU0VEOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc25wcmludGYoYnVm
LCBzaXplLCAiJXMiLCBwaW5tdXhfbW9kZVttb2RlXSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBi
cmVhazsKPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCkFwcGxpZWQgdG8g
dS1ib290LXN0bTMyCgpUaGFua3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
