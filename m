Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D42F49C5637
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2024 12:21:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B4CBC78F81;
	Tue, 12 Nov 2024 11:21:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA9F8C78F80
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 11:20:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC8eDR7015347;
 Tue, 12 Nov 2024 12:20:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ByEcfjPYg0Kw06IszMP32pAnPEPT0wc4fVGhGD+GTuk=; b=df+5ov47/0erPVAv
 /QtG6j7r2UNzwJ7CVmpDwcJ6W2fa0LzRDRV33Pz9CG3NXVa6Ym2wke/Sg8PeK6uM
 QQyEBI/l11348WAhsydtc2ubTYGEQ3DnPLwIu/gOwfmO9ULQnqi4i2WEwv4oU9qc
 RhB388nT5ZFgVRGx0Vfkfw82wZHK4KbdIkKhNYySy4cTNzFdPEbsPbb1YhcsntrJ
 YtjKjM4hh8yLz/Zff4sEJHm6phbbZdRhZ6z1yg5tGjryxjWLr+n1VX6j8g7LZTKT
 HqAfOtREsDOnLXZFTBHufYyfu6Ob+kCrTnNEe2kFR3p6WLyfaxLBzsVGJwoMDP23
 4IReuQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42syggkgrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2024 12:20:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6E34640076;
 Tue, 12 Nov 2024 12:19:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2AAC929FACB;
 Tue, 12 Nov 2024 12:18:55 +0100 (CET)
Received: from [10.48.86.243] (10.48.86.243) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 12 Nov
 2024 12:18:54 +0100
Message-ID: <e27167fa-5d65-40b4-92d7-27bfcba1e2b3@foss.st.com>
Date: Tue, 12 Nov 2024 12:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20241102221737.547938-1-sjg@chromium.org>
 <20241102221737.547938-9-sjg@chromium.org>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20241102221737.547938-9-sjg@chromium.org>
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 08/25] st: stm32f429: Drop old LED code
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

SGksCgpPbiAxMS8yLzI0IDIzOjE3LCBTaW1vbiBHbGFzcyB3cm90ZToKPiBUaGlzIHByZWRhdGVz
IHRoZSBMRUQgZnJhbWV3b3JrLCBzbyBkcm9wIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU2ltb24g
R2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4KPiAobm8gY2hhbmdlcyBzaW5jZSB2MSkK
Pgo+ICAgYm9hcmQvc3Qvc3RtMzJmNDI5LWRpc2NvdmVyeS9NYWtlZmlsZSB8ICAxIC0KPiAgIGJv
YXJkL3N0L3N0bTMyZjQyOS1kaXNjb3ZlcnkvbGVkLmMgICAgfCAzOSAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDAgZGVsZXRpb25zKC0pCj4gICBkZWxl
dGUgbW9kZSAxMDA2NDQgYm9hcmQvc3Qvc3RtMzJmNDI5LWRpc2NvdmVyeS9sZWQuYwo+Cj4KVGhh
bmtzCgpmb3IgaW5mb3JtYXRpb24gTEVEcyBhcmUgYWxzbyBkZWZpbmVkIGluIGRldmljZSB0cmVl
OiAKYXJjaC9hcm0vZHRzL3N0bTMyZjQyOS1kaXNjby5kdHMKCiDCoMKgwqAgbGVkcyB7CiDCoMKg
IMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsKIMKgwqAgwqDCoMKgwqAgbGVkLXJl
ZCB7CiDCoMKgIMKgwqDCoMKgIMKgwqDCoCBncGlvcyA9IDwmZ3Bpb2cgMTQgMD47CiDCoMKgIMKg
wqDCoMKgIH07CiDCoMKgIMKgwqDCoMKgIGxlZC1ncmVlbiB7CiDCoMKgIMKgwqDCoMKgIMKgwqDC
oCBncGlvcyA9IDwmZ3Bpb2cgMTMgMD47CiDCoMKgIMKgwqDCoMKgIMKgwqDCoCBsaW51eCxkZWZh
dWx0LXRyaWdnZXIgPSAiaGVhcnRiZWF0IjsKIMKgwqAgwqDCoMKgwqAgfTsKIMKgwqAgwqB9OwoK
CmJ1dCB0b2RheSB0aGUgQ09ORklHX0xFRF9HUElPPXkgaXMgbWlzc2luZyBpbiAKY29uZmlncy9z
dG0zMmY0MjktZGlzY292ZXJ5X2RlZmNvbmZpZwoKdG8gcmVzdG9yZSB0aGUgTEVEIHN1cHBvcnQg
b24gdGhpcyBib2FyZAoKClJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRl
bGF1bmF5QGZvc3Muc3QuY29tPgoKClRoYW5rcwpQYXRyaWNrCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
