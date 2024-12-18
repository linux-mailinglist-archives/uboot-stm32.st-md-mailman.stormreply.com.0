Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E10E9F63A4
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:45:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 113E7C78012;
	Wed, 18 Dec 2024 10:45:27 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CA93C78014
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:45:24 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI7EeJS022006;
 Wed, 18 Dec 2024 11:45:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zRMvvVCDxfDuIZAEkBJfTJFg1QpqpCVxLqnXYodOt30=; b=b1HPqNaQnxWSDPA+
 4WMCMfrjUnEDJE1ZRwZHqFmbl5UsB4ggMmpyYnLNoMlHybY5piFx67R90Bz5JdwF
 wllWuaBwEF0zQ2PqUW9c+K1Mn9vGKX39a25cOxxejfJ78qCZpnMt3now5lKioOfN
 6KVX1h+JUnj5K3L2B1AExrSdBVpTSw+KbACkHUHbefqFw+Nr5LEPH51uqejj5LB7
 gblRlcURiUH0fBL21vAo5NEhrHWqDI7JlDSgRLQvaWh1bbaZpTH8EkNlrfoiZGk1
 yuGUgkQjqLZZ9Mvpr/R9z1n+zoe+EupVAU2prZTmy4aVc+jCfHpEXBK6AeuETtK9
 Thc+/A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43kfu8am95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:45:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 152124008A;
 Wed, 18 Dec 2024 11:44:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7546525EEA5;
 Wed, 18 Dec 2024 11:43:27 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:43:26 +0100
Message-ID: <c63bcb77-2f72-431f-b33e-067e51a3abde@foss.st.com>
Date: Wed, 18 Dec 2024 11:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241216102219.347725-1-patrice.chotard@foss.st.com>
 <20241216102219.347725-3-patrice.chotard@foss.st.com>
 <41a32d96-4563-422a-8164-4f995cd7769f@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <41a32d96-4563-422a-8164-4f995cd7769f@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/5] configs: stm32mp1: Restore boot SPL
 from sdcard for Engicam i.Core STM32MP1 EDIMM2.2
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

CgpPbiAxMi8xOC8yNCAxMDowNSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPiBIaSwKPiAKPiBP
biAxMi8xNi8yNCAxMToyMiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBSZXN0b3JlIGJvb3Qg
U1BMIGZyb20gc2RjYXJkIGZvciBFbmdpY2FtIGkuQ29yZSBTVE0zMk1QMSBFRElNTTIuMi4KPj4K
Pj4gRml4ZXM6IDJhMDBkNzNkMDgxYSAoInNwbDogbW1jOiBUcnkgdG8gY2xlYW4gdXAgcmF3LW1v
ZGUgb3B0aW9ucyIpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmlj
ZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gwqAgY29uZmlncy9zdG0zMm1wMTUt
aWNvcmUtc3RtMzJtcDEtZWRpbW0yLjJfZGVmY29uZmlnIHwgMyArKysKPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9zdG0zMm1w
MTUtaWNvcmUtc3RtMzJtcDEtZWRpbW0yLjJfZGVmY29uZmlnIGIvY29uZmlncy9zdG0zMm1wMTUt
aWNvcmUtc3RtMzJtcDEtZWRpbW0yLjJfZGVmY29uZmlnCj4+IGluZGV4IDNmN2VlYmQyMWQ4Li5i
NzMzOTEzYmUwMSAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy9zdG0zMm1wMTUtaWNvcmUtc3RtMzJt
cDEtZWRpbW0yLjJfZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZpZ3Mvc3RtMzJtcDE1LWljb3JlLXN0
bTMybXAxLWVkaW1tMi4yX2RlZmNvbmZpZwo+PiBAQCAtMjcsNiArMjcsOSBAQCBDT05GSUdfU1BM
X1NZU19NQUxMT0M9eQo+PiDCoCBDT05GSUdfU1BMX0hBU19DVVNUT01fTUFMTE9DX1NUQVJUPXkK
Pj4gwqAgQ09ORklHX1NQTF9DVVNUT01fU1lTX01BTExPQ19BRERSPTB4YzAzMDAwMDAKPj4gwqAg
Q09ORklHX1NQTF9TWVNfTUFMTE9DX1NJWkU9MHgxZDAwMDAwCj4+ICtDT05GSUdfU1BMX1NZU19N
TUNTRF9SQVdfTU9ERT15Cj4+ICtDT05GSUdfU1lTX01NQ1NEX1JBV19NT0RFX1VfQk9PVF9VU0Vf
UEFSVElUSU9OPXkKPj4gK0NPTkZJR19TWVNfTU1DU0RfUkFXX01PREVfVV9CT09UX1BBUlRJVElP
Tj0weDMKPj4gwqAgQ09ORklHX1NQTF9FTlZfU1VQUE9SVD15Cj4+IMKgIENPTkZJR19TUExfSTJD
PXkKPj4gwqAgQ09ORklHX1NQTF9QT1dFUj15Cj4gCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdHJpY2sg
RGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4gCj4gVGhhbmtzCj4gUGF0
cmljawo+IApBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMy
IG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290
LXN0bTMyCg==
