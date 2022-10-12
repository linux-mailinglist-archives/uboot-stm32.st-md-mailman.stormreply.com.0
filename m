Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8D5FC94C
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Oct 2022 18:29:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ABA0C640F3;
	Wed, 12 Oct 2022 16:29:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 478E7C640F2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 16:29:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CFmQWY005205;
 Wed, 12 Oct 2022 18:29:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8v3Mda9YWHVeqx/BXZWFKzrTpvvWXD5+zInozFcYAW0=;
 b=PXbY5EU0veY8rOtIJBNr5XE2ZgDCFlJbQr3omt5PPOMqPXgMWbE1QrTSMgVMiJsgSgXo
 d0IMlFfO609Zv2PQXZVWDTvUlg8NjTWjI3x/cFl1nm21RIrOR0A2Uu6+Ab8DmMAsVTIB
 mkwo0DD7oV0Clp0198upio2qiTSjh+tyqddCiudIEz3IInMBnqPILYfASYu2rqYuBnd4
 qWkY6VrdpShNd9DTT/4sL5CwLlLZvsFiBStLC5kHdq1YcsidYYwWPcvkvEfWYT1SC8kP
 2KmTEKwf7u58LJ9aMHGcate8TDZ2oc96lzZUTy+W8g3nqhakS/aNOiY/QyxTDXOKIgzs zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31exud61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 18:29:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8665910002A;
 Wed, 12 Oct 2022 18:29:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AD0E236937;
 Wed, 12 Oct 2022 18:29:17 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 18:29:16 +0200
Message-ID: <2814aee9-5157-4c0a-e7b7-49f4bbdad0dd@foss.st.com>
Date: Wed, 12 Oct 2022 18:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>, <u-boot@lists.denx.de>
References: <20221012123317.434898-1-gabriel.fernandez@foss.st.com>
 <20221012123317.434898-3-gabriel.fernandez@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20221012123317.434898-3-gabriel.fernandez@foss.st.com>
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_07,2022-10-12_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sean Anderson <seanga2@gmail.com>, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/3] clk: stm32mp13: introduce STM32MP13
	RCC driver
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

SGkgR2FicmllbCwKCk9uIDEwLzEyLzIyIDE0OjMzLCBHYWJyaWVsIEZlcm5hbmRleiB3cm90ZToK
PiBJbnRyb2R1Y2UgU1RNMzJNUDEzIFJDQyBkcml2ZXIgdXNpbmcgQ29tbW9uIENsb2NrIEZyYW1l
d29yay4KPgo+IFNpZ25lZC1vZmYtYnk6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5h
bmRlekBmb3NzLnN0LmNvbT4KPiAtLS0KPgo+ICAgZHJpdmVycy9jbGsvc3RtMzIvS2NvbmZpZyAg
ICAgICAgICB8ICAgMTUgKwo+ICAgZHJpdmVycy9jbGsvc3RtMzIvTWFrZWZpbGUgICAgICAgICB8
ICAgIDIgKwo+ICAgZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMyLWNvcmUuYyB8ICAzNDkgKysr
KysrCj4gICBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzItY29yZS5oIHwgIDE1NCArKysKPiAg
IGRyaXZlcnMvY2xrL3N0bTMyL2Nsay1zdG0zMm1wMTMuYyAgfCAgODM5ICsrKysrKysrKysrKysK
PiAgIGRyaXZlcnMvY2xrL3N0bTMyL3N0bTMybXAxM19yY2MuaCAgfCAxNzUxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgIDYgZmlsZXMgY2hhbmdlZCwgMzExMCBpbnNlcnRpb25zKCsp
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMyLWNvcmUu
Ywo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3N0bTMyL2Nsay1zdG0zMi1jb3Jl
LmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDEz
LmMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9zdG0zMi9zdG0zMm1wMTNfcmNj
LmgKPgoKUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9z
cy5zdC5jb20+ClRlc3RlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBm
b3NzLnN0LmNvbT4KCnRlc3RlZCBvbiBTVE0zMk1QMTM1Ri1ESyBib2FyZCwgc3RtMzJtcDEzX2Rl
ZmNvbmZpZy4KCkkgaGF2ZSBhIGRlcGVuZGVuY3kgd2l0aCBwYXRjaCAiZmlybXdhcmU6IHNjbWk6
IGZpeCB0aGUgbXVsdGkgY2hhbm5lbCAKc3VwcG9ydCB3aXRoIENDRiIKCmh0dHA6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjIwOTMwMDkzNjM1LjEuSTM4ZTY2
ZDc5MzUwYjM4MWI2MDU5YTZhODBjZTYwYzYyZjAxZjM4OTRAY2hhbmdlaWQvCgoKVGhpcyB0aGlz
IHBhdGNoIHRoZSBTRC1DYXJkIGJvb3QgaXMgT0sgd2l0aCAyIHRyYWNlcyA6CgoKMS0gYmVjYXVz
ZSBVU0JQSFkgaXMgbm90IHlldCBwcmVzZW50IGluIERUOgoKY2xrX3JlZ2lzdGVyOiBmYWlsZWQg
dG8gZ2V0IGNrX3VzYm9fNDhtIGRldmljZSAocGFyZW50IG9mIHVzYm9faykKCgoyLSB0aGUgY29u
c29sZSB0cmFjZSBpcyBwZXJ0dWJhdGVkIGJ5IFVBUlQgUkVTRVQgaW50cm9kdWN0aW9uIGluIERU
Cgo9PiB0aGUgVUFSVCBGSUZPIGlzIG5vdCBmbHVzaCBiZWZvcmUgdGhlIHByb2JlIGFmdGVyIHJl
bG9jYXRpb24KCiDCoMKgwqDCoMKgIGFuZCB0aGUgcmVzZXQgb2YgSFcgZGV2aWNlCgpDbG9ja3M6
Ci0gTVBVIDogNjUwIE1IegotIEFYSSA6IDI2Ni41MDAgTUh6Ci0gUEVSIDogMjQgTUh6Ci0gRERS
77+9Q29yZTrCoCAxNjUgZGV2aWNlcywgMjMgdWNsYXNzZXMsIGRldmljZXRyZWU6IGJvYXJkCk1N
QzrCoMKgIFNUTTMyIFNEL01NQzogMAoKCkZvciBpbmZvcm1hdGlvbiAiY2xrIGR1bXAiIGNvbW1h
bmQgY2F1c2UgYSBjcmFzaCBiZWNhdXNlIHRoZSBTQ01JIGNsb2NrCgphcmUgbm90IHByb2JlZCB3
aGVuIGNsa19nZXRfcmF0ZSBpcyB1c2VkLMKgIGJ1dCBJIHByZXBhcmUgYSBwYXRjaCB0byAKYXZv
aWQgdGhpcyBpc3N1ZS4KCgpUaGFua3MKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
