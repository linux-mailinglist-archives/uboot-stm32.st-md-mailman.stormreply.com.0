Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A654D01B
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Jun 2022 19:37:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A867C0D2BC;
	Wed, 15 Jun 2022 17:37:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45658C03FDD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 17:37:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FGR0iw025393;
 Wed, 15 Jun 2022 19:37:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+Hvzf7RbQa905BDNB8IYiHBVfiDBkIKPN1pASe4VGAY=;
 b=X10i+yMPVQkcsWA/vvA5f/dXBsO4zvsJXjoXQqLScjXtIHrE6+sRVboSagXlj4RgZEMS
 NrjkXrDyR3DP8bCI+NNvwfpKjR0e7wLz6UwlpTmjggWqBfEpP1QuxV2t1xrerRVHq7Bo
 98uSOwr1U06crjZXePODFkbMhHjQ/cMZk3pMdq3jpvwX7pfhSjCDHpAT5CUWHbOug04/
 JSsqL3VlBGoBPJSAphh7yn/V5UXDDdN1hy71kLrfKMlRE0bVp0vYE0WeweTZpRtiOt8b
 n77z0bYaJ3jxuIWK2Gjj1RgBrYm/dPIyBfBBHqex/F/kKQgaT4PtWmYmgZtrhNhaKrSM 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gp2tyt0ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jun 2022 19:37:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A0BE910002A;
 Wed, 15 Jun 2022 19:37:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8CB1623150D;
 Wed, 15 Jun 2022 19:37:47 +0200 (CEST)
Received: from [10.48.0.213] (10.48.0.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 15 Jun
 2022 19:37:46 +0200
Message-ID: <6cbcfaa1-c207-fe5f-2013-3c4e354487de@foss.st.com>
Date: Wed, 15 Jun 2022 19:37:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220615174852.1.I9cc1b8d493af70f2d448bea518372ab7c29afc50@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220615174852.1.I9cc1b8d493af70f2d448bea518372ab7c29afc50@changeid>
X-Originating-IP: [10.48.0.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_14,2022-06-15_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp: cleanup the stm32mp15
	file
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

SGksCgpPbiA2LzE1LzIyIDE3OjQ4LCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+IENsZWFuIHRo
ZSBjb21tZW50cyBpbiBzdG0zMm1wMTVfY29tbW9uLmggZmlsZQo+IGFmdGVyIG1vdmUgQ09ORklH
XyB0byBLY29uZmlnOgo+IC0gQ09ORklHX1NZU19DQlNJWkUKPiAtIENPTkZJR19TWVNfU1BMX01B
TExPQ19TVEFSVCBhbmQgQ09ORklHX1NZU19TUExfTUFMTE9DX1NJWkUKPgo+IFNpZ25lZC1vZmYt
Ynk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gLS0t
Cj4KPiAgIGluY2x1ZGUvY29uZmlncy9zdG0zMm1wMTVfY29tbW9uLmggfCA3ICstLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2NvbmZpZ3Mvc3RtMzJtcDE1X2NvbW1vbi5oIGIvaW5jbHVkZS9jb25m
aWdzL3N0bTMybXAxNV9jb21tb24uaAo+IGluZGV4IDA4YTcyNDgzYmYuLmM3YjIwMGQ0YjEgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9jb25maWdzL3N0bTMybXAxNV9jb21tb24uaAo+ICsrKyBiL2lu
Y2x1ZGUvY29uZmlncy9zdG0zMm1wMTVfY29tbW9uLmgKPiBAQCAtMTUsMTAgKzE1LDYgQEAKPiAg
ICAqLwo+ICAgI2RlZmluZSBDT05GSUdfU1lTX1NEUkFNX0JBU0UJCQlTVE0zMl9ERFJfQkFTRQo+
ICAgCj4gLS8qCj4gLSAqIENvbnNvbGUgSS9PIGJ1ZmZlciBzaXplCj4gLSAqLwo+IC0KPiAgIC8q
Cj4gICAgKiBGb3IgYm9vdGluZyBMaW51eCwgdXNlIHRoZSBmaXJzdCAyNTYgTUIgb2YgbWVtb3J5
LCBzaW5jZSB0aGlzIGlzCj4gICAgKiB0aGUgbWF4aW11bSBtYXBwZWQgYnkgdGhlIExpbnV4IGtl
cm5lbCBkdXJpbmcgaW5pdGlhbGl6YXRpb24uCj4gQEAgLTMwLDExICsyNiwxMCBAQAo+ICAgCj4g
ICAvKiBTUEwgc3VwcG9ydCAqLwo+ICAgI2lmZGVmIENPTkZJR19TUEwKPiAtLyogU1BMIHVzZSBE
RFIgKi8KPiAtCj4gICAvKiBSZXN0cmljdCBTUEwgdG8gZml0IHdpdGhpbiBTWVNSQU0gKi8KPiAg
ICNkZWZpbmUgU1RNMzJfU1lTUkFNX0VORAkJKFNUTTMyX1NZU1JBTV9CQVNFICsgU1RNMzJfU1lT
UkFNX1NJWkUpCj4gICAjZW5kaWYgLyogI2lmZGVmIENPTkZJR19TUEwgKi8KPiArCgphZnRlciBj
aGVjayB0aGUgZGVmaW5lIFNUTTMyX1NZU1JBTV9FTkQgaXMgbm8gbW9yZSB1c2VkID0+IHRvIHJl
bW92ZQoKaSB3YXMgb25seSB1c2VkIGluIGEgZGVmaW5lIHJlbW92ZWQgaW4gY29uZmlnIGZpbGUg
YWZ0ZXIgbWlncmF0aW9uIHRvIEtjb25maWcKCiNkZWZpbmUgQ09ORklHX1NQTF9NQVhfRk9PVFBS
SU5UwqDCoMKgIChTVE0zMl9TWVNSQU1fRU5EIC0gCkNPTkZJR19TUExfVEVYVF9CQVNFKQoKCj4g
ICAvKk1NQyBTRCovCj4gICAjZGVmaW5lIENPTkZJR19TWVNfTU1DX01BWF9ERVZJQ0UJMwo+ICAg
CgoKUmVnYXJkcwoKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
