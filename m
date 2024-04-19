Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 582138AAE48
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:17:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23F4DC6DD72;
	Fri, 19 Apr 2024 12:17:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFB01C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:17:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9VfCb030184; Fri, 19 Apr 2024 14:17:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=5xrVbsIQfDnasUkpmSCcvgBgO5h80twGS3DNuF5LRdU=; b=xX
 QyLr76EuCHt8o3IdIiLY3aPmDG+dZZUGxxWnhlCHHvndw0Kn4hNMSeZ4hboqTxN3
 XGa8wFwN3qejJoVAN+TjRTnU8xb8fltaNTEnrrgfaKdTzQVHSeAsBoM8js4usbvd
 cNQMkODRsWD4M5VJ2oauDNK8t9xDhsKmrppmY/ODV5PlHpy12/wQmP96UgbRoSpj
 9LvCRIYR/jBVqwpbL6ICEvkgPmMkjSaEpW8sPzdiQ1oLg5w5uKE/Fm9rQOFrjFaQ
 xIuowTrCuvgNGVF37fUZEIvevDbRBHnSjJeDkw0QBk7AsRYYZi8B2qZSODwtCAyt
 yGboKiSimm+sy3MJ2MiQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xgecyrbj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:17:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CB13540044;
 Fri, 19 Apr 2024 14:16:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9CDB021A200;
 Fri, 19 Apr 2024 14:16:38 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:16:38 +0200
Message-ID: <de2a436b-8d98-49c8-9311-a896dc13cc16@foss.st.com>
Date: Fri, 19 Apr 2024 14:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240409150215.2497778-1-patrice.chotard@foss.st.com>
 <20240409150215.2497778-5-patrice.chotard@foss.st.com>
 <af1c7071-3dc2-451b-aed6-61d6b2ea3e4a@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <af1c7071-3dc2-451b-aed6-61d6b2ea3e4a@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 04/25] configs: stm32mp1: Enable
 BUTTON_GPIO flag for stm32mp15_trusted_defconfig
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

CgpPbiA0LzE3LzI0IDExOjA0LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDQvOS8yNCAxNzowMSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBFbmFibGUgQlVUVE9OX0dQ
SU8gZmxhZyBmb3IgU1RNMzJNUDE1Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3Rh
cmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGNvbmZpZ3Mv
c3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnIHwgMiArKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMybXAxNV90cnVz
dGVkX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnCj4+IGlu
ZGV4IDg0YjA4NTRiNTU3Li43NGRlYWFiYTJlNCAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9zdG0z
Mm1wMTVfdHJ1c3RlZF9kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9zdG0zMm1wMTVfdHJ1c3Rl
ZF9kZWZjb25maWcKPj4gQEAgLTcwLDYgKzcwLDggQEAgQ09ORklHX1RGVFBfVFNJWkU9eQo+PiDC
oCBDT05GSUdfVVNFX1NFUlZFUklQPXkKPj4gwqAgQ09ORklHX1NFUlZFUklQPSIxOTIuMTY4LjEu
MSIKPj4gwqAgQ09ORklHX1NUTTMyX0FEQz15Cj4+ICtDT05GSUdfQlVUVE9OPXkKPj4gK0NPTkZJ
R19CVVRUT05fR1BJTz15Cj4+IMKgIENPTkZJR19DTEtfU0NNST15Cj4+IMKgIENPTkZJR19TRVRf
REZVX0FMVF9JTkZPPXkKPj4gwqAgQ09ORklHX1VTQl9GVU5DVElPTl9GQVNUQk9PVD15Cj4gCj4g
UmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5j
b20+Cj4gCj4gVGhhbmtzCj4gUGF0cmljawo+IAoKQXBwbGllZCBvbiB1LWJvb3Qtc3RtMzIvbWFz
dGVyIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
